From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2012 22:45:34 +0100
Subject: [Buildroot] first things first for a newbie
In-Reply-To: <CAPEB33x-LxCP9mz0hhH6dr5-Hftke3EjNLyVMt4s7kfd_0cCiw@mail.gmail.com>
References: <CAPEB33x-LxCP9mz0hhH6dr5-Hftke3EjNLyVMt4s7kfd_0cCiw@mail.gmail.com>
Message-ID: <20120128224534.4787e302@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sat, 28 Jan 2012 19:32:50 +0000,
MERCADIER Johann <johann.mercadier@imerir.com> a ?crit :

>   But! nothing seems to way it should and I feel pretty annoyed by
> this as I cannot find any relevant help on the internet or through
> misc. books. Most of the time what I found is tutorial where
> everything seems to work fine.
>   So my first question is why Buildroot has no Forum or a good
> developped FAQ? I don't really understand why it so great to work
> with mailing list? If I have to I will do it this way  (o_-)

We have :

 * Some documentation, available in docs/manual/, and that you can
   generate using "make manual" ;

 * This mailing-list, which is the traditional way of providing support
   in the free software / open-source world ;

 * The #buildroot IRC channel on Freenode

>   When I try to build the TC it doesn't work well and I get an issue

What is "TC" ?

> with 'gettext' while I've got everything on my host computer. I then

Which issue ?

> remove all related part to gettext as i18n stuff and WCHAR then I got
> a TC. Then I do again a 'make menuconfig' add the locale and do a
> 'time make V=1' I got a TC whith the locale. strange behaviour,
> probably some dependencies and jobs to be done in a given order?

When you change toolchain options, you need to do a full rebuild, i.e
'make clean' followed by 'make'. Buildroot does not try to be smart,
and therefore does not rebuild anything unless you tell him to do so.

>   On the next stage I try to go further  configuring the uClibc,
> busybox, and file support everything working fine, then I got such a
> kind of error if I try to add GDB for the target, host, and server
> part "
> /media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot-2011.11/output/toolchain/gdb-7.3.1/readline/support/wcwidth.c:22:29:
> error: expected ')' before 'ucs'
> /media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot-2011.11/output/toolchain/gdb-7.3.1/readline/support/wcwidth.c:72:21:
> error: expected ')' before 'ucs'
> /media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot-2011.11/output/toolchain/gdb-7.3.1/readline/support/wcwidth.c:139:28:
> error: expected ';', ',' or ')' before '*' token
> /media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot-2011.11/output/toolchain/gdb-7.3.1/readline/support/wcwidth.c:161:32:
> error: expected ')' before 'ucs'
> /media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot-2011.11/output/toolchain/gdb-7.3.1/readline/support/wcwidth.c:230:32:
> error: expected ';', ',' or ')' before '*' token
> make[3]: *** [wcwidth.o] Error 1
> make[2]: *** [all-readline] Error 2
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [all] Error 2
> make: ***
> [/media/hddPANDAdev/ARMSTUFF/LTiB/BR/buildroot-2011.11/output/build/gdb-7.3.1-target/gdb/gdb]
> Error 2

Please post the Buildroot .config file that allows you to produce this
build error, and we will try to reproduce it.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
