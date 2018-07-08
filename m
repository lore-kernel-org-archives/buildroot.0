From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 12:22:14 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with
 wget
Message-ID: <20180708110809.D00F3863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e3240ddcc6e884fcda952c9a1b1d2da961c163a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk | 1 +
 package/wget/wget.mk       | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 47047d1a81..e5de1b7284 100644
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
