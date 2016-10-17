From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:52 -0300
Subject: [Buildroot] [PATCH 65/93] keyutils: use $(TARGET_CONFIGURE_OPTS)
	when calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-66-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/keyutils/keyutils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
index 7a30ba6..4a8dbac 100644
--- a/package/keyutils/keyutils.mk
+++ b/package/keyutils/keyutils.mk
@@ -28,11 +28,11 @@ define KEYUTILS_BUILD_CMDS
 endef
 
 define KEYUTILS_INSTALL_STAGING_CMDS
-	$(MAKE) $(KEYUTILS_MAKE_PARAMS) -C $(@D) DESTDIR=$(STAGING_DIR) install
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(KEYUTILS_MAKE_PARAMS) -C $(@D) DESTDIR=$(STAGING_DIR) install
 endef
 
 define KEYUTILS_INSTALL_TARGET_CMDS
-	$(MAKE) $(KEYUTILS_MAKE_PARAMS) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(KEYUTILS_MAKE_PARAMS) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
-- 
2.7.3
