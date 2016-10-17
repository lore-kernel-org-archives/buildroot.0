From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:07 -0300
Subject: [Buildroot] [PATCH 20/93] libpfm4: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-21-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/libpfm4/libpfm4.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpfm4/libpfm4.mk b/package/libpfm4/libpfm4.mk
index 358fd9d..913fc35 100644
--- a/package/libpfm4/libpfm4.mk
+++ b/package/libpfm4/libpfm4.mk
@@ -17,15 +17,15 @@ LIBPFM4_FLAGS = SYS=Linux ARCH=$(BR2_ARCH) \
 	DBG=
 
 define LIBPFM4_BUILD_CMDS
-	$(MAKE) -C $(@D) $(LIBPFM4_FLAGS)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBPFM4_FLAGS)
 endef
 
 define LIBPFM4_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) $(LIBPFM4_FLAGS) PREFIX=$(STAGING_DIR)/usr install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBPFM4_FLAGS) PREFIX=$(STAGING_DIR)/usr install
 endef
 
 define LIBPFM4_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) $(LIBPFM4_FLAGS) PREFIX=$(TARGET_DIR)/usr install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBPFM4_FLAGS) PREFIX=$(TARGET_DIR)/usr install
 endef
 
 $(eval $(generic-package))
-- 
2.7.3
