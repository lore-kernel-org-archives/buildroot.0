From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:20 +0200
Subject: [Buildroot] [PATCH 040/100] libconfuse: use the new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-41-thomas.petazzoni@free-electrons.com>
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
 package/libconfuse/libconfuse.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 5f1d5cd..07a73c8 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -11,10 +11,7 @@ LIBCONFUSE_INSTALL_STAGING = YES
 LIBCONFUSE_CONF_OPTS = --disable-rpath
 LIBCONFUSE_LICENSE = ISC
 LIBCONFUSE_LICENSE_FILES = LICENSE
-
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
-LIBCONFUSE_DEPENDENCIES += gettext
-endif
+LIBCONFUSE_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.9.4
