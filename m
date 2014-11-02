From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 2 Nov 2014 18:58:13 +0100
Subject: [Buildroot] [PATCH] lttng-tools: Update hash file after silent
	update
In-Reply-To: <20141102172003.GA16018@free.fr>
References: <cover.1414941796.git.yann.morin.1998@free.fr>
 <1414945495-22530-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20141102172003.GA16018@free.fr>
Message-ID: <CAGduivwW6Cn=3FzvP_0YZwxdMzLHwLOta3EZiGjZi0V07TM3Ag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Romain, all

On Sun, Nov 2, 2014 at 6:20 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Maxime, All,
>
> On 2014-11-02 17:24 +0100, Maxime Hadjinlian spake thusly:
>> The tarballs for 2.5.1 have been silently updated by upstream at
>> '2014-10-31 15:35'.
>
> Grr... :-(
>
> However, the other LTTng archives still have the same hashes... :-(
>
>> This fixes:
>> http://autobuild.buildroot.net/results/a2a/a2ab3c526a3f67371524e1b076512cf1f8058c72/build-end.log
>>
>> Signed-off-by Maxime Hadjinlian <maxime.hadjinlia@gmail.com>
>> Cc: Romain Naour <romain.naour@openwide.fr>
>
> Manualy downloaded, and manually checked the hash.
>
> However, I NAK this change, because the archive has changed a *lot*:
>     http://code.bulix.org/z2c8r0-87331?raw
>
> Also, notice this file:
>     lttng-tools-2.5.1/tests/regression/tools/save-load/ /tmp/tmp.eAJ1f0oCZE/test-42/save-42.lttng
>
> Yes, that's a single filename with a space in it (but the new archives
> removes it, although it still is in the repository).
>
> So, Maxime and Romain, please talk to upstream about this issue.
>
> In the meantime, I prefer we do *not* update the hash until we have a
> sensible answer from the LTTng folks, or at least until later in the
> release cycle.
Indeed do not apply this patch, it seems the lttng folks have messed
up their releases, I'll report a bug.
Thanks Yann for finding this.
>
> Regards,
> Yann E. MORIN.
>
>> ---
>> Thanks to Romain Naour for pointing this out on IRC.
>> ---
>>  package/lttng-tools/lttng-tools.hash | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
>> index c0c4bc1..92a4401 100644
>> --- a/package/lttng-tools/lttng-tools.hash
>> +++ b/package/lttng-tools/lttng-tools.hash
>> @@ -1,2 +1,2 @@
>>  # Locally generated
>> -sha256  3c6511e6ceef975cfe36b5644ab9bfaa6780c71b1d2551718279823924429739  lttng-tools-2.5.1.tar.bz2
>> +sha256  1084ce1fac0030cb5e0e3e117002444ceb9f94d6a15a6cce6607c480eca9b21b  lttng-tools-2.5.1.tar.bz2
>> --
>> 2.1.1
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
