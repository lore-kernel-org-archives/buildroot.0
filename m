From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:00:26 +0100
Subject: [Buildroot] [git commit] xapp_xdm: use <pkg>_INSTALL_INIT_SYSV
	mechanism
Message-ID: <20141201221140.F20598002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9d848871aaa212b6a5633180f74c60929c8ae10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xdm/xapp_xdm.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index 428f473..955dc1c 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -14,11 +14,9 @@ XAPP_XDM_DEPENDENCIES = xapp_sessreg xapp_xrdb xlib_libX11 xlib_libXaw xlib_libX
 XAPP_XDM_CONF_OPTS = --with-utmp-file=/var/adm/utmpx \
 		    --with-wtmp-file=/var/adm/wtmpx
 
-define XAPP_XDM_INSTALL_STARTUP_SCRIPT
+define XAPP_XDM_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/x11r7/xapp_xdm/S99xdm \
 		$(TARGET_DIR)/etc/init.d/S99xdm
 endef
 
-XAPP_XDM_POST_INSTALL_TARGET_HOOKS += XAPP_XDM_INSTALL_STARTUP_SCRIPT
-
 $(eval $(autotools-package))
