From: Vincent Stehle <vincent.stehle@laposte.net>
Date: Sat,  4 Apr 2015 20:17:08 +0200
Subject: [Buildroot] [PATCH] freescale_imx28evk_defconfig: select headers
	3.19
In-Reply-To: <1427030715-1737-3-git-send-email-arnout@mind.be>
References: <1427030715-1737-3-git-send-email-arnout@mind.be>
Message-ID: <1428171428-13438-1-git-send-email-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vincent Stehl? <vincent.stehle@laposte.net>

We use a manually specified custom version 3.19.2 of the linux kernel
for i.MX28, but linux-headers defaults to a 2.6.x family.

Select custom headers family 3.19.x explicitely, to repair linux-headers
"build".

Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/freescale_imx28evk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/freescale_imx28evk_defconfig b/configs/freescale_imx28evk_defconfig
index 7125cec..9ce5217 100644
--- a/configs/freescale_imx28evk_defconfig
+++ b/configs/freescale_imx28evk_defconfig
@@ -5,6 +5,7 @@ BR2_arm926t=y
 # toolchain
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.19.2"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
-- 
2.1.4
