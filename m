From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  1 Apr 2019 18:21:57 +0200
Subject: [Buildroot] [PATCH 2/3] package/pugixml: enable install of
 pugixml.pc
In-Reply-To: <20190401162158.29819-1-bernd.kuhls@t-online.de>
References: <20190401162158.29819-1-bernd.kuhls@t-online.de>
Message-ID: <20190401162158.29819-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for waylandpp >= 0.2.4 to detect pugixml:
https://github.com/NilsBrause/waylandpp/commit/0a61175003a0a34038e39092918768360d2dd1da#diff-af3b638bc2a3e6c650974192a53c7291R39

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pugixml/pugixml.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index 6f214c4de8..3c80622b11 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -30,5 +30,8 @@ ifdef PUGIXML_BUILD_DEFINES
 PUGIXML_CONF_OPTS += -DBUILD_DEFINES="$(subst $(space),;,$(PUGIXML_BUILD_DEFINES))"
 endif
 
+PUGIXML_CONF_OPTS += -DBUILD_PKGCONFIG=ON
+HOST_PUGIXML_CONF_OPTS += $(PUGIXML_CONF_OPTS)
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.20.1
