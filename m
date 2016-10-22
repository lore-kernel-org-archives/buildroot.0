From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] ti-sgx-um: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161022132039.31864819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b5ddccfc69c188bc71d4f60054d65eb7ee2f0b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
