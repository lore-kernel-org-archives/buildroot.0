From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 28 Nov 2012 11:35:43 -0800
Subject: [Buildroot] [git commit] binutils: not available for the target on
	AArch64
Message-ID: <20121128193726.3439280F4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=660d16f490500ce02c3e4eb78384bfa08a5589c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/74082860f607cbd857654e9504f5f7e7ae47c0ac/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/binutils/Config.in |    1 +
 package/oprofile/Config.in |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

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
