From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 May 2010 16:11:20 +0200
Subject: [Buildroot] [git commit master] squashfs: fix build when zlib isn't
	available on the host
Message-ID: <20100508141445.C18FA8F5E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d5a1757565c0c5539e2728c23d9cb955fba02615
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pass CFLAGS and LDFLAGS so that when building squashfs, it finds the
zlib installed in $(HOST_DIR).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squashfs/squashfs.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index ab05b06..1dccb08 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -18,7 +18,7 @@ define SQUASHFS_INSTALL_TARGET_CMDS
 endef
 
 define HOST_SQUASHFS_BUILD_CMDS
- $(HOST_MAKE_ENV) $(MAKE) -C $(@D)/squashfs-tools/
+ $(HOST_MAKE_ENV) $(MAKE) CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)" -C $(@D)/squashfs-tools/
 endef
 
 define HOST_SQUASHFS_INSTALL_CMDS
-- 
1.6.3.3
