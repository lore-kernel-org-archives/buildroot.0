From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Jul 2014 00:37:22 +0200
Subject: [Buildroot] [PATCH 3/5 v2] package/wget: use the new gettextize
	infra
In-Reply-To: <cover.1405463657.git.yann.morin.1998@free.fr>
References: <cover.1405463657.git.yann.morin.1998@free.fr>
Message-ID: <657e13ef2a1fa4267bc736842e99757364d735cd.1405463657.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the new gettextize infra we just added gettextize wget.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Baruch Siach <baruch@tkos.co.il>
---
 package/wget/wget.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 56ccfb5..b6a22b1 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -15,11 +15,7 @@ WGET_AUTORECONF = YES
 
 # Ugly kludge to fix autoreconf with old gettext infra
 # We need to gettextize before autoreconf to upgrade
-WGET_DEPENDENCIES += host-gettext
-define WGET_GETTEXTIZE
-	cd $(@D) ; $(HOST_DIR)/usr/bin/gettextize -f
-endef
-WGET_PRE_CONFIGURE_HOOKS += WGET_GETTEXTIZE
+WGET_GETTEXTIZE = YES
 
 # Prefer full-blown wget over busybox
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-- 
1.9.1
