From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Aug 2015 23:47:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/x264: Fix aarch64 support,
	bump version
In-Reply-To: <1440935601-19009-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sun, 30 Aug 2015 13:53:21 +0200")
References: <1440935601-19009-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87613wtpnp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > The current x264 revision fails to include asm code from common/aarch64
 > which is needed by packages linking to x264, like ffmpeg:

 > Quoting
 > http://autobuild.buildroot.net/results/189/189f215bcbc510cd292c0f337fe6b39979f01813//ffmpeg-2.7.2/config.log

 > /home/test/autobuild/instance-3/output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libx264.so:
 >  undefined reference to `x264_deblock_h_chroma_422_intra_neon'

 > Function "chroma_422_intra_neon" is defined in
 > x264/common/aarch64/deblock-a.S. The code in
 > x264/common/aarch64/* is only compiled if an
 > assembler was found:
 > http://git.videolan.org/?p=x264.git;a=blob;f=Makefile;h=6193c5936939fda36f9a2e00c734223318ccda14;hb=HEAD#l134

 > To allow this add BR2_aarch64 as an assembler-enabled arch.

 > This however breaks compilation due to broken NEON detection:
 > "no NEON support, try adding -mfpu=neon to CFLAGS
 > If you really want to run on such a CPU, configure with --disable-asm."

 > The bug was fixed upstream Jul, 25th, 2015:
 > http://git.videolan.org/?p=x264.git;a=commit;h=73ae2d11d472d0eb3b7c218dc1659db32f649b14

 > When we already have to do a version bump let's take the latest one ;)

 > Fixes
 > http://autobuild.buildroot.net/results/90a/90ae4b2fa8a6cff0f18abea2b1c45282afe99e4b/
 > http://autobuild.buildroot.net/results/109/109686cbc8327e62f757db576cfff49c490b52ae/
 > http://autobuild.buildroot.net/results/189/189f215bcbc510cd292c0f337fe6b39979f01813/

I wasn't sure if we want this for 2015.08 or next, but as it fixes
autobuilder issues I decided to take it for 2015.08.

Committed, thanks.

-- 
Bye, Peter Korsgaard
