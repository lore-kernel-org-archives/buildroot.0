From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 09:49:49 +0200
Subject: [Buildroot] [git commit] package/wget: use the new gettextize infra
Message-ID: <20140717075142.2E72B9D26A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=70c2514b8ab4365fbedeffb5466ae0b21c7fdae5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of using a custom hook to gettextize wget, use the new
gettextize infra we just added in the previous patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wget/wget.mk |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

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
