From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:28:44 +0200
Subject: [Buildroot] [git commit] lightning: remove -lintl linking
Message-ID: <20170704233516.9AC3780330@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3430b9997c1aedda4cfbbfe5ebd043d98297d0bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is not needed: libbfd is now properly linked against libintl, so
libintl is pulled in automatically.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lightning/lightning.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
index 0c2a101..2b4931b 100644
--- a/package/lightning/lightning.mk
+++ b/package/lightning/lightning.mk
@@ -13,8 +13,6 @@ LIGHTNING_INSTALL_STAGING = YES
 ifeq ($(BR2_PACKAGE_LIGHTNING_DISASSEMBLER),y)
 LIGHTNING_DEPENDENCIES += binutils zlib
 LIGHTNING_CONF_OPTS += --enable-disassembler
-# binutils libraries are not explicitly linked against gettext
-LIGHTNING_CONF_ENV += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),LIBS=-lintl)
 endif
 
 $(eval $(autotools-package))
