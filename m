From: Stefan Agner <stefan@agner.ch>
Date: Mon, 28 Dec 2020 17:05:32 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/docker-containerd: add AppArmor
 support
In-Reply-To: <f30d5e4272c5730b4cadbf18517bce865c231040.1609171365.git.stefan@agner.ch>
References: <f30d5e4272c5730b4cadbf18517bce865c231040.1609171365.git.stefan@agner.ch>
Message-ID: <b15860aa32427329edd95f34a0c4d6b1d44bcc26.1609171365.git.stefan@agner.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Pascal Vizeli <pvizeli@syshack.ch>

Signed-off-by: Pascal Vizeli <pvizeli@syshack.ch>
Signed-off-by: Stefan Agner <stefan@agner.ch>
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
-- 
2.29.2
