From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] metacity: use new style hook
Message-ID: <20100916113832.DAD858AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b4271fbba371d1fc4d6ceac08b638bd4664cf0f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/metacity/metacity.mk |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
index 44cde54..9d91efe 100644
--- a/package/metacity/metacity.mk
+++ b/package/metacity/metacity.mk
@@ -18,8 +18,10 @@ METACITY_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 
 METACITY_DEPENDENCIES = libgtk2 xserver_xorg-server
 
-$(eval $(call AUTOTARGETS,package,metacity))
-
-$(METACITY_HOOK_POST_INSTALL): $(METACITY_TARGET_INSTALL_TARGET)
+define METACITY_INSTALL_XSESSION
 	install -D package/metacity/Xsession $(TARGET_DIR)/etc/X11/Xsession
-	touch $@
+endef
+
+METACITY_POST_INSTALL_TARGET_HOOKS += METACITY_INSTALL_XSESSION
+
+$(eval $(call AUTOTARGETS,package,metacity))
-- 
1.7.1
