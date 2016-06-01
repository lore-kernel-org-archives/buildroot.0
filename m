From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 16:53:25 +0200
Subject: [Buildroot] [git commit branch/next] uboot-tools: use
	$(TARGET_STRIP) for target utilities
Message-ID: <20160601150556.3CC5981979@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fcbb93180595d41be91433902063a73ad82b56e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Otherwise BR2_STRIP_xxxx setup is ignored and they are always stripped.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uboot-tools/uboot-tools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 987e89b..a6aadeb 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -21,6 +21,7 @@ define UBOOT_TOOLS_BUILD_CMDS
 		CROSS_COMPILE="$(TARGET_CROSS)"	\
 		CFLAGS="$(TARGET_CFLAGS)"	\
 		LDFLAGS="$(TARGET_LDFLAGS)"	\
+		STRIP=$(TARGET_STRIP)		\
 		CROSS_BUILD_TOOLS=y		\
 		CONFIG_FIT_SIGNATURE=$(BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT) \
 		tools-only
@@ -28,6 +29,7 @@ define UBOOT_TOOLS_BUILD_CMDS
 		CROSS_COMPILE="$(TARGET_CROSS)"	\
 		CFLAGS="$(TARGET_CFLAGS)"	\
 		LDFLAGS="$(TARGET_LDFLAGS)"	\
+		STRIP=$(TARGET_STRIP)		\
 		env no-dot-config-targets=env
 endef
 
