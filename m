From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:49 +0200
Subject: [Buildroot] [PATCH 32/32 v2] package/matchbox-panel: fix WiFi
	monitoring
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <0186d2b3c5d0409658ade1fbfca5d07b8044e119.1433362840.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

matchbox-panel can build a simple applet to monitor the WiFi. For that,
it tries to see if libiwl is available; if so, WiFi monitoring is
enabled, otherwise it is disabled; there is not option to explicitly
enable or disable it.

Currently, matchbox-panel depends on the wireless-tools package.
However, that's not enough, since the library will only be installed if
explicitly enabled in the menuconfig *and* this is not a static build.

Change the dependency to be on the library, not the package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Changes v1 -> v2:
  - typo  (Arnout)
---
 package/matchbox-panel/matchbox-panel.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/matchbox-panel/matchbox-panel.mk b/package/matchbox-panel/matchbox-panel.mk
index e71337c..aa2d417 100644
--- a/package/matchbox-panel/matchbox-panel.mk
+++ b/package/matchbox-panel/matchbox-panel.mk
@@ -27,7 +27,7 @@ else
 MATCHBOX_PANEL_CONF_OPTS += --disable-acpi-linux
 endif
 
-ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS),y)
+ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS_LIB),y)
 MATCHBOX_PANEL_DEPENDENCIES += wireless_tools
 endif
 
-- 
1.9.1
