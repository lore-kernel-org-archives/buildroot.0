From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 20 Sep 2020 17:06:57 +0200
Subject: [Buildroot] [PATCH v1 1/3] package/glibc: install locale cmd
 independent of NLS
Message-ID: <20200920150659.7562-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/glibc/glibc.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index f2b5b4caf6..99c71b6eac 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -158,10 +158,8 @@ endif
 ifeq ($(BR2_PACKAGE_GLIBC_UTILS),y)
 GLIBC_TARGET_UTILS_USR_BIN = posix/getconf elf/ldd
 GLIBC_TARGET_UTILS_SBIN = elf/ldconfig
-ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 GLIBC_TARGET_UTILS_USR_BIN += locale/locale
 endif
-endif
 
 define GLIBC_INSTALL_TARGET_CMDS
 	for libpattern in $(GLIBC_LIBS_LIB); do \
-- 
2.28.0
