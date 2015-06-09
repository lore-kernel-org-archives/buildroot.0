From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 23:10:40 +0200
Subject: [Buildroot] [git commit] package/matchbox-panel: fix WiFi monitoring
Message-ID: <20150609211053.22AA97FEE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6c57b580d1a15edb4066899639532f86059c432
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/matchbox-panel/matchbox-panel.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
