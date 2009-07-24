From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jul 2009 23:30:07 +0200
Subject: [Buildroot] [PATCH 06/13] dillo: use select for library dependencies
In-Reply-To: <cover.1248471011.git.thomas.petazzoni@free-electrons.com>
References: <cover.1248471011.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1d5228acae2a124c84ae235fb5f39bcbab1e6312.1248471011.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use select independs of depends on for library dependencies. We keep
the depends on for the X.org dependency so that dillo can only be
selected once X.org is enabled (which, contrary to the library
dependencies, is a pretty obvious dependency for the user). We then
get rid of the configuration interface comment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dillo/Config.in |   13 +++++--------
 1 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/dillo/Config.in b/package/dillo/Config.in
index 5724691..87418d2 100644
--- a/package/dillo/Config.in
+++ b/package/dillo/Config.in
@@ -1,15 +1,12 @@
 config BR2_PACKAGE_DILLO
 	bool "dillo"
-	depends on BR2_PACKAGE_JPEG
-	depends on BR2_PACKAGE_LIBGLIB12
-	depends on BR2_PACKAGE_LIBGTK12
-	depends on BR2_PACKAGE_ZLIB
-	depends on BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBGLIB12
+	select BR2_PACKAGE_LIBGTK12
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBPNG
 	depends on BR2_PACKAGE_XORG7
 	help
 	  Dillo is a small GTK+ based web browser written in C.
 
 	  http://www.dillo.org/
-
-comment "dillo		- disabled (requires jpeg,libglib12,libgtk12,zlib,libpng and Xorg(7))"
-	depends on !BR2_PACKAGE_JPEG || !BR2_PACKAGE_LIBGLIB12 || !BR2_PACKAGE_LIBGTK12 || !BR2_PACKAGE_ZLIB || !BR2_PACKAGE_LIBPNG || !(BR2_PACKAGE_XORG || BR2_PACKAGE_XORG7)
-- 
1.6.0.4
