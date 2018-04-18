From: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Date: Wed, 18 Apr 2018 18:43:01 +0200
Subject: [Buildroot] [PATCH 1/1] reaver: add missing dependency on non
 static lib.
Message-ID: <1524069781-671-1-git-send-email-guillaume.bressaix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes

	http://autobuild.buildroot.net/results/519b4347f496c043ddecdf15f57efb0b3addee42
	http://autobuild.buildroot.net/results/c3daad76473a704e379634e3b87d51468a353f41

lpcap is not found when BR2_STATIC_LIBS=y

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/reaver/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/reaver/Config.in b/package/reaver/Config.in
index 0fd8ab7..3e73d0e 100644
--- a/package/reaver/Config.in
+++ b/package/reaver/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_REAVER
 	bool "reaver"
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBPCAP
 	help
 	  Reaver is a tool to audit networks against brute WPS pins
@@ -7,3 +8,6 @@ config BR2_PACKAGE_REAVER
 
 	  https://code.google.com/archive/p/reaver-wps/wikis/README.wiki
 	  https://github.com/t6x/reaver-wps-fork-t6x
+
+comment "reaver needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
-- 
2.7.4
