From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Apr 2020 22:48:58 +0200
Subject: [Buildroot] [git commit] package/dtc: bump version to 1.6.0
Message-ID: <20200419203443.56C8B8F306@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=198db470a73c14191915f8374362bc2a8b08c2bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When host compiler is gcc 10 (for example on Fedora 32), dtc 1.5.1
fail to build with the error:
/usr/bin/ld: dtc-parser.tab.o:(.bss+0x20): multiple definition of `yylloc'; dtc-lexer.lex.o:(.bss+0x0): first defined here
collect2: error: ld returned 1 exit status

dtc 1.6.0 fixes this issue in the commit:
https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/?id=0e9225eb0dfec51def612b928d2f1836b092bc7e

Also adopt new spacing convention in .hash files (two spaces).

Signed-off-by: Julien Olivain <juju@cotds.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dtc/dtc.hash | 8 ++++----
 package/dtc/dtc.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/dtc/dtc.hash b/package/dtc/dtc.hash
index e4d6c02544..902ce1baf9 100644
--- a/package/dtc/dtc.hash
+++ b/package/dtc/dtc.hash
@@ -1,7 +1,7 @@
 # from https://www.kernel.org/pub/software/utils/dtc/sha256sums.asc
-sha256 660b74039690fc37013660544d09191834efb58503c73c555c5513ba75ab031f  dtc-1.5.1.tar.xz
+sha256  10503b0217e1b07933e29e8d347a00015b2431bea5f59afe0bed3af30340c82d  dtc-1.6.0.tar.xz
 
 # Hash for license files
-sha256 78e1e1ce5728a990d59c7de61d4741c49185d5129daf783b386380a214328d68  README.license
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL
-sha256 6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  BSD-2-Clause
+sha256  78e1e1ce5728a990d59c7de61d4741c49185d5129daf783b386380a214328d68  README.license
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  GPL
+sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  BSD-2-Clause
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index d532487dd1..956a60b29d 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTC_VERSION = 1.5.1
+DTC_VERSION = 1.6.0
 DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
 DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
 DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)
