From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed,  1 Jun 2016 11:39:39 -0300
Subject: [Buildroot] [PATCH next 1/4] uboot-tools: use $(TARGET_STRIP) for
	target utilities
In-Reply-To: <1464791982-10166-1-git-send-email-casantos@datacom.ind.br>
References: <1462736800-9552-1-git-send-email-casantos@datacom.ind.br>
 <1464791982-10166-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <1464791982-10166-2-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise BR2_STRIP_xxxx setup is ignored and they are always stripped.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
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
 
-- 
2.7.4
