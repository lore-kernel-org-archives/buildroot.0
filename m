From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Feb 2019 23:15:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/ibrcommon: fix static build
 with openssl
In-Reply-To: <20190216112319.4769-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 16 Feb 2019 12:23:19 +0100")
References: <20190216112319.4769-1-fontaine.fabrice@gmail.com>
Message-ID: <87a7ikg7ey.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > gf_mul is already defined in libcrypto (openssl) so rename it into
 > ibrdtn_gf_mul to fix the following build failure in ibrdtnd package:

 > /home/buildroot/autobuild/instance-3/output/host/bin/../arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib/libcrypto.a(f_impl.o):
 > In function `gf_mul':
 > f_impl.c:(.text+0x0): multiple definition of `gf_mul'
 > /home/buildroot/autobuild/instance-3/output/host/arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib/libibrcommon.a(gf128mul.o):gf128mul.cpp:(.text+0x30):
 > first defined here
 > collect2: error: ld returned 1 exit status
 > Makefile:560: recipe for target 'dtnd' failed

 > Fixes:
 >  - http://autobuild.buildroot.org/results/1d3b4b6cf043a3e185ce758b617a0a18c3d36cdb

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

The DOS newlines unfortunately got stripped by the mailing list, so the
patch no longer applies. I have manually fixed that up now.

-- 
Bye, Peter Korsgaard
