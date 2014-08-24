From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 24 Aug 2014 18:53:04 +0200
Subject: [Buildroot] [PATCH 1/3] package/libevas-generic-loaders: needs zlib
Message-ID: <1408899186-28542-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/5d4/5d41cec63a15dc5f31460c8cecd6054119ddb1fc/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/efl/libevas-generic-loaders/Config.in                  | 1 +
 package/efl/libevas-generic-loaders/libevas-generic-loaders.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/efl/libevas-generic-loaders/Config.in b/package/efl/libevas-generic-loaders/Config.in
index 30fb88b..3f7581f 100644
--- a/package/efl/libevas-generic-loaders/Config.in
+++ b/package/efl/libevas-generic-loaders/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBEVAS_GENERIC_LOADERS
 	bool "libevas generic loaders"
 	select BR2_PACKAGE_LIBEINA
+	select BR2_PACKAGE_ZLIB
 	help
 	  These are additional "generic" loaders for Evas that are
 	  stand-alone executables that evas may run from its generic
diff --git a/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk b/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
index 152a75b..db0ca32 100644
--- a/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
+++ b/package/efl/libevas-generic-loaders/libevas-generic-loaders.mk
@@ -12,7 +12,7 @@ LIBEVAS_GENERIC_LOADERS_LICENSE_FILES = COPYING
 
 LIBEVAS_GENERIC_LOADERS_INSTALL_STAGING = YES
 
-LIBEVAS_GENERIC_LOADERS_DEPENDENCIES = libeina
+LIBEVAS_GENERIC_LOADERS_DEPENDENCIES = libeina zlib
 
 # For now, we only support the SVG loader
 LIBEVAS_GENERIC_LOADERS_CONF_OPT += \
-- 
1.9.3
