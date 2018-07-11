From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 11 Jul 2018 22:51:19 +0300
Subject: [Buildroot] [PATCH v2 2/2] coreutils: optimize the '[' symlink
In-Reply-To: <2b42d6f4f947a7423813916cd6f8e5f37c5b113a.1531338679.git.baruch@tkos.co.il>
References: <2b42d6f4f947a7423813916cd6f8e5f37c5b113a.1531338679.git.baruch@tkos.co.il>
Message-ID: <5821c4c9a85e95a15423616c8a7f674df515b714.1531338679.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Link '[' directly to the coreutils binary instead of going through
'test'.

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: New patch in this series
---
 package/coreutils/coreutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 2fb4a32c794f..7e7251ff7396 100644
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
-- 
2.18.0
