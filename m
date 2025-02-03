Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CE8C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 14:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CC0B60E51;
	Mon,  3 Feb 2025 14:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJsr43BCciKY; Mon,  3 Feb 2025 14:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3F0B60E79
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3F0B60E79;
	Mon,  3 Feb 2025 14:28:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A12CB12A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EE5B41042
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iaoxRSNUGr_0 for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 14:27:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA2F6400C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA2F6400C4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA2F6400C4
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:27:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 2D6C04432D;
 Mon,  3 Feb 2025 14:27:55 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Cc: Clement Ramirez <clement@clementramirez.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  3 Feb 2025 15:27:42 +0100
Message-ID: <20250203142748.1135655-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203142748.1135655-1-thomas.petazzoni@bootlin.com>
References: <20250203142748.1135655-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehvdefueefveduveejledvkedujeejtdegveeufeeileelgeehgefhtdetudeugeenucffohhmrghinhepghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgpdgsuhhshigsohigrdhnvghtpdhophgvnhifrghllhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfrddrpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegtlhgvmhgvnhhtsegtlhgvmhgvnhhtrhgrmhhirhgviidrfhhrpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiii
 ihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738592875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ZVd6mOaaSVHkOE08AyQDJJTzPTg2LqMqbJmwhjC5Yo=;
 b=fjAlbP2uy8L296wd0vI7SsByklP1Hr02HrfIJa2MQyDjDgyVsD45TfcUw9ghqU59iPPwwL
 suvSBxyZmXXanq+Wa2z9MHxNU9mfIKRJCCjgAq5npAHSA49GOpFdSTSERDJEZc55Kfd47c
 eLVjKLQTqnFH75cWnxnGAaAJhFg9e2+ABtFVCQhY8PV5YFfDVma8EYI/ZGfkR3djSfjBS1
 fXMK6WUgcxz8G1+ESQOoppDwOU59CSf7byTnESLEPCT5duld1OHG5yR1VbmKpEverGD2+h
 GRuhlbO1rLt4QlXjobIkwHo/0D6mzdVMOILvCSTfZoJ2Mk06JZOvDsq/dizwDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fjAlbP2u
Subject: [Buildroot] [PATCH 3/4] package/busybox: fix hwclock build issue on
 RISC-V 32-bit musl configs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Take a patch from meta-riscv, which was submitted upstream by Khem Raj
to fix a build issue on RISC-V 32-bit musl configurations. This issue
has been discussed with musl developers who believe this is a Busybox
issue. The patch from Khem works around the issue by making it a
runtime failure just affecting hwclock on RISC-V 32-bit musl instead
of a build failure. The correct fix is not really clear, as there
seems to be a disagreement between Busybox people and musl people on
what the C library settimeofday() function should do, and that's why
Busybox is bypassing settimeofday() on musl by making a direct system
call, except this system call doesn't exist on RISC-V 32-bit.

In the mean time, this patch fixes the long standing Gitlab CI issue:

- tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinRiscv32ilp32dMuslStable
  https://gitlab.com/buildroot.org/buildroot/-/jobs/8954291684

- tests.toolchain.test_external_bootlin.TestExternalToolchainBootlinRiscv32ilp32dMuslBleedingEdge
  https://gitlab.com/buildroot.org/buildroot/-/jobs/8954291683

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...r-SYS_settimeofday-before-calling-sy.patch | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 package/busybox/0016-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch

diff --git a/package/busybox/0016-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch b/package/busybox/0016-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch
new file mode 100644
index 0000000000..c61cbc8107
--- /dev/null
+++ b/package/busybox/0016-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch
@@ -0,0 +1,54 @@
+From a378cd9c3a022500d7feaefb4e3bb43fdd789131 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 7 Mar 2021 17:30:24 -0800
+Subject: [PATCH] hwclock: Check for SYS_settimeofday before calling syscall
+
+Some newer architectures e.g. RISCV32 have 64bit time_t from get go and
+thusly do not have gettimeofday_time64/settimeofday_time64 implemented
+therefore check for SYS_settimeofday definition before making the
+syscall. Fixes build for riscv32 and it will bail out at runtime.
+
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2021-March/088583.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream: http://lists.busybox.net/pipermail/busybox/2021-March/088583.html
+[Thomas: this issue has been discussed on the musl mailing list, and
+the musl developers' opinion is that Busybox is wrong:
+https://www.openwall.com/lists/musl/2024/03/03/2
+https://www.openwall.com/lists/musl/2024/04/07/2. The correct fix
+isn't clear, and in the mean time, the patch from Khem turns the build
+issue into a runtime error only on the problematic architecture, which
+seems like a reasonable trade-off]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ util-linux/hwclock.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/util-linux/hwclock.c b/util-linux/hwclock.c
+index 723b09589..b9faaabbc 100644
+--- a/util-linux/hwclock.c
++++ b/util-linux/hwclock.c
+@@ -131,6 +131,7 @@ static void show_clock(const char **pp_rtcname, int utc)
+ 
+ static void set_kernel_tz(const struct timezone *tz)
+ {
++	int ret = 1;
+ #if LIBC_IS_MUSL
+ 	/* musl libc does not pass tz argument to syscall
+ 	 * because "it's deprecated by POSIX, therefore it's fine
+@@ -139,9 +140,11 @@ static void set_kernel_tz(const struct timezone *tz)
+ #if !defined(SYS_settimeofday) && defined(SYS_settimeofday_time32)
+ # define SYS_settimeofday SYS_settimeofday_time32
+ #endif
+-	int ret = syscall(SYS_settimeofday, NULL, tz);
++#if defined(SYS_settimeofday)
++	ret = syscall(SYS_settimeofday, NULL, tz);
++#endif
+ #else
+-	int ret = settimeofday(NULL, tz);
++	ret = settimeofday(NULL, tz);
+ #endif
+ 	if (ret)
+ 		bb_simple_perror_msg_and_die("settimeofday");
+-- 
+2.48.1
+
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
