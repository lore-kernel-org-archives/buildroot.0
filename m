From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Sep 2019 11:06:17 +0200
Subject: [Buildroot] [PATCH 01/30] package/policycoreutils: drop
 host-dbus-glib dependency from host-policycoreutils
In-Reply-To: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
References: <20190922090646.15130-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190922090646.15130-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since SELinux 2.7, restorecond has been moved to a separate package
from policycoreutils. Due to this, host-dbus-glib is no longer needed
to build host-policycoreutils.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/policycoreutils/policycoreutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 3b13e2716c..b117aa6902 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -61,7 +61,7 @@ define POLICYCOREUTILS_INSTALL_TARGET_CMDS
 endef
 
 HOST_POLICYCOREUTILS_DEPENDENCIES = \
-	host-libsemanage host-dbus-glib host-setools
+	host-libsemanage host-setools
 
 # Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
 # large file support.
-- 
2.21.0
