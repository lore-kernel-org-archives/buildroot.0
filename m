From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 19 Dec 2012 08:27:32 +0100
Subject: [Buildroot] [PATCH] libcurl: needs MMU
Message-ID: <1355902052-7507-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.org/results/5a502f16ad94a410ca21c9a7f223d6c12086bbb5/build-end.log

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 package/libcurl/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 1d6d08e..10ee0e4 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBCURL
 	bool "libcurl"
+	depends on BR2_USE_MMU # Uses fork()
 	help
 	  cURL is a tool for getting files from FTP, HTTP, Gopher, Telnet,
 	  and Dict servers, using any of the supported protocols.
-- 
1.7.9.5
