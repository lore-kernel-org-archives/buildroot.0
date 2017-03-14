From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Mar 2017 11:30:37 -0700
Subject: [Buildroot] [PATCH 08/23] package/gdb: use macro to extract Xtensa
	overlay
In-Reply-To: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
References: <1489516252-3803-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1489516252-3803-9-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/gdb/gdb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 9f7746d..8e37ade 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -46,7 +46,7 @@ HOST_GDB_INSTALL_OPTS += MAKEINFO=true install
 # Apply the Xtensa specific patches
 ifneq ($(ARCH_XTENSA_CORE_NAME),)
 define GDB_XTENSA_PRE_PATCH
-	tar xf $(ARCH_XTENSA_OVERLAY_TAR) -C $(@D) --strip-components=1 gdb
+	$(call arch-xtensa-overlay-extract,$(@D),gdb)
 endef
 GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
-- 
2.1.4
