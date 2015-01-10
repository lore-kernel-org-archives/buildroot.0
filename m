From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 15:28:00 +0100
Subject: [Buildroot] [git commit] package/gd: Add explicit support for tiff
Message-ID: <20150110142818.85CDB801F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=668efc5fbf1aa9e4b42df2ae92d24ee6fe0b252a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This ensures reproducible builds.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gd/gd.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 868b45e..d7a6512 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -52,6 +52,13 @@ else
 GD_CONF_OPTS += --without-png
 endif
 
+ifeq ($(BR2_PACKAGE_TIFF),y)
+GD_DEPENDENCIES += tiff
+GD_CONF_OPTS += --with-tiff
+else
+GD_CONF_OPTS += --without-tiff
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXPM),y)
 GD_DEPENDENCIES += xlib_libXpm
 GD_CONF_OPTS += --with-xpm
