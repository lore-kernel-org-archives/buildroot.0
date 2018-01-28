From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Jan 2018 21:45:19 +0100
Subject: [Buildroot] [git commit] Makefile: Store OS release in
 /usr/lib/os-release
Message-ID: <20180128204558.B27D98460F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f2dc44590b824a72730f257a00a20216e40d552
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is recommended that vendor trees store OS release information
in /usr/lib/os-release and that /etc/os-release should be a relative
symlink to /usr/lib/os-release.

For more details, see:

http://0pointer.de/public/systemd-man/os-release.html

[Peter: don't hide command, simplify ln invocation]
Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 7d8ab51..1825d0a 100644
--- a/Makefile
+++ b/Makefile
@@ -729,7 +729,8 @@ endif
 		echo "ID=buildroot"; \
 		echo "VERSION_ID=$(BR2_VERSION)"; \
 		echo "PRETTY_NAME=\"Buildroot $(BR2_VERSION)\"" \
-	) >  $(TARGET_DIR)/etc/os-release
+	) >  $(TARGET_DIR)/usr/lib/os-release
+	ln -sf ../usr/lib/os-release $(TARGET_DIR)/etc
 
 	@$(call MESSAGE,"Sanitizing RPATH in target tree")
 	$(TOPDIR)/support/scripts/fix-rpath target
