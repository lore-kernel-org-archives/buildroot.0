From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Thu, 17 Jan 2013 22:51:42 +0200
Subject: [Buildroot] RTLD_DEEPBIND and uClibc
In-Reply-To: <201301172138.34789.yann.morin.1998@free.fr>
References: <50F6A26D.4030607@petroprogram.com>
 <201301171844.27209.yann.morin.1998@free.fr>
 <50F84751.8090102@petroprogram.com>
 <201301172138.34789.yann.morin.1998@free.fr>
Message-ID: <50F8645E.2090600@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

17.1.2013 22:38, Yann E. MORIN kirjoitti:
> Stefan, All,
>
> On Thursday 17 January 2013 Stefan Fr?berg wrote:
>> 17.1.2013 19:44, Yann E. MORIN kirjoitti:
>>> The full set of libraries from a full-blown eglibc, for an ARM gnueabihf
>>> target, is:
>>>                       Unstripped    Stripped
>>> Only eglibc libs      3.6MiB         2.3MiB
>>> With gcc's libs       8.8MiB         3.0MiB
>>>
>>> And for a relatively complete uClibc for x86_64 target:
>>>                       Unstripped    Stripped
>>> Only eglibc libs      2.0MiB         1.0MiB
>>> With gcc's libs       6.9MiB         1.9MiB
>>>
>>> (gcc libs: libstdc++ and libgcc_s)
>>> (These are not the same architecture, but I went for the toolchains I have
>>> locally)
>>>
>>> So, typically, speaking only about the C library libs, the gain would be
>>> around ~1.5MiB.
>> Here's the contents of my target /lib
> [--SNIP--]
>> As you can see from the top of the line the total sum of uClibc + *all
>> the other stuff (pam etc..)* is just
>> 1.4 MB (the size of libuClibc-0.9.33.2.so itself is just 690 KB)
> uClibc == libuClibc.so + libutil.so + ld-uClibc.so + librt.so + libnsl.so
>           + libm.so + libdl.so + libcrypt.so
>
> Which totals around 905KiB in your case. Just about the number I gave
> you in my previous mail (mine was exactly 1004KiB). And the eglibc numbers
> are for the same set of libraries (plus all the libnss libs uClibc does
> not have).
>
>> So uClibc wins this round :-)
> Yes, in absolute numbers, uClibc *is* smaller than (e)glibc.
> We *never* said it was bigger.
>
> What Thomas and I are saying, is that you gained about 1.5MiB on your
> 520MiB filesystem. That's about a 0.29% gain. Was that worth the hassle?
> (Beside learning, of course.)

My gentoo box with similar configuration is 1500 MB. So yeah I think it
was worth the hassle :-)

Regards
Stefan
