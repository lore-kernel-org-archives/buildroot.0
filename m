From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:07:00 -0300
Subject: [Buildroot] [PATCH 73/93] ti-sgx-um: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-74-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/ti-sgx-um/ti-sgx-um.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ti-sgx-um/ti-sgx-um.mk b/package/ti-sgx-um/ti-sgx-um.mk
index d9ff2df..d5c50a0 100644
--- a/package/ti-sgx-um/ti-sgx-um.mk
+++ b/package/ti-sgx-um/ti-sgx-um.mk
@@ -15,11 +15,11 @@ TI_SGX_UM_INSTALL_STAGING = YES
 TI_SGX_UM_DEPENDENCIES = libdrm
 
 define TI_SGX_UM_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) DISCIMAGE=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DISCIMAGE=$(STAGING_DIR) install
 endef
 
 define TI_SGX_UM_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DISCIMAGE=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DISCIMAGE=$(TARGET_DIR) install
 endef
 
 # libs use the following file for configuration
-- 
2.7.3
