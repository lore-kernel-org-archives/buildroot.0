From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Mon, 23 Jun 2008 10:50:32 +0200
Subject: [Buildroot] cris
In-Reply-To: <485F507D.5070801@cetrtapot.si>
References: <485A3396.80701@cetrtapot.si>
	<87iqw5dyyb.fsf@macbook.be.48ers.dk>	<20080620083646.GB12682@mx.loc>
	<485B6CF6.7040901@cetrtapot.si>	<20080620125720.GE12682@mx.loc>
	<485BAFF8.8090604@cetrtapot.si>	<20080620141152.GG12682@mx.loc>
	<485F507D.5070801@cetrtapot.si>
Message-ID: <485F63D8.2050809@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hinko Kocevar wrote:
> Bernhard Fischer wrote:
>> [I'm changing the subject to something more suitable]
>> On Fri, Jun 20, 2008 at 03:26:16PM +0200, Hinko Kocevar wrote:
>>> Bernhard Fischer wrote:
>>>> On Fri, Jun 20, 2008 at 10:40:22AM +0200, Hinko Kocevar wrote:
>>>>
>>>>> With gcc 4.3.1 gcc internal errors went away, so I'm really glad I found the GIT tree!
>>>> I have improved (i hope) the cris support, configuration-wise, please
>>>> pull and let me know if it suits your needs.
>>>>
>>> 1. Compilation of uClibc always fails with:
>>>
>>> make[1]: Entering directory `/work/stage/git.br/toolchain_build_cris/uClibc-0.9.29'
>>> make[2]: `conf' is up to date.
>>> /usr/bin/make locale_headers
>>> make[3]: `conf' is up to date.
>>>  CC ldso/ldso/ldso.oS
>>>  AS ldso/ldso/cris/resolve.oS
>>>  CC ldso/libdl/libdl.oS
>>>  CC libcrypt/crypt.os
>>>  CC libcrypt/des.os
>>> In file included from ./include/sys/param.h:22,
>>>                 from libcrypt/des.c:62:
>>> ./include/limits.h:124:26: error: limits.h: No such file or directory
>>> make[1]: *** [libcrypt/des.os] Error 1
>>> make[1]: *** Waiting for unfinished jobs....
>>> make[1]: Leaving directory `/work/stage/git.br/toolchain_build_cris/uClibc-0.9.29'
>>> make: *** [/home/hinkok/work/stage/git.br/toolchain_build_cris/uClibc-0.9.29/lib/libc.a] Error 2
>> I don't see this. Is that uClibc-trunk or something else?
> 
> Me too, will rebuild with and wo sysroot as I suspect to meka a difference..

No difference. In other words, I can't install binutils 2.18 wo using sysroot.
But using gcc 4.2.3 instead of 4.3.1 does not generate the error!

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
