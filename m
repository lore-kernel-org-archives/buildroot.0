From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:28 +0200
Subject: [Buildroot] [PATCH 048/100] lightning: remove -lintl linking
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-49-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.9.4
