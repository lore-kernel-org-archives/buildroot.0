From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 17:41:05 +0200
Subject: [Buildroot] [git commit] Makefile: toolchain-eclipse-register: add
	toolchain dependency
Message-ID: <20140420154123.B99F79C8B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d174c6f8b6e983ea13729dcee427a37369e089df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The "toolchain-eclipse-register" target needs the toolchain so add
toolchain as a dependency.
This also fix the support to top-level parallel make.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index dd47f77..c33368a 100644
--- a/Makefile
+++ b/Makefile
@@ -621,7 +621,7 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize
 		$(call MESSAGE,"Executing post-image script $(s)"); \
 		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
-toolchain-eclipse-register:
+toolchain-eclipse-register: toolchain
 	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` $(notdir $(TARGET_CROSS)) $(BR2_ARCH)
 
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
