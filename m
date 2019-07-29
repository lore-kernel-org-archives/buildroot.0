From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 29 Jul 2019 15:20:35 +0200
Subject: [Buildroot] [PATCH 1/2] package/gtkperf: fix build with NLS
Message-ID: <20190729132036.18721-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/747469b359dd05cfa05b4295958f8a8175166cfe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gtkperf/gtkperf.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gtkperf/gtkperf.mk b/package/gtkperf/gtkperf.mk
index 1d1230f1ed..cc0433984c 100644
--- a/package/gtkperf/gtkperf.mk
+++ b/package/gtkperf/gtkperf.mk
@@ -7,8 +7,9 @@
 GTKPERF_VERSION = 0.40
 GTKPERF_SOURCE = gtkperf_$(GTKPERF_VERSION).tar.gz
 GTKPERF_SITE = http://downloads.sourceforge.net/project/gtkperf/gtkperf/$(GTKPERF_VERSION)
-GTKPERF_DEPENDENCIES = libgtk2
+GTKPERF_DEPENDENCIES = libgtk2 $(TARGET_NLS_DEPENDENCIES)
 GTKPERF_LICENSE = GPL-2.0
 GTKPERF_LICENSE_FILES = COPYING
+GTKPERF_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 $(eval $(autotools-package))
-- 
2.20.1
