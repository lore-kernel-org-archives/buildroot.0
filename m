From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  3 Jun 2020 12:38:47 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/bcm2835: disable doxygen doc
 generation
Message-ID: <20200603103849.20415-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - split of from original patch (suggested by Thomas Petazzoni)
---
 package/bcm2835/bcm2835.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/bcm2835/bcm2835.mk b/package/bcm2835/bcm2835.mk
index d43dd7e574..f75b2fc69e 100644
--- a/package/bcm2835/bcm2835.mk
+++ b/package/bcm2835/bcm2835.mk
@@ -10,4 +10,7 @@ BCM2835_LICENSE = GPL-3.0
 BCM2835_LICENSE_FILES = COPYING
 BCM2835_INSTALL_STAGING = YES
 
+# disable doxygen doc generation
+BCM2835_CONF_ENV = ac_cv_prog_DOXYGEN=/bin/true
+
 $(eval $(autotools-package))
-- 
2.26.2
