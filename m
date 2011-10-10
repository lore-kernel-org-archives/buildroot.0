From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 10 Oct 2011 11:21:58 +0200
Subject: [Buildroot] [PATCH 1/3] fluxbox: add xsession profile
Message-ID: <1318238520-16580-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

add .xsession profile to get fluxbox being started automatically
by XDM

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/fluxbox/.xsession  |    1 +
 package/fluxbox/fluxbox.mk |    6 ++++++
 2 files changed, 7 insertions(+), 0 deletions(-)
 create mode 100644 package/fluxbox/.xsession

diff --git a/package/fluxbox/.xsession b/package/fluxbox/.xsession
new file mode 100644
index 0000000..3775bad
--- /dev/null
+++ b/package/fluxbox/.xsession
@@ -0,0 +1 @@
+exec startfluxbox
diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
index 85a8eae..e0f6e4e 100644
--- a/package/fluxbox/fluxbox.mk
+++ b/package/fluxbox/fluxbox.mk
@@ -13,4 +13,10 @@ FLUXBOX_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 
 FLUXBOX_DEPENDENCIES = xlib_libX11 $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
+define FLUXBOX_INSTALL_XSESSION_FILE
+	$(INSTALL) -m 0644 package/fluxbox/.xsession $(TARGET_DIR)/root/.xsession
+endef
+
+FLUXBOX_POST_INSTALL_TARGET_HOOKS += FLUXBOX_INSTALL_XSESSION_FILE
+
 $(eval $(call AUTOTARGETS))
-- 
1.7.1.1
