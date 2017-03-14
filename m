From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Mar 2017 11:30:40 -0700
Subject: [Buildroot] [PATCH 11/23] package/gdb: extract Xtensa overlay as
	post-extract hook
In-Reply-To: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
References: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1489516252-3803-12-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

... like it is done for gcc.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/gdb/gdb.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 8e37ade..e7e2289 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -45,11 +45,11 @@ HOST_GDB_INSTALL_OPTS += MAKEINFO=true install
 
 # Apply the Xtensa specific patches
 ifneq ($(ARCH_XTENSA_CORE_NAME),)
-define GDB_XTENSA_PRE_PATCH
+define GDB_XTENSA_OVERLAY_EXTRACT
 	$(call arch-xtensa-overlay-extract,$(@D),gdb)
 endef
-GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
-HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
+GDB_POST_EXTRACT_HOOKS += GDB_XTENSA_OVERLAY_EXTRACT
+HOST_GDB_POST_EXTRACT_HOOKS += GDB_XTENSA_OVERLAY_EXTRACT
 endif
 
 ifeq ($(GDB_FROM_GIT),y)
-- 
2.1.4
