From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:48 +0200
Subject: [Buildroot] [PATCH 31/32 v2] package/matchbox-panel: add support
	for dnotify
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <322f4dbcfe5191e203c6b054793a0657956e2abd.1433362840.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using dnotify, matchbox-panel can automatically reload its menu.
dnotify requires a kernel >=2.4, which we can consider to be
virtually for granted.

So, forcibly use dnotify.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - remove the option, always use dnotify  (Arnout)
---
 package/matchbox-panel/matchbox-panel.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/matchbox-panel/matchbox-panel.mk b/package/matchbox-panel/matchbox-panel.mk
index a5da780..e71337c 100644
--- a/package/matchbox-panel/matchbox-panel.mk
+++ b/package/matchbox-panel/matchbox-panel.mk
@@ -11,7 +11,7 @@ MATCHBOX_PANEL_SITE = http://downloads.yoctoproject.org/releases/matchbox/matchb
 MATCHBOX_PANEL_LICENSE = GPLv2+
 MATCHBOX_PANEL_LICENSE_FILES = COPYING
 MATCHBOX_PANEL_DEPENDENCIES = matchbox-lib
-MATCHBOX_PANEL_CONF_OPTS = --enable-expat
+MATCHBOX_PANEL_CONF_OPTS = --enable-expat --enable-dnotify
 
 ifeq ($(BR2_PACKAGE_MATCHBOX_STARTUP_MONITOR),y)
 MATCHBOX_PANEL_CONF_OPTS += --enable-startup-notification
-- 
1.9.1
