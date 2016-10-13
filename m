From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:47 -0300
Subject: [Buildroot] [PATCH 40/51] live555: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-41-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/live555/live555.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 3ccba63..f36cce3 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -41,15 +41,15 @@ define LIVE555_CONFIGURE_CMDS
 endef
 
 define LIVE555_BUILD_CMDS
-	$(MAKE) -C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all
 endef
 
 define LIVE555_INSTALL_STAGING_CMDS
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
 endef
 
 define LIVE555_INSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D) install
 endef
 
 $(eval $(generic-package))
-- 
2.7.3
