From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Apr 2012 23:32:29 +0200
Subject: [Buildroot] [git commit] gnutls: security bump to version 2.12.18
Message-ID: <20120402213357.29006969E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11c5f6971a8d179fb02a432ae988cde80b0f5212
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2012-1573

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
