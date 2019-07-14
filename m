From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 14:54:26 +0200
Subject: [Buildroot] [git commit] package/vte: add gnutls optional dependency
Message-ID: <20190714125239.EB77E803D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd9ff142ac6c311b6290259706c6fc11470898dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vte/vte.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/vte/vte.mk b/package/vte/vte.mk
index 90853cb4a5..031022fb51 100644
--- a/package/vte/vte.mk
+++ b/package/vte/vte.mk
@@ -10,6 +10,13 @@ VTE_SITE = http://ftp.gnome.org/pub/gnome/sources/vte/0.48
 VTE_DEPENDENCIES = host-pkgconf libgtk3 libxml2 pcre2
 VTE_LICENSE = LGPL-2.1+
 VTE_LICENSE_FILES = COPYING
-VTE_CONF_OPTS += --disable-introspection --without-gnutls --disable-vala
+VTE_CONF_OPTS += --disable-introspection --disable-vala
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+VTE_CONF_OPTS += --with-gnutls
+VTE_DEPENDENCIES += gnutls
+else
+VTE_CONF_OPTS += --without-gnutls
+endif
 
 $(eval $(autotools-package))
