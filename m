From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 23:38:25 +0200
Subject: [Buildroot] [git commit] package/network-manager: disable
 introspection
Message-ID: <20200715213433.02F7281321@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=adfb36c07d2cd8da690b0c64612021bc00099361
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build will fail if gobject-introspection is built before network-manager
but python-gobject is not:

configure: error: "--enable-introspection aims to build the settings documentation. This requires GObject introspection for python (pygobject)

To avoid this build failure and because we don't need documentation,
just disable introspection

Fixes:
 - http://autobuild.buildroot.org/results/d3b1bc2fa7559e66465033c455176761d6e184d1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
