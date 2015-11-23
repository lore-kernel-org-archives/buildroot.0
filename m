From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:48:10 +0100
Subject: [Buildroot] [PATCH 40/51] package/gdb: use macro to install Xtensa
	overlay legal-info
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <516cd57c36cd5c385b46789f3812aefaf5888a90.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 987dd5e..8455f88 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -47,6 +47,11 @@ define GDB_XTENSA_PRE_PATCH
 endef
 GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
+define GDB_XTENSA_LEGAL_INFO
+	$(call arch-xtensa-overlay-legal-info,$($(PKG)_REDIST_SOURCES_DIR))
+endef
+GDB_POST_LEGAL_INFO_HOOKS += GDB_XTENSA_LEGAL_INFO
+HOST_GDB_POST_LEGAL_INFO_HOOKS += GDB_XTENSA_LEGAL_INFO
 endif
 
 # Prevent gdb to build the documentation
-- 
1.9.1
