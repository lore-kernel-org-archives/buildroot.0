From: Tian Yuanhao <tianyuanhao@aliyun.com>
Date: Wed, 23 Dec 2020 10:16:27 +0800
Subject: [Buildroot] [PATCH 1/1] package/libfuse3: enable CONFIG_FUSE_FS in
 kernel config
Message-ID: <20201223021627.1820551-1-tianyuanhao@aliyun.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
---
 package/libfuse3/libfuse3.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index f6d8dd0ab9..0a896d8dad 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -23,4 +23,8 @@ define LIBFUSE3_PERMISSIONS
 	/usr/bin/fusermount3 f 4755 0 0 - - - - -
 endef
 
+define LIBFUSE3_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FUSE_FS)
+endef
+
 $(eval $(meson-package))
-- 
2.25.1
