From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 19:08:20 +0200
Subject: [Buildroot] [git commit] package/rapidxml: fix install path
Message-ID: <20190410170412.AF72781D77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0209a99e9394910277af559d840eb06e7f352e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kodi-pvr-iptvsimple as of
https://github.com/kodi-pvr/pvr.iptvsimple/commit/d27b3ed1d379d2f865e95f08bdf2dbf086f8c0ad

depends on rapidxml but expects the headers in usr/include/rapidxml
instead of usr/include.

This changes the install path to be consistent with Debian and Gentoo:

https://packages.debian.org/stretch/all/librapidxml-dev/filelist
https://gitweb.gentoo.org/repo/gentoo.git/tree/dev-libs/rapidxml/rapidxml-1.13-r1.ebuild#n22

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
