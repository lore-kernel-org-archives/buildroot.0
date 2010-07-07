From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Jul 2010 08:21:12 +0200
Subject: [Buildroot] [PATCH 19/20] xvkbd: add missing dependency on
	xlib_libXtst
In-Reply-To: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
References: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0bfca3ec2573d50b7a883d6e89dd8b322b276dda.1278483657.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xvkbd/Config.in |    1 +
 package/xvkbd/xvkbd.mk  |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/xvkbd/Config.in b/package/xvkbd/Config.in
index 8a4b847..a75687d 100644
--- a/package/xvkbd/Config.in
+++ b/package/xvkbd/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XVKBD
 	bool "xvkbd"
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXAW
+	select BR2_PACKAGE_XLIB_LIBXTST
 	help
 	  on-screen keyboard for X
 
diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index c40fa57..7c74be7 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -15,7 +15,7 @@ XVKBD_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_CC)" \
 
 XVKBD_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-XVKBD_DEPENDENCIES = xserver_xorg-server xlib_libXaw
+XVKBD_DEPENDENCIES = xserver_xorg-server xlib_libXaw xlib_libXtst
 
 $(eval $(call AUTOTARGETS,package,xvkbd))
 
-- 
1.7.0.4
