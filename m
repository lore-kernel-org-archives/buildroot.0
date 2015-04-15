From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Wed, 15 Apr 2015 16:23:10 -0400
Subject: [Buildroot] [PATCH 1/1] monit: bump to version 3.12.2
Message-ID: <1429129390-28278-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file and remove the m4 directory creation from the monit.mk
which is now in the source tree.

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
---
 package/monit/monit.hash | 6 ++++++
 package/monit/monit.mk   | 8 +-------
 2 files changed, 7 insertions(+), 7 deletions(-)
 create mode 100644 package/monit/monit.hash

diff --git a/package/monit/monit.hash b/package/monit/monit.hash
new file mode 100644
index 0000000..9313c7a
--- /dev/null
+++ b/package/monit/monit.hash
@@ -0,0 +1,6 @@
+# From https://mmonit.com/monit/dist/monit-5.12.2.tar.gz.sha256:
+sha256	8ab0296d1aa2351b1573481592d7b5e06de1edd49dff1b5552839605a450914c  monit-5.12.2.tar.gz
+
+# Locally calculated:
+md5	5f5cf4c18b42e8091b49b4e07cf972ce	monit-5.12.2.tar.gz
+sha1	5ffdcc0c5dfbc12bfe2e35dd33d2626a038771fc	monit-5.12.2.tar.gz
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
-- 
1.8.3.4
