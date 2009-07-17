From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jul 2009 18:03:13 +0200
Subject: [Buildroot] [PATCH 06/13] dillo: remove configuration comment on
	X.org dependency
In-Reply-To: <cover.1247846596.git.thomas.petazzoni@free-electrons.com>
References: <cover.1247846596.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ca40dacf64bf75389ac16f06b7c79bd67c8c9a3d.1247846597.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Configuration comments make the configuration system messy. And if we
want to tell the user about the possible missing depencies for each
and every package, there would be an unmaintable mess of configuration
comments.

Let's get rid of them, and let the user figure out using the help of
each package available in the configuration system.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dillo/Config.in |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/dillo/Config.in b/package/dillo/Config.in
index 5724691..c27a0e8 100644
--- a/package/dillo/Config.in
+++ b/package/dillo/Config.in
@@ -10,6 +10,3 @@ config BR2_PACKAGE_DILLO
 	  Dillo is a small GTK+ based web browser written in C.
 
 	  http://www.dillo.org/
-
-comment "dillo		- disabled (requires jpeg,libglib12,libgtk12,zlib,libpng and Xorg(7))"
-	depends on !BR2_PACKAGE_JPEG || !BR2_PACKAGE_LIBGLIB12 || !BR2_PACKAGE_LIBGTK12 || !BR2_PACKAGE_ZLIB || !BR2_PACKAGE_LIBPNG || !(BR2_PACKAGE_XORG || BR2_PACKAGE_XORG7)
-- 
1.6.0.4
