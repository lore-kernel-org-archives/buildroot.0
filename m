From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 14 Jan 2021 20:35:43 +0100
Subject: [Buildroot] [PATCH 1/2] package/gkrellm: fix build with NLS
Message-ID: <20210114193544.1965646-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/98d0eda546b09e60eebbd3c3a28493f09dff7e62

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gkrellm/gkrellm.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/gkrellm/gkrellm.mk b/package/gkrellm/gkrellm.mk
index 9e9dcd69ea..ebc0cd72f3 100644
--- a/package/gkrellm/gkrellm.mk
+++ b/package/gkrellm/gkrellm.mk
@@ -9,8 +9,10 @@ GKRELLM_SITE = http://gkrellm.srcbox.net/releases
 GKRELLM_SOURCE = gkrellm-$(GKRELLM_VERSION).tar.bz2
 GKRELLM_LICENSE = GPL-3.0+
 GKRELLM_LICENSE_FILES = COPYING COPYRIGHT
-GKRELLM_DEPENDENCIES = host-pkgconf libglib2
-GKRELLM_BUILD_OPTS = STRIP=""
+GKRELLM_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
+GKRELLM_BUILD_OPTS = \
+	STRIP="" \
+	SYS_LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
 GKRELLM_DEPENDENCIES += lm-sensors
-- 
2.29.2
