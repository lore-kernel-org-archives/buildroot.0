From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Apr 2020 11:55:23 +0200
Subject: [Buildroot] [git commit] package/pkcs11-helper: needs host-pkgconf
Message-ID: <20200426094044.CCD8A817DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=665c1a89637dd246a00ffa8188f3a6d41769b5d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pkg-config is used unconditionally in configure.ac to find dependencies
(openssl, gnutls and nss)

Fixes:
 - http://autobuild.buildroot.org/results/c01ae4f1a7babf94c841d4bb737408a9c8869845

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkcs11-helper/pkcs11-helper.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkcs11-helper/pkcs11-helper.mk b/package/pkcs11-helper/pkcs11-helper.mk
index 24e0c65d84..a95340daf7 100644
--- a/package/pkcs11-helper/pkcs11-helper.mk
+++ b/package/pkcs11-helper/pkcs11-helper.mk
@@ -8,6 +8,7 @@ PKCS11_HELPER_VERSION = 1.26
 PKCS11_HELPER_SITE = $(call github,OpenSC,pkcs11-helper,pkcs11-helper-$(PKCS11_HELPER_VERSION))
 PKCS11_HELPER_LICENSE = GPL-2.0 or BSD-3-Clause
 PKCS11_HELPER_LICENSE_FILES = COPYING COPYING.BSD COPYING.GPL
+PKCS11_HELPER_DEPENDENCIES = host-pkgconf
 PKCS11_HELPER_AUTORECONF = YES
 PKCS11_HELPER_INSTALL_STAGING = YES
 
