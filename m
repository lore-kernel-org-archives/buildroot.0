From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Dec 2020 21:21:33 +0100
Subject: [Buildroot] [git commit] package/docker-engine: add AppArmor support
Message-ID: <20201228201521.DF0E983566@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4200e8c6dc10bcb1abf36160aa72ad04df54b6bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pascal Vizeli <pvizeli@syshack.ch>
Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-engine/docker-engine.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 8cedf307ba..7f898680b7 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -20,6 +20,11 @@ DOCKER_ENGINE_LDFLAGS = \
 DOCKER_ENGINE_TAGS = cgo exclude_graphdriver_zfs autogen
 DOCKER_ENGINE_BUILD_TARGETS = cmd/dockerd
 
+ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
+DOCKER_ENGINE_DEPENDENCIES += libapparmor
+DOCKER_ENGINE_TAGS += apparmor
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 DOCKER_ENGINE_TAGS += seccomp
 DOCKER_ENGINE_DEPENDENCIES += libseccomp
