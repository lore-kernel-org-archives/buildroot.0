From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Thu, 17 Sep 2015 11:28:43 +0100
Subject: [Buildroot] sysvinit-2.88 build is failing for ARM64
In-Reply-To: <ec4144432f3279ce0594dd6adbd847f5e4a7fb13.1442482205.git.jpinto@synopsys.com>
References: <ec4144432f3279ce0594dd6adbd847f5e4a7fb13.1442482205.git.jpinto@synopsys.com>
Message-ID: <55FA95DB.80408@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,

I am trying to build sysvinit-2.88 for ARM64 and it is failing as shown bellow:

Error log:

droot-linux-gnu/sysroot -C
/media/Dev_Disk/buildroot-junor1/output/build/sysvinit-2.88/src
make[1]: Entering directory
`/media/Dev_Disk/buildroot-junor1/output/build/sysvinit-2.88/src'
/media/Dev_Disk/buildroot-junor1/output/host/usr/bin/aarch64-linux-gnu-gcc
sulogin.o    -o sulogin
/media/Dev_Disk/buildroot-junor1/output/host/usr/bin/aarch64-linux-gnu-gcc
last.o oldutmp.h   -o last
sulogin.o: In function `main':
sulogin.c:(.text.startup+0x648): undefined reference to `crypt'
collect2: error: ld returned 1 exit status
make[1]: *** [sulogin] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory
`/media/Dev_Disk/buildroot-junor1/output/build/sysvinit-2.88/src'
make: ***
[/media/Dev_Disk/buildroot-junor1/output/build/sysvinit-2.88/.stamp_built] Error 2

I have checked from mailing history that this problem has already been addressed
and tested against X86_64. Did anyone tested in ARM64?
In the meanwhile I will try to fix this problem and I will send the fix patch.

Thanks,
Joao
