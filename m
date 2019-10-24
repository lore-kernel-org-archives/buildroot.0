From: Romain Naour <romain.naour@smile.fr>
Date: Thu, 24 Oct 2019 22:22:09 +0200
Subject: [Buildroot] [PATCH 1/3] package/lld: create
 $(HOST_DIR)/$(GNU_TARGET_NAME)/bin before create symlinks
Message-ID: <20191024202211.15619-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

$(HOST_DIR)/$(GNU_TARGET_NAME)/bin directory may not exist before creating
lld symlinks.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/lld/lld.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lld/lld.mk b/package/lld/lld.mk
index a6933e2961..bda5a56ab5 100644
--- a/package/lld/lld.mk
+++ b/package/lld/lld.mk
@@ -14,6 +14,7 @@ HOST_LLD_DEPENDENCIES = host-llvm
 
 # GCC looks for tools in a different path from LLD's default installation path
 define HOST_LLD_CREATE_SYMLINKS
+	mkdir -p $(HOST_DIR)/$(GNU_TARGET_NAME)/bin
 	ln -sf $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/lld
 	ln -sf $(HOST_DIR)/bin/lld $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/ld.lld
 endef
-- 
2.21.0
