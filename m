From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 16 Apr 2015 20:52:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/exim: Dependency host-pkgconf is
	only needed for OpenSSL detection
Message-ID: <1429210360-4753-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/exim/exim.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 67dbd64..a95559d 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -9,7 +9,7 @@ EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
 EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPLv2+
 EXIM_LICENSE_FILES = LICENCE
-EXIM_DEPENDENCIES = pcre berkeleydb host-pkgconf
+EXIM_DEPENDENCIES = pcre berkeleydb
 
 # Modify a variable value. It must already exist in the file, either
 # commented or not.
@@ -63,7 +63,7 @@ endef
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-EXIM_DEPENDENCIES += openssl
+EXIM_DEPENDENCIES += openssl host-pkgconf
 define EXIM_USE_DEFAULT_CONFIG_FILE_OPENSSL
 	$(call exim-config-change,SUPPORT_TLS,yes)
 	$(call exim-config-change,USE_OPENSSL_PC,openssl)
-- 
1.7.10.4
