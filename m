From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Feb 2020 21:46:22 +0100
Subject: [Buildroot] [git commit] package/openvmtools: fix build with NLS
Message-ID: <20200223203431.04C918E845@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b4581e7b3eddfa82a59bed6d9d44a3641b7f619
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/e0e7ed448df8bdd6cb13a0989d7a6c7dbaa5bc4e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openvmtools/openvmtools.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 68afa17078..4201c6daa0 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -17,8 +17,14 @@ OPENVMTOOLS_CONF_OPTS = --with-dnet \
 	--without-icu --without-x --without-gtk2 \
 	--without-gtkmm --without-kernel-modules \
 	--disable-deploypkg --without-xerces
-OPENVMTOOLS_CONF_ENV += CUSTOM_DNET_CPPFLAGS=" "
-OPENVMTOOLS_DEPENDENCIES = host-nfs-utils libglib2 libdnet
+OPENVMTOOLS_CONF_ENV += \
+	CUSTOM_DNET_CPPFLAGS=" " \
+	LIBS=$(TARGET_NLS_LIBS)
+OPENVMTOOLS_DEPENDENCIES = \
+	host-nfs-utils \
+	libglib2 \
+	libdnet \
+	$(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 OPENVMTOOLS_DEPENDENCIES += libtirpc
