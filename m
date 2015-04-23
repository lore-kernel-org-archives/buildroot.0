From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Apr 2015 22:59:43 +0200
Subject: [Buildroot] [git commit] host-cmake: Install with install/fast
	target
Message-ID: <20150423205949.198268191E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b67596023ff92be833cbd82010f37d59cc64aa9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use install/fast target in order to skip compilation in installation
step. The same trick has just been used in pkg-cmake.mk for all CMake
packages.

Signed-off-by: C??dric Marie <cedric.marie@openmailbox.org>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cmake/cmake.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 6b9e563..9ca6443 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -44,7 +44,7 @@ define HOST_CMAKE_BUILD_CMDS
 endef
 
 define HOST_CMAKE_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install/fast
 endef
 
 define CMAKE_REMOVE_EXTRA_DATA
