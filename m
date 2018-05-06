From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 May 2018 13:57:51 +0200
Subject: [Buildroot] [PATCH] package/patch: fix xattr option
Message-ID: <20180506115751.6317-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The name of fthe configure option is, and has always been,
 --enable-xattr, not --enable-attr. Otherwise, configure
whines:
    configure: WARNING: unrecognized options: --enable-attr

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/patch/patch.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index 33f0039d60..d581682c70 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -11,10 +11,10 @@ PATCH_LICENSE = GPL-3.0+
 PATCH_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_ATTR),y)
-PATCH_CONF_OPTS += --enable-attr
+PATCH_CONF_OPTS += --enable-xattr
 PATCH_DEPENDENCIES += attr
 else
-PATCH_CONF_OPTS += --disable-attr
+PATCH_CONF_OPTS += --disable-xattr
 endif
 
 $(eval $(autotools-package))
-- 
2.14.1
