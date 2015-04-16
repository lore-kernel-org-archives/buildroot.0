From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Apr 2015 07:49:37 +0200
Subject: [Buildroot] [git commit] monit: bump to version 3.12.2
Message-ID: <20150416055852.C03D280454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=019dd87a38fb733191d6cc24b804b9b08dfac73b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file and remove the m4 directory creation from the monit.mk
which is now in the source tree.

[Thomas: as suggested by Baruch, keep only upstream sha256 hash.]

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/monit/monit.hash |    2 ++
 package/monit/monit.mk   |    8 +-------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/monit/monit.hash b/package/monit/monit.hash
new file mode 100644
index 0000000..3724490
--- /dev/null
+++ b/package/monit/monit.hash
@@ -0,0 +1,2 @@
+# From https://mmonit.com/monit/dist/monit-5.12.2.tar.gz.sha256:
+sha256	8ab0296d1aa2351b1573481592d7b5e06de1edd49dff1b5552839605a450914c  monit-5.12.2.tar.gz
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 1a81349..9f0a29a 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONIT_VERSION = 5.7
+MONIT_VERSION = 5.12.2
 MONIT_SITE = http://mmonit.com/monit/dist
 MONIT_LICENSE = AGPLv3 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
@@ -12,12 +12,6 @@ MONIT_LICENSE_FILES = COPYING
 # Touching Makefile.am:
 MONIT_AUTORECONF = YES
 
-# Missing m4/ directory in the source tree
-define MONIT_M4
-	mkdir $(@D)/m4
-endef
-MONIT_POST_PATCH_HOOKS += MONIT_M4
-
 MONIT_CONF_ENV = \
 	libmonit_cv_setjmp_available=yes \
 	libmonit_cv_vsnprintf_c99_conformant=yes
