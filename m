From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 15 Mar 2018 23:50:08 +0100
Subject: [Buildroot] [PATCH 2/6] package/enlightenment: fix meson warning
In-Reply-To: <20180315225012.9845-1-romain.naour@gmail.com>
References: <20180315225012.9845-1-romain.naour@gmail.com>
Message-ID: <20180315225012.9845-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--disable-rpath was added by m4/lib-link.m4 with autotools based
buildsystem. Now we use meson, we don't have such option anymore.

The autotools eet-eet and eldbus_codegen options are named respectively
eet and eldbus-codegen with meson.

Fixes:
WARNING: Unknown command line options: "eet-eet, eldbus_codegen, rpath"

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
This patch can be backported to 2018.02.x
---
 package/enlightenment/enlightenment.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 17309619ad..0d87119bb3 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -22,10 +22,9 @@ ENLIGHTENMENT_MESON_OPTS += \
 	--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
 	--cross-file=$(HOST_DIR)/etc/meson/cross-compilation.conf \
 	-Dedje-cc=$(HOST_DIR)/bin/edje_cc \
-	-Deet-eet=$(HOST_DIR)/bin/eet \
-	-Deldbus_codegen=$(HOST_DIR)/bin/eldbus-codegen \
-	-Dpam=false \
-	-Drpath=false
+	-Deet=$(HOST_DIR)/bin/eet \
+	-Deldbus-codegen=$(HOST_DIR)/bin/eldbus-codegen \
+	-Dpam=false
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 ENLIGHTENMENT_MESON_OPTS += -Dsystemd=true
-- 
2.14.3
