From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 8 Jun 2017 16:50:29 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] linux: fix name of config
	variable
Message-ID: <20170608145033.6D26780AE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=256f3f71484fc4bc15a4a7500384cfd2bd3a8c38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

In 4c10eedc1 (systemd: enable required kernel features), we added
setting a few required kernel features to ensure systemd works.

However, there was a typo for one of the variables: CONFIG_TMPFS_XATTR
was written as CONFIG_TMPFS_POSIX_XATTR, which does not exist (and never
ever existed, at least not since 2.6.12)...

Reported-by: Michael Heinemann <posted@heine.so>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Michael Heinemann <posted@heine.so>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b0fc65a11b2ac11dc492146ec50168739810c2f8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index e387c7d..9da7e9b 100644
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
