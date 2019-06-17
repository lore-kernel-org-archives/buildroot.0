From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 20:15:17 +0200
Subject: [Buildroot] [git commit] package/pugixml: enable host build
Message-ID: <20190617182318.AFBBF812AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d71c636a32a83dc4e17163b011c1f60e23da6b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for host-waylandpp >= 0.2.5
https://github.com/NilsBrause/waylandpp/commit/433ce65b681c27d54e1e6b9a602f1c8291aabd54

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pugixml/pugixml.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index 8edaddd827..368f958920 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -15,6 +15,7 @@ PUGIXML_INSTALL_STAGING = YES
 # force-enable this option to support older gcc versions. See also:
 # https://gcc.gnu.org/onlinedocs/gcc/Long-Long.html
 PUGIXML_BUILD_DEFINES += PUGIXML_HAS_LONG_LONG
+HOST_PUGIXML_BUILD_DEFINES += PUGIXML_HAS_LONG_LONG
 
 ifeq ($(BR2_PACKAGE_PUGIXML_XPATH_SUPPORT),)
 PUGIXML_BUILD_DEFINES += PUGIXML_NO_XPATH
@@ -30,4 +31,9 @@ ifdef PUGIXML_BUILD_DEFINES
 PUGIXML_CONF_OPTS += -DBUILD_DEFINES="$(subst $(space),;,$(PUGIXML_BUILD_DEFINES))"
 endif
 
+HOST_PUGIXML_CONF_OPTS += \
+	-DBUILD_PKGCONFIG=ON \
+	-DBUILD_DEFINES="$(subst $(space),;,$(HOST_PUGIXML_BUILD_DEFINES))"
+
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
