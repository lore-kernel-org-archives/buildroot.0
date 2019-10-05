From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 23:34:59 +0200
Subject: [Buildroot] [git commit] package/nfs-utils: fix nfs-utils_env.sh
 path
Message-ID: <20191005212924.4B7E988F96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74aab4ae06cb29ca93cf36f0e5956290ede785e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Per upstream commit bf12e1fa9f48e8ee91a2869e69484c70595b5160
https://cdn.kernel.org/pub/linux/utils/nfs-utils/1.3.4/1.3.4-Changelog

Currently nfs-utils_env.sh is installed in a
directory that is own by systemd. They requested
via https://bugzilla.redhat.com/show_bug.cgi?id=1303113
to move the script into /usr/libexec/nfs-utils

As such we must update the installation path for nfs-utils_env.sh.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nfs-utils/nfs-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 9d3e5e7563..cb2caa03f0 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -93,7 +93,7 @@ define NFS_UTILS_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/etc/systemd/system/remote-fs.target.wants/nfs-client.target
 
 	$(INSTALL) -D -m 0755 package/nfs-utils/nfs-utils_env.sh \
-		$(TARGET_DIR)/usr/lib/systemd/scripts/nfs-utils_env.sh
+		$(TARGET_DIR)/usr/libexec/nfs-utils/nfs-utils_env.sh
 
 	$(INSTALL) -D -m 0644 package/nfs-utils/nfs-utils_tmpfiles.conf \
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/nfs-utils.conf
