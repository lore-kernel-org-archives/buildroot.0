From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 22:35:28 +0100
Subject: [Buildroot] [git commit] package/qpdf: add optional gnutls
 dependency
Message-ID: <20191222212800.EE1898DA7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=958fa56ebf0f56e49b97baa1c47d0df703366280
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gnutls is an optional dependency since version 9.1.0 and
https://github.com/qpdf/qpdf/commit/88bedb41fe82df312d62e364a5a216b62fc8807c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qpdf/qpdf.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
index 217bff8055..5d28a8007a 100644
--- a/package/qpdf/qpdf.mk
+++ b/package/qpdf/qpdf.mk
@@ -13,4 +13,11 @@ QPDF_DEPENDENCIES = host-pkgconf zlib jpeg
 
 QPDF_CONF_OPTS = --without-random
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+QPDF_CONF_OPTS += --enable-crypto-gnutls
+QPDF_DEPENDENCIES += gnutls
+else
+QPDF_CONF_OPTS += --disable-crypto-gnutls
+endif
+
 $(eval $(autotools-package))
