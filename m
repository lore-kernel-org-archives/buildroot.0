From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Fri, 12 Apr 2019 18:48:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/valgrind: do not install header
 files on the target
Message-ID: <20190412164856.28641-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/valgrind/valgrind.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index cae14f79b9..8ee8c4585c 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -64,6 +64,12 @@ endef
 
 VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_INSTALL_UCLIBC_SUPP
 
+define VALGRIND_REMOVE_TARGET_HEADERS
+	rm -rf $(TARGET_DIR)/usr/include/valgrind
+endef
+
+VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_REMOVE_TARGET_HEADERS
+
 ifeq ($(BR2_PACKAGE_VALGRIND_MEMCHECK),)
 define VALGRIND_REMOVE_MEMCHECK
 	rm -f $(TARGET_DIR)/usr/lib/valgrind/*memcheck*
-- 
2.19.2
