From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 25 May 2017 18:59:40 +0200
Subject: [Buildroot] [PATCH/next] package/tvheadend: bump version
Message-ID: <20170525165940.3929-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added optional pcre support implemented upstream by
https://github.com/tvheadend/tvheadend/commit/74a1c698c2c13bc9bfa6221aaf6b255e0e270e4c

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index cfd9c01bd..3154b3276 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 94efc13b6c80c204dc4e3cf2ac79632f3c2cafe9cad4ee8948a71be6e4569a16  tvheadend-5cbaac172b4997fbf89667d79ac6e03b46460060.tar.gz
+sha256 1994e379c798b118243e70f7fa38064a9b288d6e38b9ced0e8ad465f5d2e8fd9  tvheadend-54e63e3f9af8fdc0d23f61f3cda7fa7b246c1732.tar.gz
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 5ac44daf8..d66c0a6b3 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 5cbaac172b4997fbf89667d79ac6e03b46460060
+TVHEADEND_VERSION = 54e63e3f9af8fdc0d23f61f3cda7fa7b246c1732
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
@@ -57,6 +57,13 @@ TVHEADEND_DEPENDENCIES += liburiparser
 TVHEADEND_CFLAGS += $(if $(BR2_USE_WCHAR),,-DURI_NO_UNICODE)
 endif
 
+ifeq ($(BR2_PACKAGE_PCRE),y)
+TVHEADEND_DEPENDENCIES += pcre
+TVHEADEND_CONF_OPTS += --enable-pcre
+else
+TVHEADEND_CONF_OPTS += --disable-pcre
+endif
+
 TVHEADEND_DEPENDENCIES += dtv-scan-tables
 
 # The tvheadend build system expects the transponder data to be present inside
-- 
2.11.0
