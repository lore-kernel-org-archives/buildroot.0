From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 23:17:13 +0200
Subject: [Buildroot] [git commit] core/pkg-kconfig: Do not use $(call ...)
	without parameters
Message-ID: <20160418211717.583C281D84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e645a3b0eda08422664abf798c640719c70549b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When there are no parameters, simply use $(var) instead of $(call var)

Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kconfig.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index cb177bb..4033915 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -87,7 +87,7 @@ define $(2)_FIXUP_DOT_CONFIG
 endef
 
 $$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
-	$$(call $(2)_FIXUP_DOT_CONFIG)
+	$$($(2)_FIXUP_DOT_CONFIG)
 
 # Before running configure, the configuration file should be present and fixed
 $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
@@ -139,7 +139,7 @@ $$($(2)_DIR)/.kconfig_editor_%: $$($(2)_DIR)/.stamp_kconfig_fixup_done
 		$$($(2)_KCONFIG_OPTS) $$(*)
 	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
 	rm -f $$($(2)_DIR)/.stamp_{target,staging,images}_installed
-	$$(call $(2)_FIXUP_DOT_CONFIG)
+	$$($(2)_FIXUP_DOT_CONFIG)
 
 # Saving back the configuration
 #
