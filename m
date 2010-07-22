From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Thu, 22 Jul 2010 04:57:23 +0200
Subject: [Buildroot] AVR32 is broken (toolchain)
In-Reply-To: <AANLkTikKS2AppP8zpPudDFbKvchDZvlpfQeTb-TKKvT2@mail.gmail.com>
References: <AANLkTinBXtX-xDYtM5V8pTrwNpkDKBHSpz9MKnQ8mypa@mail.gmail.com>
	<201007220352.37255.PeterHuewe@gmx.de>
	<AANLkTikKS2AppP8zpPudDFbKvchDZvlpfQeTb-TKKvT2@mail.gmail.com>
Message-ID: <201007220457.24834.PeterHuewe@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter 	> I'll have a look into it - currently the code still compiles :)
Thiago 	> What do you mean it still compiles?
This just means that my machine is a little bit slow and it takes awhile to 
compile buildroot.


Thiago > I get an error building the toolchain, something along the lines of:
Thiago > make[3]: *** Waiting for unfinished jobs....
Thiago > /root/buildroot-head/output/toolchain/gcc-4.2.2-avr32-2.1.5-
final/./gcc/as:
Thiago > line 2: exec: --: invalid option
Thiago> exec: usage: exec [-cl] [-a name] [command [arguments ...]] 
[redirection
Thiago >  ...] make[3]: *** [crtbeginS.o] Error 1

Yeah - I can reproduce this issue.

However I got another error first (something like avr32-.....-ar: command not 
found). But I got the same error after adding the 
        AR_FOR_BUILD="$(HOSTAR)" \
        AR_FOR_TARGET="$(TARGET_AR)" \
 lines again.

Currently I'm trying compiling a version of BR with and without the changes in 
Thomas' commit - tomorrow I'll compare the output :)

Thanks,
Peter
