From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Jul 2014 00:00:37 +0200
Subject: [Buildroot] [PATCH 3/6 v3] package/wget: use the new gettextize
	infra
In-Reply-To: <cover.1405547907.git.yann.morin.1998@free.fr>
References: <cover.1405547907.git.yann.morin.1998@free.fr>
Message-ID: <8caac10c3379a324a3fc71a0122601d5f2ee5224.1405547907.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of using a custom hook to gettextize wget, use the new
gettextize infra we just added in the previous patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

---
Changes v2 -> v3:
  - reword commit log  (Gustavo)
  - remove comment  (Baruch)
---
 package/wget/wget.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 56ccfb5..8046a61 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -12,14 +12,7 @@ WGET_LICENSE_FILES = COPYING
 
 # patching gnulib .m4 file
 WGET_AUTORECONF = YES
-
-# Ugly kludge to fix autoreconf with old gettext infra
-# We need to gettextize before autoreconf to upgrade
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
