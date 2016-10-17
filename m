From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:09 -0300
Subject: [Buildroot] [PATCH 22/93] tekui: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-23-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/tekui/tekui.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tekui/tekui.mk b/package/tekui/tekui.mk
index 60b48e0..f9ae849 100644
--- a/package/tekui/tekui.mk
+++ b/package/tekui/tekui.mk
@@ -56,11 +56,11 @@ endif
 endif
 
 define TEKUI_BUILD_CMDS
-	$(MAKE) $(TEKUI_MAKE_OPTS) PREFIX="/usr" -C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE) $(TEKUI_MAKE_OPTS) PREFIX="/usr" -C $(@D) all
 endef
 
 define TEKUI_INSTALL_TARGET_CMDS
-	$(MAKE) $(TEKUI_MAKE_OPTS) PREFIX="$(TARGET_DIR)/usr" -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) $(TEKUI_MAKE_OPTS) PREFIX="$(TARGET_DIR)/usr" -C $(@D) install
 endef
 
 $(eval $(generic-package))
-- 
2.7.3
