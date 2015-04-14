From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Apr 2015 10:17:04 +0200
Subject: [Buildroot] [git commit] fs: add rootfs dependencies to PACKAGES
Message-ID: <20150414081954.EF1607F9E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4570dbcb14b394d8f3c97baf4c9e5f4f225d1d37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The logic for creating most of the filesystem images requires a
certain number of host packages to be built. However, those packages
are not currently listed in the global PACKAGES variables, and they
are not dependencies of any other package listed in the PACKAGES
variable.

While it does not have any practical implications, it makes sense to
have those packages listed in the global PACKAGES variable, which this
commit implements.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 fs/common.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index cac127f..41ee86d 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -106,6 +106,7 @@ rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1) $$(ROOTFS_$(2)_POST_TARGETS)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
 TARGETS_ROOTFS += rootfs-$(1)
+PACKAGES += $$(ROOTFS_$(2)_DEPENDENCIES)
 endif
 endef
 
