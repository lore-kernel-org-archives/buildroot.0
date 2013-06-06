From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jun 2013 15:03:55 +0200
Subject: [Buildroot] [git commit] gnutls: drop double libidn dependency
Message-ID: <20130606130642.68FDC8DE73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8587c198b523f66668969b8cd555ba65938693c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gnutls/gnutls.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 43ec977..5d07ff9 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -44,7 +44,6 @@ endif
 
 # libidn support for nommu must exclude the crywrap wrapper (uses fork)
 GNUTLS_CONF_OPT += $(if $(BR2_USE_MMU),,--disable-crywrap)
-GNUTLS_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBIDN),libidn)
 
 ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
 	GNUTLS_CONF_OPT += --enable-cryptodev
