From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Jul 2018 23:11:37 +0200
Subject: [Buildroot] [PATCH 03/50] package/busybox: invert dependency with
 wget
In-Reply-To: <cover.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <865354e2f6869fefcf56237274750ee614eb5a1c.1530565933.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/busybox/busybox.mk | 1 +
 package/wget/wget.mk       | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 2b60a7faef..a510bf564b 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_WGET),wget) \
 	$(if $(BR2_PACKAGE_WHOIS),whois)
 
 # Link against libtirpc if available so that we can leverage its RPC
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 36afea761a..28bd0a264f 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -11,11 +11,6 @@ WGET_DEPENDENCIES = host-pkgconf
 WGET_LICENSE = GPL-3.0+
 WGET_LICENSE_FILES = COPYING
 
-# Prefer full-blown wget over busybox
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-WGET_DEPENDENCIES += busybox
-endif
-
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 WGET_CONF_OPTS += --with-ssl=gnutls
 WGET_DEPENDENCIES += gnutls
-- 
2.14.1
