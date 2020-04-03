From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Fri,  3 Apr 2020 21:53:04 +0200
Subject: [Buildroot] [PATCH] package/cegui: force c++11 when xerces is used
Message-ID: <20200403195305.33887-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/ea04be78b31b3409801597fc0ebe04627742c0c8
 - http://autobuild.buildroot.net/results/7de3a07c304e3939ec9fd164328d004a5a9bba6d
 - http://autobuild.buildroot.net/results/472b4e8438c9100e06e401296f0417a463e5fcf1

and couple of others

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 package/cegui/cegui.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
index 657492a7f7..fe5ecc2e16 100644
--- a/package/cegui/cegui.mk
+++ b/package/cegui/cegui.mk
@@ -74,7 +74,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_XERCES),y)
 CEGUI_DEPENDENCIES += xerces
-CEGUI_CONF_OTPS += -DCEGUI_BUILD_XMLPARSER_XERCES=ON
+CEGUI_CONF_OTPS += -DCEGUI_BUILD_XMLPARSER_XERCES=ON \
+		    -DCMAKE_CXX_STANDARD=11 # char16_t
 else
 CEGUI_CONF_OTPS += -DCEGUI_BUILD_XMLPARSER_XERCES=OFF
 endif
-- 
2.26.0
