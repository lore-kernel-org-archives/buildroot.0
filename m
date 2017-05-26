From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 May 2017 15:11:29 +0200
Subject: [Buildroot] [git commit] package/tvheadend: bump version
Message-ID: <20170601202856.89D2682A3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63fd7ac7e26c3eb8ab26998a129b49e3e0643501
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added optional pcre support implemented upstream by
https://github.com/tvheadend/tvheadend/commit/74a1c698c2c13bc9bfa6221aaf6b255e0e270e4c

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index cfd9c01..3154b32 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 94efc13b6c80c204dc4e3cf2ac79632f3c2cafe9cad4ee8948a71be6e4569a16  tvheadend-5cbaac172b4997fbf89667d79ac6e03b46460060.tar.gz
+sha256 1994e379c798b118243e70f7fa38064a9b288d6e38b9ced0e8ad465f5d2e8fd9  tvheadend-54e63e3f9af8fdc0d23f61f3cda7fa7b246c1732.tar.gz
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 5ac44da..d66c0a6 100644
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
