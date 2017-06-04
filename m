From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Jun 2017 11:48:39 +0200
Subject: [Buildroot] [PATCH] linux: fix name of config variable
Message-ID: <20170604094839.23541-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In 4c10eedc1 (systemd: enable required kernel features), we added
setting a few required kernel features to ensure systemd works.

However, there was a typo for one of the variables: CONFIG_TMPFS_XATTR
was written as CONFIG_TMPFS_POSIX_XATTR, which does not exist (and never
ever existed, at least not since 2.6.12)...

Fixes #9926.

Reported-by: Michael Heinemann <posted@heine.so>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Michael Heinemann <posted@heine.so>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index e387c7dd44..9da7e9bec1 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -278,7 +278,7 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_FHANDLE,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS4_FS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_ACL,$(@D)/.config)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_XATTR,$(@D)/.config))
+		$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_XATTR,$(@D)/.config))
 	$(if $(BR2_PACKAGE_SMACK),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SMACK,$(@D)/.config)
-- 
2.11.0
