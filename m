From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 14 Jun 2017 21:18:35 +0300
Subject: [Buildroot] [PATCH 2/2] gnutls: switch to https download location
In-Reply-To: <629c7b2bda5194692d4508ec53cb3502cffd285b.1497464315.git.baruch@tkos.co.il>
References: <629c7b2bda5194692d4508ec53cb3502cffd285b.1497464315.git.baruch@tkos.co.il>
Message-ID: <0cab1f3bbca8cab8680a9135cdbcd02acc580186.1497464315.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HTTPS works better behind a certain corporate firewalls.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/gnutls/gnutls.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 3c76c30af888..fa92a887f0c8 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -7,7 +7,7 @@
 GNUTLS_VERSION_MAJOR = 3.5
 GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).13
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
-GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
+GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library), GPL-3.0+ (gnutls-openssl library)
 GNUTLS_LICENSE_FILES = doc/COPYING doc/COPYING.LESSER
 GNUTLS_DEPENDENCIES = host-pkgconf libunistring libtasn1 nettle pcre
-- 
2.11.0
