From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 14 Apr 2010 01:05:40 +0200
Subject: [Buildroot] [PATCH 07/41] external toolchain: fix strip of libraries
In-Reply-To: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1271199974-30434-8-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 toolchain/external-toolchain/ext-tool.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
index 4493281..235e68c 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -56,9 +56,9 @@ copy_toolchain_lib_root = \
 			elif test -f $${LIB_DIR}/$${LIB}; then \
 				$(INSTALL) -D -m0755 $${LIB_DIR}/$${LIB} $(TARGET_DIR)$${DST}/$${LIB}; \
 				case "$${STRIP}" in \
-				(0 | n | no) \
-;; \
 				(*) \
+;; \
+				(y) \
 					$(TARGET_CROSS)strip "$(TARGET_DIR)$${DST}/$${LIB}"; \
 ;; \
 				esac; \
-- 
1.7.0.4
