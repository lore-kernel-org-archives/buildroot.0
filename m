From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 10 Feb 2017 07:52:16 +0200
Subject: [Buildroot] [PATCH 4/4] ocrad: use generic extract command
In-Reply-To: <fc3fe88b52644ba99855a47be4950f2b9d8b7dd9.1486705936.git.baruch@tkos.co.il>
References: <fc3fe88b52644ba99855a47be4950f2b9d8b7dd9.1486705936.git.baruch@tkos.co.il>
Message-ID: <0de32cf181165d667ba404d79efd1f056b180e7f.1486705936.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The generic code now knows how to extract .tar.lz archives. Remove the local
extract code

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ocrad/ocrad.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/ocrad/ocrad.mk b/package/ocrad/ocrad.mk
index d19e83ef4279..54b607c79193 100644
--- a/package/ocrad/ocrad.mk
+++ b/package/ocrad/ocrad.mk
@@ -10,12 +10,6 @@ OCRAD_SITE = $(BR2_GNU_MIRROR)/ocrad
 OCRAD_LICENSE = GPLv3+
 OCRAD_LICENSE_FILES = COPYING
 OCRAD_INSTALL_STAGING = YES
-OCRAD_DEPENDENCIES = host-lzip
-
-define OCRAD_EXTRACT_CMDS
-	$(HOST_DIR)/usr/bin/lzip -d -c $(DL_DIR)/$(OCRAD_SOURCE) | \
-		tar --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
-endef
 
 # This is not a true autotools package.
 define OCRAD_CONFIGURE_CMDS
-- 
2.11.0
