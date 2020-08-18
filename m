From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Aug 2020 17:23:19 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] support/testing: drop
 explicit CGROUPFS_MOUNT from docker test
Message-ID: <20200818153629.0751581628@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb10c49b5fbfd72e4f1abaf403f81dc7979bff54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Since commit 4f8229653 (package/docker-engine: needs more runtime
dependencies), docker-engine now automatically pulls in cgroupfs-mount, so
drop the explicit handling of it in TestDockerCompose.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4726cf9517e35eaa9d08a3a4e9a5ac9cbb4da9e4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_docker_compose.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/testing/tests/package/test_docker_compose.py b/support/testing/tests/package/test_docker_compose.py
index f12e2a6a3d..67ee795f21 100644
--- a/support/testing/tests/package/test_docker_compose.py
+++ b/support/testing/tests/package/test_docker_compose.py
@@ -20,7 +20,6 @@ class TestDockerCompose(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="{}"
         BR2_PACKAGE_CA_CERTIFICATES=y
-        BR2_PACKAGE_CGROUPFS_MOUNT=y
         BR2_PACKAGE_DOCKER_CLI=y
         BR2_PACKAGE_DOCKER_COMPOSE=y
         BR2_PACKAGE_DOCKER_ENGINE=y
