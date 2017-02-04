From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Feb 2017 12:44:20 +0100
Subject: [Buildroot] [PATCH v3 07/38] package/xmlstarlet: add host variant
In-Reply-To: <20170204114451.20935-1-bernd.kuhls@t-online.de>
References: <20170204114451.20935-1-bernd.kuhls@t-online.de>
Message-ID: <20170204114451.20935-8-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for the Kodi skin package to control the default skin setup.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xmlstarlet/xmlstarlet.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index 61d38f29f..091c371e8 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -24,4 +24,7 @@ else
 XMLSTARLET_CONF_OPTS += --disable-static-libs
 endif
 
+HOST_XMLSTARLET_DEPENDENCIES += host-libxml2 host-libxslt
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.11.0
