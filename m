From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 20 Jan 2014 13:20:52 -0300
Subject: [Buildroot] [PATCH] libbluray: needs threads
Message-ID: <1390234852-4645-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/2bc/2bc0ce057e54bd6ff7f9ade115c389648a2df2eb/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libbluray/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libbluray/Config.in b/package/libbluray/Config.in
index eeb93dc..2571f5c 100644
--- a/package/libbluray/Config.in
+++ b/package/libbluray/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_LIBBLURAY
 	bool "libbluray"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  libbluray is a client library for accessing bluray disks.
 
 	  http://www.videolan.org/developers/libbluray.html
+
+comment "libbluray needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.3.2
