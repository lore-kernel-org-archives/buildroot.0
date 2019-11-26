From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Tue, 26 Nov 2019 15:59:03 +0100
Subject: [Buildroot] [PATCH] package/glibc: do install locale unless other
 utils are installed as well
Message-ID: <20191126145903.12234-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: fb1ee93ca4378456774e1ae24fcf370417733a38

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/glibc/glibc.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index e366134..4dc87e2 100644
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
-- 
2.7.4
