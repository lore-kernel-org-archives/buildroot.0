From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  3 Dec 2018 08:30:42 +0100
Subject: [Buildroot] [PATCH 1/2] atk: remove unrecognized configure options
Message-ID: <20181203073043.21021-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove --disable-glibtest and --enable-explicit-deps, these options are
not recognized:
configure: WARNING: unrecognized options: --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --disable-glibtest, --enable-explicit-deps

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/atk/atk.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 64950bfd08..babb00d244 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -12,7 +12,6 @@ ATK_LICENSE = LGPL-2.0+
 ATK_LICENSE_FILES = COPYING
 ATK_INSTALL_STAGING = YES
 ATK_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
-ATK_CONF_OPTS = --disable-glibtest --enable-explicit-deps=no
 ATK_DEPENDENCIES = libglib2 host-pkgconf
 
 $(eval $(autotools-package))
-- 
2.14.1
