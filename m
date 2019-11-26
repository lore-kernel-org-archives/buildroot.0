From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 12:51:59 +0100
Subject: [Buildroot] [git commit] package/glibc: install locale utility when
 NLS is enabled
Message-ID: <20191202083935.8AA0E7FCED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb1ee93ca4378456774e1ae24fcf370417733a38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/Config.in | 2 +-
 package/glibc/glibc.mk  | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 323767fc8a..b8c2573d96 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_GLIBC_UTILS
 	depends on BR2_PACKAGE_BASH
 	help
 	  Enabling this option will compile and install the getconf,
-	  ldconfig and ldd glibc utilities for the target.
+	  ldconfig, ldd and locale glibc utilities for the target.
 
 comment "glibc utilities need bash"
 	depends on !BR2_PACKAGE_BASH
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 5da0b064a2..e366134026 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -146,7 +146,10 @@ endif
 ifeq ($(BR2_PACKAGE_GLIBC_UTILS),y)
 GLIBC_TARGET_UTILS_USR_BIN = posix/getconf elf/ldd
 GLIBC_TARGET_UTILS_SBIN = elf/ldconfig
+endif
 
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+GLIBC_TARGET_UTILS_USR_BIN += locale/locale
 endif
 
 define GLIBC_INSTALL_TARGET_CMDS
