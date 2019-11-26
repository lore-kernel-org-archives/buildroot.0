From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 26 Nov 2019 11:43:33 +0100
Subject: [Buildroot] [PATCH] package/pkg-kconfig: fix reconfigure for
 kconfig packages
Message-ID: <1574765013-15209-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Kconfig based packages are not really reconfigured if the .config file is not
regenerated in the reconfigure target.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/pkg-kconfig.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 86d7c14..91cc606 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -176,6 +176,7 @@ $(1)-clean-for-reconfigure: $(1)-clean-kconfig-for-reconfigure
 
 $(1)-clean-kconfig-for-reconfigure:
 	rm -f $$($(2)_DIR)/.stamp_kconfig_fixup_done
+	rm -f $$($(2)_DIR)/.stamp_dotconfig
 
 # Only enable the foo-*config targets when the package is actually enabled.
 # Note: the variable $(2)_KCONFIG_VAR is not related to the kconfig
-- 
2.7.4
