From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 22:36:17 +0100
Subject: [Buildroot] [git commit] package/glibc: install locale utility only
 when BR2_PACKAGE_GLIBC_UTILS=y
Message-ID: <20191202083935.94D5F82884@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=283c5d474ee23bd00c111bb3b21a2d2d0eb3f80b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: fb1ee93ca4378456774e1ae24fcf370417733a38

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/glibc.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index e366134026..4dc87e2f27 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -146,11 +146,10 @@ endif
 ifeq ($(BR2_PACKAGE_GLIBC_UTILS),y)
 GLIBC_TARGET_UTILS_USR_BIN = posix/getconf elf/ldd
 GLIBC_TARGET_UTILS_SBIN = elf/ldconfig
-endif
-
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 GLIBC_TARGET_UTILS_USR_BIN += locale/locale
 endif
+endif
 
 define GLIBC_INSTALL_TARGET_CMDS
 	for libpattern in $(GLIBC_LIBS_LIB); do \
