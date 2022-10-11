Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CC8C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Oct 2022 14:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C7126101A;
	Tue, 11 Oct 2022 14:02:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C7126101A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z-ThSoJ6NYrG; Tue, 11 Oct 2022 14:02:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52DD260BF7;
	Tue, 11 Oct 2022 14:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52DD260BF7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77FC21BF9CB
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 14:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C795813EC
 for <buildroot@lists.busybox.net>; Tue, 11 Oct 2022 14:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C795813EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QrA4tfFI3cmB for <buildroot@lists.busybox.net>;
 Tue, 11 Oct 2022 14:02:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1DC98140D
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1DC98140D
 for <buildroot@busybox.net>; Tue, 11 Oct 2022 14:02:29 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id BC77844076D;
 Tue, 11 Oct 2022 17:00:30 +0300 (IDT)
To: buildroot@busybox.net
Date: Tue, 11 Oct 2022 17:02:11 +0300
Message-Id: <cf424abd562799c333def1a920e05527516141b4.1665496931.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <96728725434424ecdff6a4087126c9d665c877ec.1665496931.git.baruch@tkos.co.il>
References: <96728725434424ecdff6a4087126c9d665c877ec.1665496931.git.baruch@tkos.co.il>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1665496830;
 bh=U8gLDgcVJ8b2nAuFizhcjNYHX7sT0fg4Uj3irkd14Ro=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aWigo+ucyNlhCZSMubZv08EKDLXpFSppN6uc79eLtR3+a1oHVjArGHyUWvqQOSZCh
 H+wUoBEyWFbm/Ac907nmldO1nPB6u9r2wnMOvOvJewjo2Ly3jaEvTDXXyDJ8bK+qxY
 DlDtnebeeAazjtptGdn9D6s138JDfzNdrpS/EPG3n97p9bsnzE7djJfpBg3wRHoaK2
 b18NeOClRYG8GyLe0GIeiLlYkD3S3UNDt6oAy9fRwsgOUY2WidWZHbFJoFeMEC/nv1
 ZJYtISMSFkCFa5/iGD4LdxIX0MCJXylx5CjW5Yxh4LA7/U+Sdk0vgUiolNtRdXzPpo
 1Jq1QDbO+vO3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=aWigo+uc
Subject: [Buildroot] [PATCH 3/3] boot/mv-ddr-marvell: disable SSP
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a patch to disable SSP. The toolchain enables SSP by default when
one of BR2_SSP_ options is enabled. But ATF code for the Marvell
platform does not provide the required low level routines. This leads to
link time failure.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/3101770000
https://gitlab.com/buildroot.org/buildroot/-/jobs/3134230006

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...01-Makefile-disable-stack-protection.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 boot/mv-ddr-marvell/0001-Makefile-disable-stack-protection.patch

diff --git a/boot/mv-ddr-marvell/0001-Makefile-disable-stack-protection.patch b/boot/mv-ddr-marvell/0001-Makefile-disable-stack-protection.patch
new file mode 100644
index 000000000000..62b1000727f8
--- /dev/null
+++ b/boot/mv-ddr-marvell/0001-Makefile-disable-stack-protection.patch
@@ -0,0 +1,34 @@
+From 53e34e3bff26fcbb7cc14178fa9fc80e7a73d556 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 11 Oct 2022 16:34:44 +0300
+Subject: [PATCH] Makefile: disable stack protection
+
+The Buildroot toolchain might enable stack protection by default. That
+breaks linking because ATF does not provide the required __stack_chk
+routines.
+
+The mv-ddr-marvell Makefile provides no way to add custom CFLAGS. Patch
+Makefile to disable stack protection.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: not applicable; Buildroot specific
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index 3f0dd89a7381..feae75cc16e4 100644
+--- a/Makefile
++++ b/Makefile
+@@ -331,6 +331,7 @@ OBJ_DIR ?= $(MV_DDR_ROOT)
+ CFLAGS = -DMV_DDR_ATF -DCONFIG_DDR4
+ CFLAGS += -Wall -Werror -Os -ffreestanding -mlittle-endian -g -gdwarf-2 -nostdinc
+ CFLAGS += -march=armv8-a -fpie
++CFLAGS += -fno-stack-protector
+ 
+ # PLATFORM is set in ble/ble.mk
+ ifneq ($(findstring a80x0,$(PLATFORM)),)
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
