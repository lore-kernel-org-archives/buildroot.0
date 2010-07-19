From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Mon, 19 Jul 2010 15:19:26 +0100
Subject: [Buildroot] ncurses: build freezes without error with v5.7
In-Reply-To: <20100719160559.2f7776ce@surf>
References: <1279123755.7058.242.camel@cabbage.rehill.info>
	<4C3E102D.50105@zacarias.com.ar>
	<1279192188.6184.2.camel@dubciaranr1.verifone.com>
	<AANLkTinsUwFgYEaRhtAwzO2I5Y2frnUunmtzBKTSveF9@mail.gmail.com>
	<1279202763.3572.22.camel@dubciaranr1.verifone.com>
	<AANLkTiks30hgwzuxxsGuxSPsP2iO1S7b1avRHCV9JllD@mail.gmail.com>
	<1279205058.3572.29.camel@dubciaranr1.verifone.com>
	<AANLkTiknnWawF0mRHGu73MxCCuAcGpYWxK-i-uaUKXub@mail.gmail.com>
	<1279212734.3572.42.camel@dubciaranr1.verifone.com>
	<AANLkTikfJUKA0Y1Wv8iJ2Wa8w4IspA5wY-WkhBmkWueV@mail.gmail.com>
	<1279272306.3572.93.camel@dubciaranr1.verifone.com>
	<AANLkTim6BMXBWILqIwNMe02j3PDl9TAWhT1n_pkUdBBI@mail.gmail.com>
	<1279288154.15465.18.camel@dubciaranr1.verifone.com>
	<1279535505.22010.3.camel@dubciaranr1.verifone.com>
	<20100719160559.2f7776ce@surf>
Message-ID: <1279549166.23669.7.camel@dubciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ar Luan, 2010-07-19 ag 16:05 +0200, scr?obh Thomas Petazzoni:
> NCURSES_USE_CONFIG_CACHE=NO
> 

Indeed that does make the rebuild work.

Probably not relevant, but if I have already built a v5.6 and then "rm
-rf output/build/ncurses-5.6" and then edit
"packages/ncurses/ncurses.mk" to use v5.7 and do make, I get this:

        /home/qvr/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-gcc --sysroot=/home/qvr/obair/buildroot.org/output/staging -pipe -Os  -mtune=arm1136jf-s -march=armv6j -mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  --param max-inline-insns-single=1200  -o ditto ../obj_s/ditto.o -Wl,-rpath,/home/qvr/obair/buildroot.org/output/build/ncurses-5.7/lib -L/home/qvr/obair/buildroot.org/output/staging/lib -L/home/qvr/obair/buildroot.org/output/staging/usr/lib -I../test -I. -DHAVE_CONFIG_H -I. -I../include  -D_GNU_SOURCE -DNDEBUG -pipe -Os  -mtune=arm1136jf-s -march=armv6j -mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  --param max-inline-insns-single=1200  -fPIC  `echo "-L../lib -lform -lmenu -lpanel -lncurses    " | sed -e 's/-lform.*-lpanel[^ ]*//'` -lutil  -lm 
        ../obj_s/ditto.o: In function `main':
        ditto.c:(.text+0x228): undefined reference to `use_screen'
        ditto.c:(.text+0x278): undefined reference to `use_screen'
        ditto.c:(.text+0x2ac): undefined reference to `use_screen'
        ditto.c:(.text+0x2e4): undefined reference to `use_screen'
        collect2: ld returned 1 exit status
        make[2]: *** [ditto] Error 1
        make[2]: Leaving directory `/home/qvr/obair/buildroot.org/output/build/ncurses-5.7/test'
        make[1]: *** [all] Error 2
        make[1]: Leaving directory `/home/qvr/obair/buildroot.org/output/build/ncurses-5.7'
        make: *** [/home/qvr/obair/buildroot.org/output/build/ncurses-5.7/.stamp_built] Error 2
