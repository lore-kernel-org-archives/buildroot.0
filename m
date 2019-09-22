From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 22 Sep 2019 20:04:52 +0200
Subject: [Buildroot] [git commit] package/policycoreutils: drop
 host-dbus-glib dependency from host-policycoreutils
Message-ID: <20190922180710.6E59D8F116@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1230b289af24de139556ae9ca980ee3b4ff6eb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since SELinux 2.7, restorecond has been moved to a separate package
from policycoreutils. Due to this, host-dbus-glib is no longer needed
to build host-policycoreutils.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
