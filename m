From: Dick Olsson <hi@senzilla.io>
Date: Sat, 01 May 2021 19:00:20 +0000
Subject: [Buildroot] [PATCH v2 1/1] package/{skalibs, execline, s6*,
 mdevd}: root prefix
Message-ID: <QGtdA2cPWOwJPXUQeX3ZDbP2xoZ08eKz92Kd7zoEJqQ@cp7-web-039.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The skaware packages are frequently used as the init system and service
management for machines. Therefore it is more logical to install these
packages to the root prefix.

Signed-off-by: Dick Olsson <hi@senzilla.io>

---

Changes since v1:

 - Addressed feedback from Arnout
 - Explicitly set the prefix=/

---
 package/execline/execline.mk                   | 10 +++++-----
 package/mdevd/mdevd.mk                         | 10 +++++-----
 package/s6-dns/s6-dns.mk                       | 10 +++++-----
 package/s6-linux-init/s6-linux-init.mk         | 14 +++++++-------
 package/s6-linux-utils/s6-linux-utils.mk       | 10 +++++-----
 package/s6-networking/s6-networking.mk         | 16 ++++++++--------
 package/s6-portable-utils/s6-portable-utils.mk | 10 +++++-----
 package/s6-rc/s6-rc.mk                         | 14 +++++++-------
 package/s6/s6.mk                               | 12 ++++++------
 package/skalibs/skalibs.mk                     |  2 +-
 10 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index 89265a10ed..c348d924b7 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -12,11 +12,11 @@ EXECLINE_INSTALL_STAGING = YES
 EXECLINE_DEPENDENCIES = skalibs
 
 EXECLINE_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	--prefix=/ \
+	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/include \
+	--with-dynlib=$(STAGING_DIR)/lib \
+	--with-lib=$(STAGING_DIR)/lib/skalibs \
 	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
 	$(SHARED_STATIC_LIBS_OPTS)
 
diff --git a/package/mdevd/mdevd.mk b/package/mdevd/mdevd.mk
index 89199be801..a0cd71e76e 100644
--- a/package/mdevd/mdevd.mk
+++ b/package/mdevd/mdevd.mk
@@ -12,11 +12,11 @@ MDEVD_INSTALL_STAGING = YES
 MDEVD_DEPENDENCIES = skalibs
 
 MDEVD_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	--prefix=/ \
+	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/include \
+	--with-dynlib=$(STAGING_DIR)/lib \
+	--with-lib=$(STAGING_DIR)/lib/skalibs \
 	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
 	$(SHARED_STATIC_LIBS_OPTS)
 
diff --git a/package/s6-dns/s6-dns.mk b/package/s6-dns/s6-dns.mk
index e108653913..dfde2c29f1 100644
--- a/package/s6-dns/s6-dns.mk
+++ b/package/s6-dns/s6-dns.mk
@@ -12,11 +12,11 @@ S6_DNS_INSTALL_STAGING = YES
 S6_DNS_DEPENDENCIES = skalibs
 
 S6_DNS_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	--prefix=/ \
+	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/include \
+	--with-dynlib=$(STAGING_DIR)/lib \
+	--with-lib=$(STAGING_DIR)/lib/skalibs \
 	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
 	$(SHARED_STATIC_LIBS_OPTS)
 
diff --git a/package/s6-linux-init/s6-linux-init.mk b/package/s6-linux-init/s6-linux-init.mk
index 2030ca7820..95595368de 100644
--- a/package/s6-linux-init/s6-linux-init.mk
+++ b/package/s6-linux-init/s6-linux-init.mk
@@ -11,13 +11,13 @@ S6_LINUX_INIT_LICENSE_FILES = COPYING
 S6_LINUX_INIT_DEPENDENCIES = s6 s6-linux-utils s6-portable-utils
 
 S6_LINUX_INIT_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/execline \
-	--with-lib=$(STAGING_DIR)/usr/lib/s6 \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	--prefix=/ \
+	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/include \
+	--with-dynlib=$(STAGING_DIR)/lib \
+	--with-lib=$(STAGING_DIR)/lib/execline \
+	--with-lib=$(STAGING_DIR)/lib/s6 \
+	--with-lib=$(STAGING_DIR)/lib/skalibs \
 	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
 	$(SHARED_STATIC_LIBS_OPTS)
 
diff --git a/package/s6-linux-utils/s6-linux-utils.mk b/package/s6-linux-utils/s6-linux-utils.mk
index c050a231c2..995ff1b855 100644
--- a/package/s6-linux-utils/s6-linux-utils.mk
+++ b/package/s6-linux-utils/s6-linux-utils.mk
@@ -11,11 +11,11 @@ S6_LINUX_UTILS_LICENSE_FILES = COPYING
 S6_LINUX_UTILS_DEPENDENCIES = skalibs
 
 S6_LINUX_UTILS_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	--prefix=/ \
+	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/include \
+	--with-dynlib=$(STAGING_DIR)/lib \
+	--with-lib=$(STAGING_DIR)/lib/skalibs \
 	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
 	$(SHARED_STATIC_LIBS_OPTS)
 
diff --git a/package/s6-networking/s6-networking.mk b/package/s6-networking/s6-networking.mk
index 96095d104f..03807f0652 100644
--- a/package/s6-networking/s6-networking.mk
+++ b/package/s6-networking/s6-networking.mk
@@ -12,14 +12,14 @@ S6_NETWORKING_INSTALL_STAGING = YES
 S6_NETWORKING_DEPENDENCIES = s6-dns s6
 
 S6_NETWORKING_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/execline \
-	--with-lib=$(STAGING_DIR)/usr/lib/s6 \
-	--with-lib=$(STAGING_DIR)/usr/lib/s6-dns \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	--prefix=/ \
+	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/include \
+	--with-dynlib=$(STAGING_DIR)/lib \
+	--with-lib=$(STAGING_DIR)/lib/execline \
+	--with-lib=$(STAGING_DIR)/lib/s6 \
+	--with-lib=$(STAGING_DIR)/lib/s6-dns \
+	--with-lib=$(STAGING_DIR)/lib/skalibs \
 	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
 	$(SHARED_STATIC_LIBS_OPTS)
 
diff --git a/package/s6-portable-utils/s6-portable-utils.mk b/package/s6-portable-utils/s6-portable-utils.mk
index b4bed5212d..fb910320ea 100644
--- a/package/s6-portable-utils/s6-portable-utils.mk
+++ b/package/s6-portable-utils/s6-portable-utils.mk
@@ -11,11 +11,11 @@ S6_PORTABLE_UTILS_LICENSE_FILES = COPYING
 S6_PORTABLE_UTILS_DEPENDENCIES = skalibs
 
 S6_PORTABLE_UTILS_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	--prefix=/ \
+	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/include \
+	--with-dynlib=$(STAGING_DIR)/lib \
+	--with-lib=$(STAGING_DIR)/lib/skalibs \
 	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
 	$(SHARED_STATIC_LIBS_OPTS)
 
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index f85c8ac5e4..05d7989735 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -12,13 +12,13 @@ S6_RC_INSTALL_STAGING = YES
 S6_RC_DEPENDENCIES = s6
 
 S6_RC_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/execline \
-	--with-lib=$(STAGING_DIR)/usr/lib/s6 \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	--prefix=/ \
+	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/include \
+	--with-dynlib=$(STAGING_DIR)/lib \
+	--with-lib=$(STAGING_DIR)/lib/execline \
+	--with-lib=$(STAGING_DIR)/lib/s6 \
+	--with-lib=$(STAGING_DIR)/lib/skalibs \
 	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
 	$(SHARED_STATIC_LIBS_OPTS)
 
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index 1a5757fe81..ead82d7eaf 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -12,12 +12,12 @@ S6_INSTALL_STAGING = YES
 S6_DEPENDENCIES = execline
 
 S6_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/execline \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	--prefix=/ \
+	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/include \
+	--with-dynlib=$(STAGING_DIR)/lib \
+	--with-lib=$(STAGING_DIR)/lib/execline \
+	--with-lib=$(STAGING_DIR)/lib/skalibs \
 	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
 	$(SHARED_STATIC_LIBS_OPTS)
 
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index a1d7035580..77db57de96 100644
--- a/package/skalibs/skalibs.mk
+++ b/package/skalibs/skalibs.mk
@@ -11,7 +11,7 @@ SKALIBS_LICENSE_FILES = COPYING
 SKALIBS_INSTALL_STAGING = YES
 
 SKALIBS_CONF_OPTS = \
-	--prefix=/usr \
+	--prefix=/ \
 	--with-default-path=/sbin:/usr/sbin:/bin:/usr/bin \
 	--with-sysdep-devurandom=yes \
 	$(SHARED_STATIC_LIBS_OPTS)
-- 
2.30.2
