From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Jul 2018 16:41:22 +0200
Subject: [Buildroot] [git commit] coreutils: optimize the '[' symlink
Message-ID: <20180716143659.5946C886C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efa6946d4b43b8a07a7d0e4dcbfe1bd31503e1d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Link '[' directly to the coreutils binary instead of going through
'test'.

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/coreutils/coreutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 2fb4a32c79..7e7251ff73 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -112,7 +112,7 @@ endif
 
 define COREUTILS_CLEANUP
 	# link for archaic shells
-	ln -fs test $(TARGET_DIR)/usr/bin/[
+	ln -fs coreutils $(TARGET_DIR)/usr/bin/[
 	# gnu thinks chroot is in bin, debian thinks it's in sbin
 	rm -f $(TARGET_DIR)/usr/bin/chroot
 	ln -sf ../bin/coreutils $(TARGET_DIR)/usr/sbin/chroot
