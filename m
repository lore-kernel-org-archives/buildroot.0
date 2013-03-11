From: Gilles Talis <gilles.talis@gmail.com>
Date: Mon, 11 Mar 2013 10:41:24 -0700
Subject: [Buildroot] [PATCH] lcdproc: needs MMU
In-Reply-To: <y>
References: <y>
Message-ID: <1363023684-3479-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/58d0231cc39ee6be3064906f07307b438ea4c30b

Also fixed some indentation issues

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/lcdproc/Config.in |   15 ++++++++-------
 1 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/lcdproc/Config.in b/package/lcdproc/Config.in
index e0afc44..5635a02 100644
--- a/package/lcdproc/Config.in
+++ b/package/lcdproc/Config.in
@@ -1,12 +1,13 @@
 config BR2_PACKAGE_LCDPROC
-       bool "lcdproc"
-       select BR2_PACKAGE_FREETYPE
-       select BR2_PACKAGE_NCURSES
-       select BR2_PACKAGE_ZLIB
-       help
-         LCD display driver daemon and clients
+	bool "lcdproc"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_ZLIB
+	help
+	  LCD display driver daemon and clients
 
-         http://lcdproc.org/
+	  http://lcdproc.org/
 
 config BR2_PACKAGE_LCDPROC_DRIVERS
 	string "List of drivers to build"
-- 
1.7.4.1
