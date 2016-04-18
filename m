From: Romain Izard <romain.izard.pro@gmail.com>
Date: Mon, 18 Apr 2016 11:23:02 +0200
Subject: [Buildroot] [PATCH v4 2/3] core/pkg-kconfig: Do not use $(call ...)
	without parameters
In-Reply-To: <1460971383-10595-1-git-send-email-romain.izard.pro@gmail.com>
References: <1460971383-10595-1-git-send-email-romain.izard.pro@gmail.com>
Message-ID: <1460971383-10595-3-git-send-email-romain.izard.pro@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When there are no parameters, simply use $(var) instead of $(call var)

Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
---
Changelog:
v3: new
v4: no change

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
-- 
2.5.0
