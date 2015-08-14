From: Nimai Mahajan <nimaim@gmail.com>
Date: Fri, 14 Aug 2015 08:29:38 -0400
Subject: [Buildroot] [PATCH 1/1] protobuf/protobuf-c: bump versions
In-Reply-To: <20150814121935.GA4017@free.fr>
References: <1439516481-3375-1-git-send-email-nimaim@gmail.com>
 <20150814121935.GA4017@free.fr>
Message-ID: <CALoSW66YprLV_WKuWUrPgzT9hL2JzBh69ggg2dNE3rxEkXohXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 14, 2015 at 8:19 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Nimai, All,
>
> On 2015-08-13 21:41 -0400, Nimai Mahajan spake thusly:
>> From: Nimai Mahajan <nimaim@gmail.com>
>>
>> Signed-off-by: Nimai Mahajan <nimaim@gmail.com>
>> ---
>>  package/protobuf-c/protobuf-c.mk | 2 +-
>>  package/protobuf/protobuf.mk     | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
>> index d73eb25..ee4500e 100644
>> --- a/package/protobuf-c/protobuf-c.mk
>> +++ b/package/protobuf-c/protobuf-c.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>
>> -PROTOBUF_C_VERSION = v1.0.0-rc1
>> +PROTOBUF_C_VERSION = v1.1.1
>>  PROTOBUF_C_SITE = $(call github,protobuf-c,protobuf-c,$(PROTOBUF_C_VERSION))
>>  PROTOBUF_C_DEPENDENCIES = host-protobuf-c
>>  HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf
>> diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
>> index 0426fce..144e5fb 100644
>> --- a/package/protobuf/protobuf.mk
>> +++ b/package/protobuf/protobuf.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>
>> -PROTOBUF_VERSION = v2.5.0
>> +PROTOBUF_VERSION = v2.6.1
>
> Last time we tried to bump protobuf to v2.6.0, we got a lot of build
> failures, so the bump was reverted;
>     http://git.buildroot.org/buildroot/commit/?id=7b6304af9d69d44ee3040c00b0670f19c02de7d2
>     http://git.buildroot.org/buildroot/commit/?id=61ae22810a8ca90d3b904d89eb3892c6cf92e87c

Sorry, I had no idea this was already tried to be pushed up ... I did
try to search for this but gmane doesn't make that very easy.

>
> Did you test under various conditions, such as:
>   - static-only  (2.5.0 currently fails in this case, I'm lookimng into it)
>   - the various supported architectures: arm, i386, mipsel, x86_64
>   - with various C libraries: uClibc, musl, glibc
>
> If you did, then good! :-)

Bah no I did not :-( I only tested with arm and i386 and glibc as I
have toolchains for these both. I would love to set up an environment
where I can test all these combinations more easily before pushing
something up ... what would be your recommendation for doing that?

>
> Otherwise, I'd like this bump to at least be tested in the musl and
> static-only scenario (to see if that improves the situation...)
>
> Also, it seems v2.6.x adds proper support for PowerPC.

Yes, 2.6.1 also fixes a bunch of bugs (we use protocol buffers in
production code and can attest to this) so I wanted to get it up there
but needs a lot more testing with getting built with various
configurations first.

I can certainly at least try a musl static build with this.

>
> Thanks! :-)
>
> Regards,
> Yann E. MORIN.
>
>>  PROTOBUF_SITE = $(call github,google,protobuf,$(PROTOBUF_VERSION))
>>  PROTOBUF_LICENSE = BSD-3c
>>  PROTOBUF_LICENSE_FILES = COPYING.txt
>> --
>> 1.9.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
