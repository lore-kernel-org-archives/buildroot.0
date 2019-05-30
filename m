From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 30 May 2019 14:01:37 +0200
Subject: [Buildroot] [PATCH/next v2 1/3] package/pugixml: Enable host build
Message-ID: <20190530120139.21740-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for host-waylandpp >= 0.2.5
https://github.com/NilsBrause/waylandpp/commit/433ce65b681c27d54e1e6b9a602f1c8291aabd54

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes

 package/pugixml/pugixml.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index 8edaddd827..6f214c4de8 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -31,3 +31,4 @@ PUGIXML_CONF_OPTS += -DBUILD_DEFINES="$(subst $(space),;,$(PUGIXML_BUILD_DEFINES
 endif
 
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.20.1
