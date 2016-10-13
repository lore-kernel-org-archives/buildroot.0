From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:20 -0300
Subject: [Buildroot] [PATCH 13/51] xvkbd: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-14-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/xvkbd/xvkbd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
index e03f723..14e3f42 100644
--- a/package/xvkbd/xvkbd.mk
+++ b/package/xvkbd/xvkbd.mk
@@ -12,12 +12,12 @@ XVKBD_LICENSE_FILES = README
 # Passing USRLIBDIR ensures that the stupid Makefile doesn't add
 # /usr/lib to the library search path.
 define XVKBD_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
 		USRLIBDIR="$(STAGING_DIR)/usr/lib"
 endef
 
 define XVKBD_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
 XVKBD_DEPENDENCIES = \
-- 
2.7.3
