From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Fri, 27 Nov 2009 14:32:28 +0100
Subject: [Buildroot] [PATCH] external toolchain: fix strip of libraries
Message-ID: <4d28d4b50911270532k393a4571s66cd60a881e12f09@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix inverted condition check.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 toolchain/external-toolchain/ext-tool.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/external-toolchain/ext-tool.mk
b/toolchain/external-toolchain/ext-tool.mk
index 1f5aa19..39faf84 100644
--- a/toolchain/external-toolchain/ext-tool.mk
+++ b/toolchain/external-toolchain/ext-tool.mk
@@ -56,9 +56,9 @@ copy_toolchain_lib_root = \
                        elif test -f $${LIB_DIR}/$${LIB}; then \
                                $(INSTALL) -D -m0755
$${LIB_DIR}/$${LIB} $(TARGET_DIR)$${DST}/$${LIB}; \
                                case "$${STRIP}" in \
-                               (0 | n | no) \
-;; \
                                (*) \
+;; \
+                               (y) \
                                        $(TARGET_CROSS)strip
"$(TARGET_DIR)$${DST}/$${LIB}"; \
 ;; \
                                esac; \
-- 
1.6.5.3
