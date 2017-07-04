From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:23 +0200
Subject: [Buildroot] [PATCH 043/100] libgpg-error: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-44-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves
using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
on gettext/host-gettext.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgpg-error/libgpg-error.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 183654b..2140258 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -10,10 +10,7 @@ LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
 LIBGPG_ERROR_LICENSE_FILES = COPYING COPYING.LIB
 LIBGPG_ERROR_INSTALL_STAGING = YES
 LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
-
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
-LIBGPG_ERROR_DEPENDENCIES += gettext
-endif
+LIBGPG_ERROR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 define LIBGPG_ERROR_FIX_CROSS_COMPILATION
 	cd $(@D)/src/syscfg && \
-- 
2.9.4
