From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Jun 2017 21:40:08 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] gnutls: switch to https
	download location
Message-ID: <20170614194702.47ED57FDC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b468a0c5d015f2cb8f498b809f51c1965e41b14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

HTTPS works better behind certain corporate firewalls.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9289b2427585279d706a6a75219108d3cd0fdaba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/gnutls.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 11232d9..4d8981a 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -7,7 +7,7 @@
 GNUTLS_VERSION_MAJOR = 3.5
 GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).13
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
-GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
+GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPLv2.1+ (core library), GPLv3+ (gnutls-openssl library)
 GNUTLS_LICENSE_FILES = doc/COPYING doc/COPYING.LESSER
 GNUTLS_DEPENDENCIES = host-pkgconf libunistring libtasn1 nettle pcre
