From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 13 Jul 2011 19:05:58 +0200
Subject: [Buildroot] [PATCH] gnutls: update to version 2.10.3
Message-ID: <1310576758-9980-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update gnutls to the latest release that still uses libgcrypt.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/gnutls/gnutls.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 5f31e1e..b62ed3c 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,11 +4,12 @@
 #
 #############################################################
 
-GNUTLS_VERSION = 2.8.6
+GNUTLS_VERSION = 2.10.3
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.bz2
 GNUTLS_SITE = http://ftp.gnu.org/gnu/gnutls/
-GNUTLS_DEPENDENCIES = libgcrypt
 GNUTLS_CONF_OPT += --without-libgcrypt-prefix
 GNUTLS_INSTALL_STAGING = YES
 
+GNUTLS_DEPENDENCIES = host-pkg-config libglib2 libgcrypt
+
 $(eval $(call AUTOTARGETS,package,gnutls))
-- 
1.7.1
