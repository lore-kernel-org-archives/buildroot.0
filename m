From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sun, 09 Dec 2012 22:18:44 +0100
Subject: [Buildroot] [PATCH] package/crosstool-ng: update to 1.17.0
In-Reply-To: <201212092137.46147.yann.morin.1998@free.fr>
References: <1354564065-24388-1-git-send-email-c.schoenert@t-online.de>
 <1354564065-24388-2-git-send-email-c.schoenert@t-online.de>
 <87r4mzxad9.fsf@dell.be.48ers.dk>
 <201212092137.46147.yann.morin.1998@free.fr>
Message-ID: <50C50034.7040709@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann, Hello Peter,

Am 09.12.2012 21:37, schrieb Yann E. MORIN:
>> Unfortunately it doesn't seem to build here (ppl compilation issue):
>>
>> [ERROR]    /home/peko/source/buildroot/testctng/build/build-toolchain/.build/src/ppl-0.10.2/src/Interval.defs.hh:451:86: error: 'f_info' was not declared in this scope, and no declarations were found by argument-dependent lookup at the point of instantiation [-fpermissive]
>> [ALL  ]    In file included from /home/peko/source/buildroot/testctng/build/build-toolchain/.build/src/ppl-0.10.2/src/Interval.defs.hh:980:0
>>
>> Yann, Carsten - Any ideas? Googling around seems to suggest that this is
>> related to a host-gcc 4.7.x issue, but people are quite likely to be
>> using that nowadays, so what to do? Build with -fpermissive?

I remember I ran into similar problems with ppl-010.2 while I try to
find a setup for a arm crosscompiler with gcc4.7.1. After choosing
ppl-0.11.2 and setting the switch -fpermissive the build was successful
(but of course with a lot warnings while global settings for LDFLAGS).

> Yes, it requires -fpermissive to build with gcc-4.7.

Right, GCC greater 4.6 are more strict while syntax checking, so without
-fpermissive actual compiler in Debian wheezy will give up. But for me
is setting -fpermisse just a temporaly solution. Newer GCCs will always
give up in such cases and that's correct.

> I am using a Debian squeeze that has a gcc-4.4, so I can't test it.
> I'll try in a wheezy chroot soonish.

No need for that. :-)
Wheezy use the current GCC 4.7.2 and the sources need a patch to correct
the source or the switch -fpermissive.

Because I don't know exactly how to patch the source (I don't have take
a deep look into it) or the Makefile for ppl-0.1x.x inside the
crosstool-ng environment I can't provide some useful right now.

-- 
Regards
Carsten
