From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon,  2 Mar 2020 09:49:13 -0800
Subject: [Buildroot] [PATCH/next 1/3] package/inadyn: remove dependency on
 libite
Message-ID: <20200302174915.6483-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The dependency for libite was removed in commit e27bfbf dating back a couple
of years.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/inadyn/Config.in | 1 -
 package/inadyn/inadyn.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/inadyn/Config.in b/package/inadyn/Config.in
index d03db83e3a..3589823da4 100644
--- a/package/inadyn/Config.in
+++ b/package/inadyn/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_INADYN
 	depends on BR2_USE_MMU # Uses fork()
 	depends on !BR2_STATIC_LIBS # dlopen()
 	select BR2_PACKAGE_LIBCONFUSE
-	select BR2_PACKAGE_LIBITE
 	help
 	  INADYN is a free DynDNS client. It gives the possibility
 	  to have your own fixed hostname registered on the internet,
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 5f67849252..40a12e35cd 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -9,7 +9,7 @@ INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VE
 INADYN_SOURCE = inadyn-$(INADYN_VERSION).tar.xz
 INADYN_LICENSE = GPL-2.0+
 INADYN_LICENSE_FILES = COPYING
-INADYN_DEPENDENCIES = host-pkgconf libconfuse libite
+INADYN_DEPENDENCIES = host-pkgconf libconfuse
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 INADYN_CONF_OPTS += --enable-openssl
-- 
2.25.1
