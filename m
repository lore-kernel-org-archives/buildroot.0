From: Sonic Zhang <sonic.adi@gmail.com>
Date: Fri, 3 May 2013 18:39:35 +0800
Subject: [Buildroot] [PATCH v7 2/7] arch: Add blackfin CPU choice.
In-Reply-To: <1367577580-3518-1-git-send-email-sonic.adi@gmail.com>
References: <1367577580-3518-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <1367577580-3518-2-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

This patch adds a Target CPU configuration option and uses it to select a -m
option for gcc.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.bfin |   94 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 94 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
index 2a7ff54..ac96620 100644
--- a/arch/Config.in.bfin
+++ b/arch/Config.in.bfin
@@ -1,5 +1,99 @@
+choice
+	prompt "Target CPU"
+	depends on BR2_bfin
+	default BR2_bf609
+	help
+	  Specify target CPU
+config BR2_bf606
+	bool "bf606"
+config BR2_bf607
+	bool "bf607"
+config BR2_bf608
+	bool "bf608"
+config BR2_bf609
+	bool "bf609"
+config BR2_bf512
+	bool "bf512"
+config BR2_bf514
+	bool "bf514"
+config BR2_bf516
+	bool "bf516"
+config BR2_bf518
+	bool "bf518"
+config BR2_bf522
+	bool "bf522"
+config BR2_bf523
+	bool "bf523"
+config BR2_bf524
+	bool "bf524"
+config BR2_bf525
+	bool "bf525"
+config BR2_bf526
+	bool "bf526"
+config BR2_bf527
+	bool "bf527"
+config BR2_bf531
+	bool "bf531"
+config BR2_bf532
+	bool "bf532"
+config BR2_bf533
+	bool "bf533"
+config BR2_bf534
+	bool "bf534"
+config BR2_bf536
+	bool "bf536"
+config BR2_bf537
+	bool "bf537"
+config BR2_bf538
+	bool "bf538"
+config BR2_bf539
+	bool "bf539"
+config BR2_bf542
+	bool "bf542"
+config BR2_bf544
+	bool "bf544"
+config BR2_bf547
+	bool "bf547"
+config BR2_bf548
+	bool "bf548"
+config BR2_bf549
+	bool "bf549"
+config BR2_bf561
+	bool "bf561"
+endchoice
+
 config BR2_ARCH
 	default "bfin"
 
 config BR2_ENDIAN
         default "LITTLE"
+
+config BR2_GCC_TARGET_CPU
+	default bf606		if BR2_bf606
+	default bf607		if BR2_bf607
+	default bf608		if BR2_bf608
+	default bf609		if BR2_bf609
+	default bf512		if BR2_bf512
+	default bf514		if BR2_bf514
+	default bf516		if BR2_bf516
+	default bf518		if BR2_bf518
+	default bf522		if BR2_bf522
+	default bf523		if BR2_bf523
+	default bf524		if BR2_bf524
+	default bf525		if BR2_bf525
+	default bf526		if BR2_bf526
+	default bf527		if BR2_bf527
+	default bf531		if BR2_bf531
+	default bf532		if BR2_bf532
+	default bf533		if BR2_bf533
+	default bf534		if BR2_bf534
+	default bf536		if BR2_bf536
+	default bf537		if BR2_bf537
+	default bf538		if BR2_bf538
+	default bf539		if BR2_bf539
+	default bf542		if BR2_bf542
+	default bf544		if BR2_bf544
+	default bf547		if BR2_bf547
+	default bf548		if BR2_bf548
+	default bf549		if BR2_bf549
+	default bf561		if BR2_bf561
-- 
1.7.0.4
