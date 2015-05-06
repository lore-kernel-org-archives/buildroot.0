From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 May 2015 23:48:51 +0200
Subject: [Buildroot] [git commit] dstat: propagate python !static dependency
Message-ID: <20150506214905.26AB481DED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=842f6a3b7f9c266ffda055d928c0bbe3c5906491
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dstat/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/dstat/Config.in b/package/dstat/Config.in
index 63db87b..6536a5e 100644
--- a/package/dstat/Config.in
+++ b/package/dstat/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_DSTAT
 	depends on BR2_USE_WCHAR # python
 	depends on BR2_USE_MMU # python
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python
+	depends on !BR2_STATIC_LIBS # python
 	select BR2_PACKAGE_PYTHON
 	help
 	  Dstat, written in Python, is a versatile replacement for vmstat,
@@ -21,6 +22,6 @@ config BR2_PACKAGE_DSTAT
 
 	  http://dag.wieers.com/home-made/dstat/
 
-comment "dstat needs a toolchain w/ wchar, threads"
+comment "dstat needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
