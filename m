Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829B2D1AD53
	for <buildroot@archiver.kernel.org>; Wed, 16 Oct 2024 12:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C11D880D52;
	Wed, 16 Oct 2024 12:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uga6yRpTcP2z; Wed, 16 Oct 2024 12:45:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 935BA80D76
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 935BA80D76;
	Wed, 16 Oct 2024 12:45:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B9F491BF2CF
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 12:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B598940291
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 12:45:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bm8Ofp0DS5Ot for <buildroot@lists.busybox.net>;
 Wed, 16 Oct 2024 12:45:44 +0000 (UTC)
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=81.169.146.160; helo=mo4-p00-ob.smtp.rzone.de;
 envelope-from=ludwig.kormann@ict42.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33C7840198
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33C7840198
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.160])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33C7840198
 for <buildroot@buildroot.org>; Wed, 16 Oct 2024 12:45:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1729082741; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=HwHauq2EJ7N1Ttj4SIKOz7xWjfV6gIck6h8itN1ZLG9odVOyM5ueX+8Js0LJXi19dy
 kaXoHkAoWkcraEyUHenOLiEJIJA/6OvQyJa0F7S7HfbNGg1FyeNp+dh++xPP+k4IBmrr
 v1a6wLnVMR3gC2OE68K1ueIRA8WSIjOPgc0DYg/rHfBfitsopRRl0mMvAvvp8phlqdGp
 XLcGQYppPvZ6ja9hsiiMa5HpgU7olh7muxclseM3qEBx9ME5j8L3vW0vcF0QaXPRldlb
 ERmoctAidqS92+q3TObvoEyZu8QU9hgfghQrXWrwsjSam4063Upq2EWL5MOqTwrtLYWw
 aZIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1729082741;
 s=strato-dkim-0002; d=strato.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:To:From:Cc:Date:From:
 Subject:Sender;
 bh=pK+PgJvWkI+jrZc/bQA6zySNWb3iF7NmwNWtdIs8Jb0=;
 b=opEGWNx/bubyRMoBjccQZl/zsGdQNQJr+0CsF+TacjQy6vl9tMhFiEHE9zY5bNTXWi
 0O/V/7LZPt1P18d+8F03Ew9e+6VG9sSmDMLH3Cv2Aor2philyCZBC0PfnXRkn7aFsw30
 s3gbxEJhehZHvfmxVf1NSCupg9qKKg+0FvDUdM8wFHoiGD81p2N3dtNWXF7peF0RJH+W
 9C2yhcy2tJvJ0ycT8BAKSs7fxAV8OyAvO4RhqKqNjAGCCHRqPEwCDK6m7Kolwu3o/4Zu
 kehwpdLMar2oTq++A2MmiasBa5urJv0vJieOCq8H/Lb6Sabhq0RUgxeGjZRAdXGHF8pH
 Y/2Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":IHkAYkmvNfSwjg/qSc4u8zZOVaURsoXe3UH2mQA0KgllCYtN8WqJZ5aMuoQuCdrfzui0vA=="
Received: from debian-test.local.in-circuit.de
 by smtp.strato.de (RZmta 51.2.11 DYNA|AUTH)
 with ESMTPSA id ja045c09GCjf7fV
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <buildroot@buildroot.org>;
 Wed, 16 Oct 2024 14:45:41 +0200 (CEST)
From: Ludwig Kormann <ludwig.kormann@ict42.de>
To: buildroot@buildroot.org
Date: Wed, 16 Oct 2024 14:45:37 +0200
Message-Id: <20241016124537.2645119-3-ludwig.kormann@ict42.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241016124537.2645119-1-ludwig.kormann@ict42.de>
References: <20241016124537.2645119-1-ludwig.kormann@ict42.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1729082741; 
 s=strato-dkim-0002; d=ict42.de;
 h=References:In-Reply-To:Message-Id:Date:Subject:To:From:Cc:Date:From:
 Subject:Sender;
 bh=pK+PgJvWkI+jrZc/bQA6zySNWb3iF7NmwNWtdIs8Jb0=;
 b=o5o5ny521WMym4IYh9g+8zkIL4wWQHJWt4LGZ8lZOzOFcH8WOoOViNxQHb0wmC2GBH
 yT2jXh/X/CF1qVafNvbHr0oGqg64f68shw4eayGy1dwOSJ36sZNTnyCi+G6ZMw5jNxpj
 DzPRgqBo3/lbQB71TFuvJqw073gDsb7XSCoU3Ta1HKIhRy4e/dA3ooSDGtAEEBLdTpW+
 JM4suOZdU1d2ZshumgIDTCqQ+NVvhuM1vrKwMcn2Dr2uFvN6HQePBWqoMrXgbQFArIAW
 2yh21lhmZqyJPPKKvDsdBKprDqUosQSOx4mdSZbp/qsHhKezoJA3H4Box/MNEkMrZLqL
 w8Hw==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1729082741; 
 s=strato-dkim-0003; d=ict42.de;
 h=References:In-Reply-To:Message-Id:Date:Subject:To:From:Cc:Date:From:
 Subject:Sender;
 bh=pK+PgJvWkI+jrZc/bQA6zySNWb3iF7NmwNWtdIs8Jb0=;
 b=ebb3nvU1f17+tQv2pYaqSSiTV+isfo0bXSz6Vzi5Tp4sPNrGnCLMbDe0pwcAIO0rzB
 NxkBcuweFaWtcXmSKkCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=ict42.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=ict42.de header.i=@ict42.de
 header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=o5o5ny52; 
 dkim=pass header.d=ict42.de header.i=@ict42.de header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=ebb3nvU1
Subject: [Buildroot] [PATCH v2 3/3] configs/icnova-a20-adb4006: add uboot
 patch for reliable bootclk
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Up until now cpu clock gets initialized at 384 MHz, which is
the highest supported cpu clock.

Recent A20 batches show an increased percentage of modules
reacting very sensitive to operating conditions outside the
specifications.

The cpu dies very shortly after PLLs, core frequency or cpu
voltage are missconfigured. E.g.:
- uboot SPL selects 384 MHz as cpu clock which requires a cpu
  voltage of at least 1.1 V.
- Linux CPU Frequency scaling with most sun7i dts will reduce
  cpu voltage down to 1.0 V.
- When intiating a reboot or reset from linux the cpu voltage
  may keep the 1.0 V configuration and the cpu dies during SPL
  initialization.

Therefore reduce cpu clock at uboot SPL initialization down
to 144 MHz from 384 MHz.

Use patch until KConfig option in uboot becomes available.

Signed-off-by: Ludwig Kormann <ludwig.kormann@ict42.de>
---
 ...ce-cpu-clock-at-SPL-initialization-t.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 board/in-circuit/icnova-a20-adb4006/patches/uboot/0001-sunxi-sun4i-Reduce-cpu-clock-at-SPL-initialization-t.patch

diff --git a/board/in-circuit/icnova-a20-adb4006/patches/uboot/0001-sunxi-sun4i-Reduce-cpu-clock-at-SPL-initialization-t.patch b/board/in-circuit/icnova-a20-adb4006/patches/uboot/0001-sunxi-sun4i-Reduce-cpu-clock-at-SPL-initialization-t.patch
new file mode 100644
index 0000000000..edaa47ac4e
--- /dev/null
+++ b/board/in-circuit/icnova-a20-adb4006/patches/uboot/0001-sunxi-sun4i-Reduce-cpu-clock-at-SPL-initialization-t.patch
@@ -0,0 +1,48 @@
+From 3cdf8aa3ff45e35a237285c107785bc3d2c6976a Mon Sep 17 00:00:00 2001
+From: Ludwig Kormann <ludwig.kormann@ict42.de>
+Date: Wed, 31 Jan 2024 11:28:19 +0100
+Subject: [PATCH] sunxi: sun4i: Reduce cpu clock at SPL initialization to 144
+ MHz
+
+Up until now cpu clock gets initialized at 384 MHz, which is
+the highest supported cpu clock.
+
+Recent A20 batches show an increased percentage of modules
+reacting very sensitive to operating conditions outside the
+specifications.
+
+The cpu dies very shortly after PLLs, core frequency or cpu
+voltage are missconfigured. E.g.:
+- uboot SPL selects 384 MHz as cpu clock which requires a cpu
+  voltage of at least 1.1 V.
+- Linux CPU Frequency scaling with most sun7i dts will reduce
+  cpu voltage down to 1.0 V.
+- When intiating a reboot or reset from linux the cpu voltage
+  may keep the 1.0 V configuration and the cpu dies during SPL
+  initialization.
+
+Therefore reduce cpu clock at uboot SPL initialization down
+to 144 MHz from 384 MHz.
+
+Signed-off-by: Ludwig Kormann <ludwig.kormann@ict42.de>
+Upstream: Not Applicable
+---
+ arch/arm/include/asm/arch-sunxi/clock_sun4i.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun4i.h b/arch/arm/include/asm/arch-sunxi/clock_sun4i.h
+index 2cec91cb20..252c4c693e 100644
+--- a/arch/arm/include/asm/arch-sunxi/clock_sun4i.h
++++ b/arch/arm/include/asm/arch-sunxi/clock_sun4i.h
+@@ -141,7 +141,7 @@ struct sunxi_ccm_reg {
+ #define CCM_PLL1_CFG_SIG_DELT_PAT_EN_SHIFT	2
+ #define CCM_PLL1_CFG_FACTOR_M_SHIFT		0
+ 
+-#define PLL1_CFG_DEFAULT	0xa1005000
++#define PLL1_CFG_DEFAULT	0xa1004c01
+ 
+ #if defined CONFIG_OLD_SUNXI_KERNEL_COMPAT && defined CONFIG_MACH_SUN5I
+ /*
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
