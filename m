From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 15 Jul 2020 22:34:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/network-manager: disable
 introspection
Message-ID: <20200715203442.956892-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build will fail if gobject-introspection is built before network-manager
but python-gobject is not:

configure: error: "--enable-introspection aims to build the settings documentation. This requires GObject introspection for python (pygobject)

To avoid this build failure and because we don't need documentation,
just disable introspection

Fixes:
 - http://autobuild.buildroot.org/results/d3b1bc2fa7559e66465033c455176761d6e184d1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/network-manager/network-manager.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index c5749c857c..3dc3188f32 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -23,6 +23,7 @@ NETWORK_MANAGER_CONF_ENV = \
 	ac_cv_file__etc_SuSE_release=no
 
 NETWORK_MANAGER_CONF_OPTS = \
+	--disable-introspection \
 	--disable-tests \
 	--disable-qt \
 	--disable-more-warnings \
-- 
2.27.0
