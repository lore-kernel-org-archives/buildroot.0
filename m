From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Feb 2012 22:28:49 +0100
Subject: [Buildroot] Bug/Typo in ffmpeg.mk
In-Reply-To: <20120213210552.192510@gmx.net> (universeII@gmx.de's message of
 "Mon, 13 Feb 2012 22:05:52 +0100")
References: <20120213210552.192510@gmx.net>
Message-ID: <87ty2uwhgu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "universeII" == universeII  <universeII@gmx.de> writes:

 universeII> Hi buildroot guys,

 universeII> I just found the buildroot project due to a magazine
 universeII> article and I'm really impressed how simple cross compiling
 universeII> is using this tool.

Thanks. Out of interest, what magazine was that?

 universeII> I'm trying to create a system for a 7400 power-pc and I
 universeII> think I found a typo in
 universeII> /package/multimedia/ffmpeg/ffmpeg.mk

 universeII> line 148 is:
 universeII> FFMPEG_CONF_OPT -= --enable-altivec

 universeII> but should be:
 universeII> FFMPEG_CONF_OPT += --enable-altivec

Good catch! I've fixed it in git now.

 universeII> My first step is to try running the new kernel/system in
 universeII> qemu, but I'm not sure which option to parameter -M is the
 universeII> correct one for the 7400 CPU.

I'm not sure for 7400 either (perhaps check on the qemu list), but we do
have a ppc qemu defconfig (make qemu_ppc_g3beige_defconfig). See
board/qemu/powerpc-g3beige/readme.txt for details of qemu options.

-- 
Bye, Peter Korsgaard
