From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 May 2012 09:50:56 +0200
Subject: [Buildroot] [PATCH 1/2] binutils: not available on avr32
Message-ID: <1336981857-4221-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/0be38d4a16a7b6322367116a6d0bc285f73b7436/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in |    1 +
 package/oprofile/Config.in |    2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/binutils/Config.in b/package/binutils/Config.in
index e068b20..59e9529 100644
--- a/package/binutils/Config.in
+++ b/package/binutils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_BINUTILS
 	bool "binutils"
+	depends on !BR2_avr32
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index 562c910..d7e2065 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_OPROFILE
 	bool "oprofile"
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_BINUTILS
+	# binutils for target not available on avr32
+	depends on !BR2_avr32
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  OProfile is a system-wide profiler for Linux systems,
-- 
1.7.9.5
