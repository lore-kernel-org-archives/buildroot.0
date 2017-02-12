From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 12 Feb 2017 22:15:42 +0200
Subject: [Buildroot] [PATCH v3 5/5] ocrad: use generic extract command
In-Reply-To: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
References: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
Message-ID: <9406db55344ee70cc50c36ee484d246520084805.1486930542.git.baruch@tkos.co.il>
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
