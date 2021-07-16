From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:28:13 +0200
Subject: [Buildroot] [git commit] package/gcr: fix introspection option
Message-ID: <20210716205443.160929119B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=a0a59c6451ec5ac75c277f186de2655196a1fe6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

introspection option was wrongly named --with-introspection instead of
--enable-introspection since commit
d4e7c720aa78dbe659db82f4eb38ff58ebae4c57:

configure: WARNING: unrecognized options: --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --with-introspection

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcr/gcr.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
index 97a0e22064..7f71614bca 100644
--- a/package/gcr/gcr.mk
+++ b/package/gcr/gcr.mk
@@ -25,9 +25,9 @@ GCR_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 GCR_DEPENDENCIES += gobject-introspection host-libxslt
-GCR_CONF_OPTS += --with-introspection
+GCR_CONF_OPTS += --enable-introspection
 else
-GCR_CONF_OPTS += --without-introspection
+GCR_CONF_OPTS += --disable-introspection
 endif
 
 # Only the X11 backend is supported for the simple GUI
