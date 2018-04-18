From: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Date: Wed, 18 Apr 2018 16:33:53 +0200
Subject: [Buildroot] [PATCH 1/1] pixiewps: added missing dependency
Message-ID: <1524062033-24852-1-git-send-email-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes 
	
	http://autobuild.buildroot.net/results/0c8d0eeb693ac29739845f489caffc2f9fa3b262/

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/pixiewps/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pixiewps/Config.in b/package/pixiewps/Config.in
index 97240f5..05719f4 100644
--- a/package/pixiewps/Config.in
+++ b/package/pixiewps/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_PIXIEWPS
 	bool "pixiewps"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Pixie WPS is a C based tool to audit networks against the so
 	  called "Pixie Dust" attack.
 
 	  https://github.com/wiire-a/pixiewps/wiki
+
+comment "pixiewps needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.7.4
