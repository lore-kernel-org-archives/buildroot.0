From: Stefan Agner <stefan@agner.ch>
Date: Mon, 28 Dec 2020 17:05:33 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/docker-engine: add AppArmor
 support
In-Reply-To: <f30d5e4272c5730b4cadbf18517bce865c231040.1609171365.git.stefan@agner.ch>
References: <f30d5e4272c5730b4cadbf18517bce865c231040.1609171365.git.stefan@agner.ch>
Message-ID: <95c66dd0282a2e8957781a496384d6e2f254317d.1609171365.git.stefan@agner.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Pascal Vizeli <pvizeli@syshack.ch>

Signed-off-by: Pascal Vizeli <pvizeli@syshack.ch>
Signed-off-by: Stefan Agner <stefan@agner.ch>
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
-- 
2.29.2
