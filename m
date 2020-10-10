From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Oct 2020 21:55:20 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] boot/barebox: don't
 specify .config to munge
Message-ID: <20201010200006.2E84F8E1E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e274f0d470ac212c5453e0878bb83e2d6493ec1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7a2524bf546e646bef3ca32d63f56057d4da6586)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/barebox.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 1efe5665de..422f27312d 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -110,8 +110,8 @@ endif
 
 ifneq ($$($(1)_CUSTOM_EMBEDDED_ENV_PATH),)
 define $(1)_KCONFIG_FIXUP_CMDS
-	$$(call KCONFIG_ENABLE_OPT,CONFIG_DEFAULT_ENVIRONMENT,$$(@D)/.config)
-	$$(call KCONFIG_SET_OPT,CONFIG_DEFAULT_ENVIRONMENT_PATH,"$$($(1)_CUSTOM_EMBEDDED_ENV_PATH)",$$(@D)/.config)
+	$$(call KCONFIG_ENABLE_OPT,CONFIG_DEFAULT_ENVIRONMENT)
+	$$(call KCONFIG_SET_OPT,CONFIG_DEFAULT_ENVIRONMENT_PATH,"$$($(1)_CUSTOM_EMBEDDED_ENV_PATH)")
 endef
 endif
 
