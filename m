From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Dec 2013 23:29:55 +0100
Subject: [Buildroot] [PATCH 1/3] package/lvm2: remove uninstall commands
In-Reply-To: <cover.1386023329.git.yann.morin.1998@free.fr>
References: <cover.1386023329.git.yann.morin.1998@free.fr>
Message-ID: <87b70aafdc14794df97eaa937c841609d9b45ab4.1386023329.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

We do not properly support uninstalling packages, so just remove
the uninstall commands.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/lvm2/lvm2.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 4099c21..2761100 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -50,14 +50,4 @@ else
 LVM2_CONF_OPT += --disable-applib
 endif
 
-define LVM2_UNINSTALL_STAGING_CMDS
-	rm -f $(addprefix $(STAGING_DIR)/usr/sbin/,$(LVM2_BINS))
-	rm -f $(addprefix $(STAGING_DIR)/usr/lib/,libdevmapper.so*)
-endef
-
-define LVM2_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,$(LVM2_BINS))
-	rm -f $(addprefix $(TARGET_DIR)/usr/lib/,libdevmapper.so*)
-endef
-
 $(eval $(autotools-package))
-- 
1.8.1.2
