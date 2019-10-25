From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2019 10:28:31 +0200
Subject: [Buildroot] [git commit] package/lld: create
 $(HOST_DIR)/$(GNU_TARGET_NAME)/bin before create symlinks
Message-ID: <20191025082520.86D7985364@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c58e3f7c43dd5609a5f16a2ff264b06a403b575
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

$(HOST_DIR)/$(GNU_TARGET_NAME)/bin directory may not exist before creating
lld symlinks.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Tested-By: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
