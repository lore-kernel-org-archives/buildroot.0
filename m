From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jun 2018 15:47:53 +0200
Subject: [Buildroot] [git commit] docker-containerd: add missing
 docker-containerd symlink
Message-ID: <20180607134724.9181086D41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ded50f69c691e4b4a391ee23ec466abaad4bed99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Prior to commit 2dccb4f2fefd8a0dbda65dd0f7537f811e920b13
("package/docker-containerd: convert to golang infrastructure"), the
containerd binary was installed as docker-containerd. Following the
conversion to the golang package infrastructure, the binary is now
installed as "containerd", which breaks some use cases.

Let's add a symlink link docker-containerd -> containerd to fix such
use cases.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=11076

Signed-off-by: Sam Lancia <sam@gpsm.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-containerd/docker-containerd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 88e27b5ed4..09e89f1aba 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -21,6 +21,7 @@ DOCKER_CONTAINERD_INSTALL_BINS = containerd containerd-shim
 define DOCKER_CONTAINERD_INSTALL_SYMLINKS
 	ln -fs runc $(TARGET_DIR)/usr/bin/docker-runc
 	ln -fs containerd-shim $(TARGET_DIR)/usr/bin/docker-containerd-shim
+	ln -fs containerd $(TARGET_DIR)/usr/bin/docker-containerd
 endef
 
 DOCKER_CONTAINERD_POST_INSTALL_TARGET_HOOKS += DOCKER_CONTAINERD_INSTALL_SYMLINKS
