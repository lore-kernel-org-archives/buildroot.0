From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:07:06 -0300
Subject: [Buildroot] [PATCH 79/93] iodine: use $(TARGET_CONFIGURE_OPTS) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-80-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/iodine/iodine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iodine/iodine.mk b/package/iodine/iodine.mk
index 9de54e0..711d709 100644
--- a/package/iodine/iodine.mk
+++ b/package/iodine/iodine.mk
@@ -26,7 +26,7 @@ define IODINE_BUILD_CMDS
 endef
 
 define IODINE_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) install DESTDIR="$(TARGET_DIR)" prefix=/usr
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) install DESTDIR="$(TARGET_DIR)" prefix=/usr
 endef
 
 $(eval $(generic-package))
-- 
2.7.3
