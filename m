From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 14:10:13 +0100
Subject: [Buildroot] [git commit] fs/common: build host-xz when xz
	compression is used
Message-ID: <20150309131023.81A778079B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=26e0d500b58cb6ccfdb84426ba2f866ada3b01f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When a filesystem image is xz-compressed, the XZ variable is used to refer
to the xz compression tool, but it is not necessarily available. Add a
proper dependency to fix that.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/common.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index 1d3926f..5d07f00 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -62,6 +62,7 @@ ROOTFS_$(2)_COMPRESS_EXT = .lzo
 ROOTFS_$(2)_COMPRESS_CMD = $$(LZOP) -9 -c
 endif
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_XZ),y)
+ROOTFS_$(2)_DEPENDENCIES += host-xz
 ROOTFS_$(2)_COMPRESS_EXT = .xz
 ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
 endif
