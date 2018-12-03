From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 13:29:20 +0100
Subject: [Buildroot] [git commit] package/atk: remove unrecognized configure
 options
Message-ID: <20181203122553.D30D58A4ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa7ad9b7983ca0237499159c2f8774bbac35af60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove --disable-glibtest and --enable-explicit-deps, these options are
not recognized:
configure: WARNING: unrecognized options: --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --disable-glibtest, --enable-explicit-deps

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
