From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 12 Mar 2013 10:31:06 +0100
Subject: [Buildroot] [git commit] lcdproc: needs MMU
Message-ID: <20130312093227.8B08D9B04F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4af3bb1d0e8054a8041bf0c9e015b93b5d124a46
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/58d0231cc39ee6be3064906f07307b438ea4c30b

Also fixed some indentation issues

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
