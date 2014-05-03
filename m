From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  3 May 2014 08:36:23 -0300
Subject: [Buildroot] [PATCH 3/3] p11-kit: bump to version 0.20.2
In-Reply-To: <1399116983-5037-1-git-send-email-gustavo@zacarias.com.ar>
References: <1399116983-5037-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1399116983-5037-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/p11-kit/Config.in  | 1 +
 package/p11-kit/p11-kit.mk | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/p11-kit/Config.in b/package/p11-kit/Config.in
index c72006f..2640a32 100644
--- a/package/p11-kit/Config.in
+++ b/package/p11-kit/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_P11_KIT
 	depends on !BR2_PREFER_STATIC_LIB
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_LIBTASN1
 	help
 	  Provides a way to load and enumerate PKCS#11 modules.
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 0db5ebf..9e210bb 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-P11_KIT_VERSION = 0.18.1
+P11_KIT_VERSION = 0.20.2
 P11_KIT_SITE = http://p11-glue.freedesktop.org/releases
-P11_KIT_DEPENDENCIES = host-pkgconf libtasn1
+P11_KIT_DEPENDENCIES = host-pkgconf libffi libtasn1
 P11_KIT_INSTALL_STAGING = YES
 P11_KIT_CONF_OPT = --disable-static
 P11_KIT_CONF_ENV = ac_cv_have_decl_program_invocation_short_name=yes \
-- 
1.8.3.2
