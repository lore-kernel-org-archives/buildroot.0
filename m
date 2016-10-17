From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:32 -0300
Subject: [Buildroot] [PATCH 45/93] shapelib: use $(TARGET_CONFIGURE_OPTS)
	when calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-46-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/shapelib/shapelib.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shapelib/shapelib.mk b/package/shapelib/shapelib.mk
index 1e9c16f..2e8fe6d 100644
--- a/package/shapelib/shapelib.mk
+++ b/package/shapelib/shapelib.mk
@@ -15,11 +15,11 @@ define SHAPELIB_BUILD_CMDS
 endef
 
 define SHAPELIB_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) PREFIX=$(STAGING_DIR)/usr/ lib_install
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(STAGING_DIR)/usr/ lib_install
 endef
 
 define SHAPELIB_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) PREFIX=$(TARGET_DIR)/usr/ bin_install
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(TARGET_DIR)/usr/ bin_install
 endef
 
 $(eval $(generic-package))
-- 
2.7.3
