From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jan 2013 00:50:32 +0100
Subject: [Buildroot] [PATCH 1/2] package/dvb-apps: fix licensing terms when
	utils are enabled
In-Reply-To: <cover.1358034598.git.yann.morin.1998@free.fr>
References: <cover.1358034598.git.yann.morin.1998@free.fr>
Message-ID: <5b44ee6aeb881a4b03a0a2b77e212f9e646760b3.1358034598.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the dvb-apps utilities are selected, the license is clearly a
mix of GPLv2, GPLv2+ and LGPLv2.1+; this, in addition to the initial
unknown license for the transponders data.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/dvb-apps/dvb-apps.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index ee4aadb..86af824 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -21,6 +21,9 @@ DVB_APPS_LICENSE        = unknown (probably public domain)
 ifeq ($(BR2_PACKAGE_DVB_APPS_UTILS),y)
 # Utilitiess are selected, build and install everything
 
+DVB_APPS_LICENSE       += GPLv2 GPLv2+ LGPLv2.1+
+DVB_APPS_LICENSE_FILES += COPYING COPYING.LGPL
+
 DVB_APPS_LDFLAGS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_ENABLE_LOCALE),)
-- 
1.7.2.5
