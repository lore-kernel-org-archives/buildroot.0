From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 20:09:41 +0200
Subject: [Buildroot] [PATCH 30/30] package/matchbox-panel: fix WiFi
	monitoring
In-Reply-To: <cover.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <3de1b4334c76469f95d791d578f769831ab2f3a5.1429725549.git.yann.morin.1998@free.fr>
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
explictly enabled in the menuconfig *and* this is not a static build.

Change the dependency to be on the library, not the package.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/matchbox/matchbox-panel/matchbox-panel.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/matchbox/matchbox-panel/matchbox-panel.mk b/package/matchbox/matchbox-panel/matchbox-panel.mk
index dedbab6..455ae34 100644
--- a/package/matchbox/matchbox-panel/matchbox-panel.mk
+++ b/package/matchbox/matchbox-panel/matchbox-panel.mk
@@ -32,7 +32,7 @@ else
 MATCHBOX_PANEL_CONF_OPTS += --disable-dnotify
 endif
 
-ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS),y)
+ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS_LIB),y)
 MATCHBOX_PANEL_DEPENDENCIES += wireless_tools
 endif
 
-- 
1.9.1
