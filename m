From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Apr 2020 14:10:15 +0200
Subject: [Buildroot] [PATCH 03/22] boot/barebox: don't specify .config to
 munge
In-Reply-To: <cover.1586002215.git.yann.morin.1998@free.fr>
References: <cover.1586002215.git.yann.morin.1998@free.fr>
Message-ID: <44d8917012874e0c477c86f951cf0c5ccfec39ab.1586002215.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
 
-- 
2.20.1
