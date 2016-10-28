From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Fri, 28 Oct 2016 10:18:26 -0300
Subject: [Buildroot] [PATCH 08/11] dtc: use $(TARGET_CONFIGURE_OPTS) when
	calling $(MAKE)
In-Reply-To: <1477660709-5935-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1477660709-5935-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1477660709-5935-8-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/dtc/dtc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 0a48644..f6800f3 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -37,12 +37,12 @@ endef
 
 # For staging, only the library is needed
 define DTC_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr install-lib \
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr install-lib \
 		install-includes
 endef
 
 define DTC_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr $(DTC_INSTALL_GOAL)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr $(DTC_INSTALL_GOAL)
 endef
 
 # host build
-- 
2.7.3
