From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:16:54 +0200
Subject: [Buildroot] [git commit] openssl: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161015121835.49BB981F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5a74fcdf25b29955e7df669a279edc0fac8a6fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openssl/openssl.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 6dc4b85..5f6267c 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -106,11 +106,11 @@ define HOST_OPENSSL_BUILD_CMDS
 endef
 
 define OPENSSL_BUILD_CMDS
-	$(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define OPENSSL_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) INSTALL_PREFIX=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALL_PREFIX=$(STAGING_DIR) install
 endef
 
 define HOST_OPENSSL_INSTALL_CMDS
@@ -118,7 +118,7 @@ define HOST_OPENSSL_INSTALL_CMDS
 endef
 
 define OPENSSL_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) INSTALL_PREFIX=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALL_PREFIX=$(TARGET_DIR) install
 	rm -rf $(TARGET_DIR)/usr/lib/ssl
 	rm -f $(TARGET_DIR)/usr/bin/c_rehash
 endef
