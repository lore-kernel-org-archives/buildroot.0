From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Apr 2015 21:54:10 +0200
Subject: [Buildroot] [git commit] package/gd: Add dependency to libvpx
Message-ID: <20150410195446.529A681998@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9604bdde203d7746a5e6eec83a027e12a0a2ea97
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed to get reproducable builds and to reproduce this build error:
http://autobuild.buildroot.net/results/046/046dd505feb5e92bdee3d0993366be162da1223a/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gd/gd.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 2991cd5..1b519de 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -51,6 +51,13 @@ else
 GD_CONF_OPTS += --without-png
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVPX),y)
+GD_DEPENDENCIES += libvpx
+GD_CONF_OPTS += --with-vpx
+else
+GD_CONF_OPTS += --without-vpx
+endif
+
 ifeq ($(BR2_PACKAGE_TIFF),y)
 GD_DEPENDENCIES += tiff
 GD_CONF_OPTS += --with-tiff
