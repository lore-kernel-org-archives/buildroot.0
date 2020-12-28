From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Dec 2020 21:21:32 +0100
Subject: [Buildroot] [git commit] package/docker-containerd: add AppArmor
 support
Message-ID: <20201228201521.D8E2680469@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=924c1f93d4fe41d7ac332032b67b2d9d5d44e533
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pascal Vizeli <pvizeli@syshack.ch>
Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-containerd/docker-containerd.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index d9a0eb28a6..c68e3818a8 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -18,6 +18,11 @@ DOCKER_CONTAINERD_BUILD_TARGETS = cmd/ctr cmd/containerd cmd/containerd-shim
 
 DOCKER_CONTAINERD_INSTALL_BINS = containerd containerd-shim
 
+ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
+DOCKER_CONTAINERD_DEPENDENCIES += libapparmor
+DOCKER_CONTAINERD_TAGS += apparmor
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 DOCKER_CONTAINERD_DEPENDENCIES += libseccomp host-pkgconf
 DOCKER_CONTAINERD_TAGS += seccomp
