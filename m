From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 21:17:02 +0200
Subject: [Buildroot] [git commit] confifs/freescale_imx28evk_defconfig:
	select headers 3.19
Message-ID: <20150404191727.7F8F381817@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4384ec9c5df602a16837a392d17bee9bfb5835dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We use a manually specified custom version 3.19.2 of the linux kernel
for i.MX28, but linux-headers defaults to a 2.6.x family.

Select custom headers family 3.19.x explicitely, to repair
linux-headers "build".

Signed-off-by: Vincent Stehl?? <vincent.stehle@laposte.net>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/freescale_imx28evk_defconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
