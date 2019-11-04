From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 21:42:01 +0100
Subject: [Buildroot] [git commit] package/sudo: remove dist example config
Message-ID: <20191104203508.46A7B8E604@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a73470ab1db8f5ecaedbfde0865b7a900dc0d7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Stephan Henningsen <stephan+buildroot@asklandd.dk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sudo/sudo.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index cf8b63b1db..ab58f308ec 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -64,4 +64,10 @@ define SUDO_PERMISSIONS
 	/usr/bin/sudo f 4755 0 0 - - - - -
 endef
 
+define SUDO_REMOVE_DIST_EXAMPLES
+	$(RM) $(TARGET_DIR)/etc/sudoers.dist
+	rmdir $(TARGET_DIR)/etc/sudoers.d
+endef
+SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_REMOVE_DIST_EXAMPLES
+
 $(eval $(autotools-package))
