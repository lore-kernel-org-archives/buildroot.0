From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Sep 2020 11:48:35 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/systemd: move
 preset-all HOOK to fakeroot stage
Message-ID: <20200904094136.AF70C87D07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e99e884e1018fe8b9fc7b25c9726eddd1153ddd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

User can drop in more systemd units or presets
in an rootfs overlay, which will be copied over *after*
the TARGET_FINALIZE_HOOKS are run.

Instead, run preset-all afterwards from ROOTFS_PRE_CMD_HOOKS

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Reviewed-by: J??r??my ROSEN <jeremy.rosen@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 65b63785a642bbc565924edf365b5d7c080f961c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index d9ebd5db7f..2908caef61 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -498,7 +498,7 @@ endef
 define SYSTEMD_PRESET_ALL
 	$(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset-all
 endef
-SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_PRESET_ALL
+SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_PRESET_ALL
 
 SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
 SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
