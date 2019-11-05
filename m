From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  5 Nov 2019 20:52:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/rauc: fix host build
Message-ID: <20191105195248.30000-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use --without-dbuspolicydir to fix build on host

Fixes:
 - http://autobuild.buildroot.org/results/1700950e682e48bdb99a0051af062f5db5997c6c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rauc/rauc.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 451d3c898b..a49a580781 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -36,7 +36,11 @@ HOST_RAUC_DEPENDENCIES = \
 	host-libglib2 \
 	host-squashfs \
 	$(if $(BR2_PACKAGE_HOST_LIBP11),host-libp11)
-HOST_RAUC_CONF_OPTS += --disable-network --disable-json --disable-service
+HOST_RAUC_CONF_OPTS += \
+	--disable-network \
+	--disable-json \
+	--disable-service \
+	--without-dbuspolicydir
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.23.0
