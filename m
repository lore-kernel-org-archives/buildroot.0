From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun,  7 Feb 2010 17:55:41 +0100
Subject: [Buildroot] [PATCH 09/10] ext-toolchain: remove pkgconfig files
	from the external toolchain
In-Reply-To: <1265561742-5924-1-git-send-email-llandwerlin@gmail.com>
References: <1265561742-5924-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1265561742-5924-10-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 toolchain/external-toolchain/ext-tool.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 39faf84..e72329b 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -80,7 +80,8 @@ copy_toolchain_lib_root = \
 copy_toolchain_sysroot = \
 	SYSROOT_DIR="$(strip $1)"; \
 	cp -a $${SYSROOT_DIR}/* $(STAGING_DIR)/ ; \
-	find $(STAGING_DIR) -type d | xargs chmod 755
+	find $(STAGING_DIR) -type d | xargs chmod 755; \
+	rm -rf $(STAGING_DIR)/usr/lib/pkgconfig
 
 #
 # Check the availability of a particular glibc feature. We assume that
-- 
1.6.6
