From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Nov 2012 15:36:14 +0100
Subject: [Buildroot] [PATCH] binutils: not available for the target on
	AArch64
Message-ID: <1354113374-15476-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/74082860f607cbd857654e9504f5f7e7ae47c0ac/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in |    1 +
 package/oprofile/Config.in |    1 +
 2 files changed, 2 insertions(+)

diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index 6480370..38d519a 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_BINUTILS
 	bool "binutils"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	depends on !BR2_aarch64
 	help
 	  Install binutils on the target
 
diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index 562c910..8c881d1 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_OPROFILE
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_BINUTILS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_aarch64 # binutils
 	help
 	  OProfile is a system-wide profiler for Linux systems,
 	  capable of profiling all running code at low overhead.
-- 
1.7.9.5
