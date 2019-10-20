From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Oct 2019 16:19:35 +0200
Subject: [Buildroot] [git commit] package/gcc: or1k allow gcc 9.2 with
 uClibc-ng
Message-ID: <20191020141524.8EE12831C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05756279675bac305b7d5b04531c773a837ed177
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Binutils 2.32 and GCC 9.2 are now fixed thanks to Stafford Horne.

https://mailman.uclibc-ng.org/pipermail/devel/2019-August/001895.html

Fixes:
https://mailman.uclibc-ng.org/pipermail/devel/2019-August/001885.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index fc0333d08f..75be7c48cc 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -62,9 +62,6 @@ config BR2_GCC_VERSION_9_X
 	# or1k needs binutils >= 2.32
 	depends on !(BR2_or1k && \
 		(BR2_BINUTILS_VERSION_2_30_X || BR2_BINUTILS_VERSION_2_31_X))
-	# uClibc doesn't build with upstream or1k gcc
-	# https://mailman.uclibc-ng.org/pipermail/devel/2019-August/001885.html
-	depends on !(BR2_or1k && BR2_TOOLCHAIN_USES_UCLIBC)
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_powerpc_SPE
