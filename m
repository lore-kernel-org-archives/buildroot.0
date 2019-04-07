From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Apr 2019 21:42:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/rapidxml: fix install path
Message-ID: <20190407194246.29625-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

kodi-pvr-iptvsimple as of
https://github.com/kodi-pvr/pvr.iptvsimple/commit/d27b3ed1d379d2f865e95f08bdf2dbf086f8c0ad

depends on rapidxml but expects the headers in usr/include/rapidxml
instead of usr/include.

This changes the install path to be consistent with Debian and Gentoo:

https://packages.debian.org/stretch/all/librapidxml-dev/filelist
https://gitweb.gentoo.org/repo/gentoo.git/tree/dev-libs/rapidxml/rapidxml-1.13-r1.ebuild#n22

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rapidxml/rapidxml.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rapidxml/rapidxml.mk b/package/rapidxml/rapidxml.mk
index 9d034d8205..ef2dd3972b 100644
--- a/package/rapidxml/rapidxml.mk
+++ b/package/rapidxml/rapidxml.mk
@@ -21,7 +21,8 @@ define RAPIDXML_EXTRACT_CMDS
 endef
 
 define RAPIDXML_INSTALL_STAGING_CMDS
-	cp -dpfr $(@D)/*hpp $(STAGING_DIR)/usr/include
+	mkdir -p $(STAGING_DIR)/usr/include/rapidxml
+	cp -dpfr $(@D)/*hpp $(STAGING_DIR)/usr/include/rapidxml
 endef
 
 $(eval $(generic-package))
-- 
2.20.1
