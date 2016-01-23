From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 23 Jan 2016 21:57:59 +0100
Subject: [Buildroot] [PATCH] package/iprutils: disable for musl toolchains
Message-ID: <1453582679-30476-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable iprutils for musl toolchain until someone
is interested enough to fixes it.

Note: the latest version (2.4.10) doesn't event build
with uClibc due to a test in the new configure script.

AC_CHECK_LIB([m], [matherr], [], [AC_ERROR("libm not found.")])

Avoid:
http://autobuild.buildroot.net/results/61e/61e121c25fc07083bcccedfcb4f938d18f5c5456/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/iprutils/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/iprutils/Config.in b/package/iprutils/Config.in
index 1bc58e8..709aee6 100644
--- a/package/iprutils/Config.in
+++ b/package/iprutils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_IPRUTILS
 	bool "iprutils"
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_NCURSES_TARGET_PANEL
 	select BR2_PACKAGE_NCURSES_TARGET_FORM
@@ -11,3 +12,6 @@ config BR2_PACKAGE_IPRUTILS
 	  System utilities for IBM Power RAID devices
 
 	  http://sourceforge.net/projects/iprdd/
+
+comment "iprutils needs a glibc or uClibc toolchain"
+	depends on BR2_TOOLCHAIN_USES_MUSL
-- 
2.4.3
