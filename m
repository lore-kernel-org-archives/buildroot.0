From: Dick Olsson <hi@senzilla.io>
Date: Sat, 01 May 2021 14:59:35 +0000
Subject: [Buildroot] [PATCH 1/1] package/{skalibs, execline, s6*,
 mdevd}: root prefix
Message-ID: <8tg0vd3yEYkYcEIy8yRLmzfPAlTLoJs6Lp7pOO2fpM@cp4-web-034.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The skaware packages are frequently used as the init system and for
service management on machines. Therefore it is more logical to install
these packages to the root prefix (default configure value).

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 package/execline/execline.mk                   |  9 ++++-----
 package/mdevd/mdevd.mk                         |  9 ++++-----
 package/s6-dns/s6-dns.mk                       |  9 ++++-----
 package/s6-linux-init/s6-linux-init.mk         | 13 ++++++-------
 package/s6-linux-utils/s6-linux-utils.mk       |  9 ++++-----
 package/s6-networking/s6-networking.mk         | 15 +++++++--------
 package/s6-portable-utils/s6-portable-utils.mk |  9 ++++-----
 package/s6-rc/s6-rc.mk                         | 13 ++++++-------
 package/s6/s6.mk                               | 11 +++++------
 package/skalibs/skalibs.mk                     |  1 -
 10 files changed, 44 insertions(+), 54 deletions(-)

diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index 0ab5a03f2e..d37456371b 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -12,11 +12,10 @@ EXECLINE_INSTALL_STAGING = YES
 EXECLINE_DEPENDENCIES = skalibs
 
 EXECLINE_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/include \
+	--with-dynlib=$(STAGING_DIR)/lib \
+	--with-lib=$(STAGING_DIR)/lib/skalibs \
 	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
 	$(SHARED_STATIC_LIBS_OPTS)
 
diff --git a/package/mdevd/mdevd.mk b/package/mdevd/mdevd.mk
index e2924009f5..202e324fa8 100644
--- a/package/mdevd/mdevd.mk
+++ b/package/mdevd/mdevd.mk
@@ -12,11 +12,10 @@ MDEVD_INSTALL_STAGING = YES
 MDEVD_DEPENDENCIES = skalibs
 
 MDEVD_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/include \
+	--with-dynlib=$(STAGING_DIR)/lib \
+	--with-lib=$(STAGING_DIR)/lib/skalibs \
 	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
 	$(SHARED_STATIC_LIBS_OPTS)
 
diff --git a/package/s6-dns/s6-dns.mk b/package/s6-dns/s6-dns.mk
index 9ed75bd600..448c11138f 100644
--- a/package/s6-dns/s6-dns.mk
+++ b/package/s6-dns/s6-dns.mk
@@ -12,11 +12,10 @@ S6_DNS_INSTALL_STAGING = YES
 S6_DNS_DEPENDENCIES = skalibs
 
 S6_DNS_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/include \
+	--with-dynlib=$(STAGING_DIR)/lib \
+	--with-lib=$(STAGING_DIR)/lib/skalibs \
 	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
 	$(SHARED_STATIC_LIBS_OPTS)
 
diff --git a/package/s6-linux-init/s6-linux-init.mk b/package/s6-linux-init/s6-linux-init.mk
index efd4984085..d29532902d 100644
--- a/package/s6-linux-init/s6-linux-init.mk
+++ b/package/s6-linux-init/s6-linux-init.mk
@@ -11,13 +11,12 @@ S6_LINUX_INIT_LICENSE_FILES = COPYING
 S6_LINUX_INIT_DEPENDENCIES = s6 s6-linux-utils s6-portable-utils
 
 S6_LINUX_INIT_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/execline \
-	--with-lib=$(STAGING_DIR)/usr/lib/s6 \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/include \
+	--with-dynlib=$(STAGING_DIR)/lib \
+	--with-lib=$(STAGING_DIR)/lib/execline \
+	--with-lib=$(STAGING_DIR)/lib/s6 \
+	--with-lib=$(STAGING_DIR)/lib/skalibs \
 	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
 	$(SHARED_STATIC_LIBS_OPTS)
 
diff --git a/package/s6-linux-utils/s6-linux-utils.mk b/package/s6-linux-utils/s6-linux-utils.mk
index dcc4f9e4b2..9397594b94 100644
--- a/package/s6-linux-utils/s6-linux-utils.mk
+++ b/package/s6-linux-utils/s6-linux-utils.mk
@@ -11,11 +11,10 @@ S6_LINUX_UTILS_LICENSE_FILES = COPYING
 S6_LINUX_UTILS_DEPENDENCIES = skalibs
 
 S6_LINUX_UTILS_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/include \
+	--with-dynlib=$(STAGING_DIR)/lib \
+	--with-lib=$(STAGING_DIR)/lib/skalibs \
 	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
 	$(SHARED_STATIC_LIBS_OPTS)
 
diff --git a/package/s6-networking/s6-networking.mk b/package/s6-networking/s6-networking.mk
index d687c567cd..7ed47752eb 100644
--- a/package/s6-networking/s6-networking.mk
+++ b/package/s6-networking/s6-networking.mk
@@ -12,14 +12,13 @@ S6_NETWORKING_INSTALL_STAGING = YES
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
index 9da165b49b..d2465e43cc 100644
--- a/package/s6-portable-utils/s6-portable-utils.mk
+++ b/package/s6-portable-utils/s6-portable-utils.mk
@@ -11,11 +11,10 @@ S6_PORTABLE_UTILS_LICENSE_FILES = COPYING
 S6_PORTABLE_UTILS_DEPENDENCIES = skalibs
 
 S6_PORTABLE_UTILS_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/include \
+	--with-dynlib=$(STAGING_DIR)/lib \
+	--with-lib=$(STAGING_DIR)/lib/skalibs \
 	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
 	$(SHARED_STATIC_LIBS_OPTS)
 
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index 4e0ef57d7a..762bf88d99 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -12,13 +12,12 @@ S6_RC_INSTALL_STAGING = YES
 S6_RC_DEPENDENCIES = s6
 
 S6_RC_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/execline \
-	--with-lib=$(STAGING_DIR)/usr/lib/s6 \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/include \
+	--with-dynlib=$(STAGING_DIR)/lib \
+	--with-lib=$(STAGING_DIR)/lib/execline \
+	--with-lib=$(STAGING_DIR)/lib/s6 \
+	--with-lib=$(STAGING_DIR)/lib/skalibs \
 	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
 	$(SHARED_STATIC_LIBS_OPTS)
 
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index 443ecbbffd..abf6b72ae6 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -12,12 +12,11 @@ S6_INSTALL_STAGING = YES
 S6_DEPENDENCIES = execline
 
 S6_CONF_OPTS = \
-	--prefix=/usr \
-	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
-	--with-include=$(STAGING_DIR)/usr/include \
-	--with-dynlib=$(STAGING_DIR)/usr/lib \
-	--with-lib=$(STAGING_DIR)/usr/lib/execline \
-	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	--with-sysdeps=$(STAGING_DIR)/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/include \
+	--with-dynlib=$(STAGING_DIR)/lib \
+	--with-lib=$(STAGING_DIR)/lib/execline \
+	--with-lib=$(STAGING_DIR)/lib/skalibs \
 	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
 	$(SHARED_STATIC_LIBS_OPTS)
 
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index f92859ff26..80aa19ab37 100644
--- a/package/skalibs/skalibs.mk
+++ b/package/skalibs/skalibs.mk
@@ -11,7 +11,6 @@ SKALIBS_LICENSE_FILES = COPYING
 SKALIBS_INSTALL_STAGING = YES
 
 SKALIBS_CONF_OPTS = \
-	--prefix=/usr \
 	--with-default-path=/sbin:/usr/sbin:/bin:/usr/bin \
 	--with-sysdep-devurandom=yes \
 	$(SHARED_STATIC_LIBS_OPTS)
-- 
2.30.2
