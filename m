From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:07:04 -0300
Subject: [Buildroot] [PATCH 77/93] dtc: use $(HOST_CONFIGURE_OPTS) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-78-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/dtc/dtc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index 01699bb..a9e1efd 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -51,7 +51,7 @@ define HOST_DTC_BUILD_CMDS
 endef
 
 define HOST_DTC_INSTALL_CMDS
-	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install-bin
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install-bin
 endef
 
 $(eval $(generic-package))
-- 
2.7.3
