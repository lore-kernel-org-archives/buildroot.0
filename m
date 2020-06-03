From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Jun 2020 23:14:17 +0200
Subject: [Buildroot] [git commit] package/bcm2835: disable doxygen doc
 generation
Message-ID: <20200603212420.63E2182AFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d555c1789e3318c8bd2dd6f3b1b09343a3405c36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
