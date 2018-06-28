From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Jun 2018 23:15:44 +0200
Subject: [Buildroot] [PATCH v1] package/gcc: backport arm acle bugfix
 81497
In-Reply-To: <20180612194939.21718-1-gael.portay@savoirfairelinux.com>
References: <20180612194939.21718-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180628231544.031fe54d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Jun 2018 15:49:39 -0400, Ga?l PORTAY wrote:
> The compiler g++ reports an error when the header arm_acle.h is
> included from version 7.
> 
> This patch backports the bugfix upstreamed[1] for gcc-7 and gcc-8.
> 
> Fixes:
> 
> 	In file included from ../../include/QtCore/5.10.1/QtCore/private/../../../../../src/corelib/tools/qsimd_p.h:333,
> 	                 from ../../include/QtCore/5.10.1/QtCore/private/qsimd_p.h:1,
> 	                 from global/qlogging.cpp:58:
> 	/home/gportay/src/buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/8.1.0/include/arm_acle.h: In function ?void __arm_ldc(unsigned int, unsigned int, const void*)?:
> 	/home/gportay/src/buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/8.1.0/include/arm_acle.h:48:46: error: invalid conversion from ?const void*? to ?const int*? [-fpermissive]
> 	   return __builtin_arm_ldc (__coproc, __CRd, __p);
>                                               ^~~
> 	<built-in>: note:   initializing argument 3 of ?void __builtin_arm_ldc(unsigned int, unsigned int, const int*)?
> 	...
> 	Makefile:196: recipe for target 'sub-corelib-make_first' failed
> 	make[3]: *** [sub-corelib-make_first] Error 2
> 	Makefile:48: recipe for target 'sub-src-make_first' failed
> 	make[2]: *** [sub-src-make_first] Error 2
> 	package/pkg-generic.mk:229: recipe for target '/home/gportay/src/buildroot/output/build/qt5base-5.10.1/.stamp_built' failed
> 	make[1]: *** [/home/gportay/src/buildroot/output/build/qt5base-5.10.1/.stamp_built] Error 2
> 	Makefile:16: recipe for target '_all' failed
> 	make: *** [_all] Error 2
> 
> [1]: https://gcc.gnu.org/bugzilla//show_bug.cgi?id=81497
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
> Hi all,

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
