From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue,  5 May 2015 18:42:12 +0300
Subject: [Buildroot] [PATCH] arch/Config.in.xtensa: provide BR2_ENDIAN symbol
Message-ID: <1430840532-2115-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 arch/Config.in.xtensa | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index ff71e0b..62d02c5 100644
--- a/arch/Config.in.xtensa
+++ b/arch/Config.in.xtensa
@@ -33,6 +33,20 @@ config BR2_XTENSA_OVERLAY_DIR
 	  configurations. They are provided by the processor vendor or
 	  directly from Tensilica.
 
+choice
+	prompt "Target Architecture Endianness"
+	depends on BR2_XTENSA_CUSTOM
+	default BR2_XTENSA_LITTLE_ENDIAN
+config BR2_XTENSA_LITTLE_ENDIAN
+	bool "Little endian"
+config BR2_XTENSA_BIG_ENDIAN
+	bool "Big endian"
+endchoice
+
+config BR2_ENDIAN
+	default "LITTLE"	if BR2_XTENSA_LITTLE_ENDIAN
+	default "BIG"		if BR2_xtensa_fsf || BR2_XTENSA_BIG_ENDIAN
+
 config BR2_ARCH
 	default "xtensa"	if BR2_xtensa
 
-- 
1.8.1.4
