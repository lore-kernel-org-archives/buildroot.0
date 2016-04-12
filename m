From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 Apr 2016 19:56:30 +0300
Subject: [Buildroot] [PATCH] gutenprint: fix host installation
Message-ID: <a465019a350db47bb0f8527a628f5df0ef74eecd.1460480190.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set DESTDIR to avoid installation attempt into build host directories.

Fixes:
http://autobuild.buildroot.net/results/bca/bca299631949c7699682af41e3f1373dd10866ed/
http://autobuild.buildroot.net/results/294/294dfc02ee95caaac4be9fd632c399bb2c7d3f83/
http://autobuild.buildroot.net/results/8ce/8ce0c14d92f34245a87758db60c618916be48586/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gutenprint/gutenprint.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index 7e3024d400af..2ee411f66cc3 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -69,6 +69,8 @@ HOST_GUTENPRINT_CONF_OPTS = \
 	--disable-testpattern \
 	--without-cups
 
+HOST_GUTENPRINT_INSTALL_OPTS = DESTDIR=$(HOST_DIR) install
+
 # Needed by autoreconf
 define GUTENPRINT_CREATE_M4_DIR
 	mkdir -p $(@D)/m4local
-- 
2.8.0.rc3
