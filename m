From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2021 20:43:06 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/tini: install
 docker-init symlink
Message-ID: <20210105194047.931CD864E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79fad79a3dc6ee35c4c1ce01f523f18f28070f37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

This removes the warning that docker can't find docker-init in PATH.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 072af885c4afedf4f131563a755c532f8ad45650)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tini/tini.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tini/tini.mk b/package/tini/tini.mk
index 157477f8df..af4a3bcb5e 100644
--- a/package/tini/tini.mk
+++ b/package/tini/tini.mk
@@ -30,6 +30,7 @@ endef
 
 define TINI_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/bin/tini $(TARGET_DIR)/usr/bin/tini
+	ln -sf tini $(TARGET_DIR)/usr/bin/docker-init
 endef
 
 # Tini's CMakeLists.txt is not suitable for Buildroot.
