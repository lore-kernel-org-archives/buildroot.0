From: Erico Nunes <nunes.erico@gmail.com>
Date: Thu, 13 Oct 2016 20:27:46 +0200
Subject: [Buildroot] [PATCH 1/1] fwts: needs host-bison and host-flex
Message-ID: <1476383266-30963-1-git-send-email-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/2e6bc77e89868d7a9902123ffb602c5b745d4580

Tested in a minimal debian environment, there should be no missing host
package dependencies after these.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 package/fwts/fwts.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index c63e2c5..7ec1d5e 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -10,7 +10,7 @@ FWTS_STRIP_COMPONENTS = 0
 FWTS_LICENSE = GPLv2, LGPLv2.1, Custom
 FWTS_LICENSE_FILES = debian/copyright
 FWTS_AUTORECONF = YES
-FWTS_DEPENDENCIES = host-pkgconf json-c libglib2 \
+FWTS_DEPENDENCIES = host-bison host-flex host-pkgconf json-c libglib2 \
 	$(if $(BR2_PACKAGE_DTC),dtc)
 
 $(eval $(autotools-package))
-- 
2.7.4
