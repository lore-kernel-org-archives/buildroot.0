From: Sam Lancia <sam@gpsm.co.uk>
Date: Thu, 7 Jun 2018 08:51:07 +0100
Subject: [Buildroot] [PATCH 1/1] docker-containerd: add missing binary
 symlink
Message-ID: <CAGDkrv6D9avg7ps9j3PfBEwYNL-vNTQe2v-782A8u30Y6zB_fw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In 2dccb4f2fefd8a0dbda65dd0f7537f811e920b13,
"/usr/bin/docker-containerd" was removed without replacing it with a
symlink

https://bugs.busybox.net/show_bug.cgi?id=11076

Signed-off-by: Sam Lancia <sam@gpsm.co.uk>
---
 package/docker-containerd/docker-containerd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/docker-containerd/docker-containerd.mk
b/package/docker-containerd/docker-containerd.mk
index 88e27b5ed4..09e89f1aba 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -21,6 +21,7 @@ DOCKER_CONTAINERD_INSTALL_BINS = containerd containerd-shim
 define DOCKER_CONTAINERD_INSTALL_SYMLINKS
  ln -fs runc $(TARGET_DIR)/usr/bin/docker-runc
  ln -fs containerd-shim $(TARGET_DIR)/usr/bin/docker-containerd-shim
+ ln -fs containerd $(TARGET_DIR)/usr/bin/docker-containerd
 endef

 DOCKER_CONTAINERD_POST_INSTALL_TARGET_HOOKS +=
DOCKER_CONTAINERD_INSTALL_SYMLINKS
-- 
2.14.1
