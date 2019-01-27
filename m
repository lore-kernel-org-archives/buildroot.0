From: Woody Wu <narkewoody@gmail.com>
Date: Mon, 28 Jan 2019 01:06:29 +0800
Subject: [Buildroot] Building host-python-2.7.15 Failed
In-Reply-To: <CAAsE_uc6pTbBHu_UgUSSaTyEbyKocPpEcSJK9hgz+UsMBN=QoQ@mail.gmail.com>
References: <CAAsE_udvpXEBB_euZymg+QHajf5oC5SSywpOCvoiY=Oyan2Xog@mail.gmail.com>
 <8017d9a3-290f-f8de-8e13-55430ace2b77@mind.be>
 <20190126151022.23c5a011@windsurf>
 <CAAsE_uc6pTbBHu_UgUSSaTyEbyKocPpEcSJK9hgz+UsMBN=QoQ@mail.gmail.com>
Message-ID: <CAAsE_ucb7QYz1MQcdk8Cf_N9Oni7ZTjQnLZ8tNXZgWpFZKCi3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

I checked my ubuntu 18.04.  It has /lib/x86_64-linux-gnu/libcrypt.so.1 and
no libcrypt.so.


On Sun, Jan 27, 2019 at 12:27 AM Woody Wu <narkewoody@gmail.com> wrote:

> Yes, it's ubuntu 18.10.  I think I did not touch the libcrypt.  You guys
> gave out a very good point!  I will check it and try to find out.  I will
> report back you.  Today is too late.
>
> On Sat, Jan 26, 2019 at 10:10 PM Thomas Petazzoni <
> thomas.petazzoni at bootlin.com> wrote:
>
>> Hello,
>>
>> On Sat, 26 Jan 2019 00:34:31 +0100, Arnout Vandecappelle wrote:
>> > On 19/01/2019 17:15, Woody Wu wrote:
>> > > /usr/bin/gcc -pthread -shared
>> > >
>> -L/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/lib
>> > >
>> -Wl,-rpath,/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/lib
>> > > -Wl,--enable-new-dtags
>> > >
>> build/temp.linux-x86_64-2.7/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/build/host-python-2.7.15/Modules/cryptmodule.o
>> > >
>> -L/home/woody/beacon-cross-build/buildroot/buildroot-2018.11.1/output/host/lib
>> > > -L/usr/lib/x86_64-linux-gnu -L/usr/local/lib -L. -lcrypt -lpython2.7
>> -o
>> > > build/lib.linux-x86_64-2.7/crypt.so
>> > > /usr/bin/ld: /usr/lib/x86_64-linux-gnu/libcrypt.a(crypt-entry.o):
>> relocation
>> > > R_X86_64_PC32 against symbol `_ufc_foobar' can not be used when
>> making a shared
>> > > object; recompile with -fPIC
>> >
>> >  There is something wrong with your host compiler. There should be a
>> > /lib*/libcrypt.so that the compiler links against, instead of
>> > /usr/lib/libcrypt.a. On which distro do you work?
>>
>> Woody said: "My building system is ubuntu 18.10"
>>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>
>
> --
> Life is the only flaw in an otherwise perfect nonexistence
>     -- Schopenhauer
>
> woody
> public key at http://subkeys.pgp.net:11371 (narkewoody at gmail.com)
>
>

-- 
Life is the only flaw in an otherwise perfect nonexistence
    -- Schopenhauer

woody
public key at http://subkeys.pgp.net:11371 (narkewoody at gmail.com)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190128/7964740f/attachment.html>
