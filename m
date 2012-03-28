From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 28 Mar 2012 18:17:20 -0300
Subject: [Buildroot] [PATCH v2] gnutls: security bump to version 2.12.18
Message-ID: <1332969440-31027-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2012-1573

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/gnutls.mk |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 4cda997..ce570d5 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,11 +4,12 @@
 #
 #############################################################
 
-GNUTLS_VERSION = 2.10.5
+GNUTLS_VERSION = 2.12.18
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.bz2
-GNUTLS_SITE = http://ftp.gnu.org/gnu/gnutls/
-GNUTLS_DEPENDENCIES = libgcrypt
-GNUTLS_CONF_OPT += --without-libgcrypt-prefix
+GNUTLS_SITE = $(BR2_GNU_MIRROR)/gnutls
+GNUTLS_DEPENDENCIES = host-pkg-config libgcrypt
+GNUTLS_CONF_OPT = --with-libgcrypt --with-libgcrypt-prefix=$(STAGING_DIR)/usr \
+		--without-p11-kit
 GNUTLS_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.3.4
