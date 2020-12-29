From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 19:22:34 +0100
Subject: [Buildroot] [git commit] package/libfuse3: enable CONFIG_FUSE_FS in
 kernel config
Message-ID: <20201229180514.9CFB482A2F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=857992adec3148df1c5d086bb2533f4f894ba630
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
