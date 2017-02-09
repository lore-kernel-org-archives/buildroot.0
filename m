From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  9 Feb 2017 21:50:17 +0200
Subject: [Buildroot] [PATCH 6/7] ocrad: use generic extract command
In-Reply-To: <a74544c971456bb628345f38c83de4148a6ca1e9.1486669818.git.baruch@tkos.co.il>
References: <a74544c971456bb628345f38c83de4148a6ca1e9.1486669818.git.baruch@tkos.co.il>
Message-ID: <5a1a4257f0261563eb4f273addc210d99de18a69.1486669818.git.baruch@tkos.co.il>
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
