From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 16:35:32 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/gtkperf: fix
 build with NLS
Message-ID: <20190820143247.D130D83A52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=144176c13dc94a2c7a9a31ec44bcccdaf8b44d39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes:
 - http://autobuild.buildroot.org/results/747469b359dd05cfa05b4295958f8a8175166cfe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ae337151ec0d59e321c83bcd8e5285596acc5654)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
