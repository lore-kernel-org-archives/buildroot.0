Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8879EB64D8
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 21:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA1A041EB7;
	Wed, 14 Jun 2023 21:09:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA1A041EB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ydt0jb7zIpCU; Wed, 14 Jun 2023 21:09:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B61EF41EAA;
	Wed, 14 Jun 2023 21:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B61EF41EAA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F37C01BF2A1
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 21:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6F3583B77
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 21:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6F3583B77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PsZa_pxQ8Miq for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 21:09:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46B8083B40
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46B8083B40
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 21:09:31 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-311148ea881so74330f8f.3
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 14:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686776969; x=1689368969;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UqJGgGFd/7BZCHIa/5z7IWTTWPmkP9Pfqg+8UDoP9WI=;
 b=RdxpcVsFGoaJjUoeX6JYbAbS29dTX2jf98GQMyNh782Q6vrFYxxmWDkug+c4nwdZT7
 hYBe/fjgje7YK5FLaAGpx0y8S7E5/xYWhETBkQek7f6rCNv5gpRDmWgk4rd3cAwalKk9
 Dn4YzIsxynSF9TsjreHrMlw++HdMK4xiBV6a2HvBAdGh/9u2mOKeS65RI5LFA70LYZUM
 mw6dB4mjjKApPZ6n5uSRIghTzi9NdNrc1rvmA7K0x5aAVEirH5bfeNymMBFB/2W4Ebwx
 3LW3waHuYkEoqIrLyM1Wh2JQU7BO/lHX5JMHbkBfL+N7OtzVgDG7OAUI81Q/LXUgLCip
 7toA==
X-Gm-Message-State: AC+VfDxRahasWqwvjHdhd3GCi1YjWevhym5aC3ZvJkRQTGQx2AEMpat4
 fITMy0F8g7rgAUSQukeJ1mTV4jZcwpg+OrYVOfU=
X-Google-Smtp-Source: ACHHUZ42GZlj0XUSMcesE3hBWPKa9fkRfBBNNrZ2Vb/C0ALm00US18IeUt2KgnQ1QBiC2rkBycHPJg==
X-Received: by 2002:a5d:678e:0:b0:30f:c2a3:627c with SMTP id
 v14-20020a5d678e000000b0030fc2a3627cmr6426925wru.68.1686776969166; 
 Wed, 14 Jun 2023 14:09:29 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a7bc40f000000b003f7f1b3aff1sm18480245wmi.26.2023.06.14.14.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 14:09:28 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 23:09:26 +0200
Message-Id: <20230614210926.7723-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1686776969; x=1689368969;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UqJGgGFd/7BZCHIa/5z7IWTTWPmkP9Pfqg+8UDoP9WI=;
 b=LYJv7tZhoINq5Ca683KhRQeyDsJL9hD8B98AxmGyUdUOA8K0xafN2EQXG7jJpzt1Rw
 kHBTO2L9YtSjq/RtYFvsHe6inmPA509eAKNoyY4LhgM+6uvgLssjfj18eZRt8aMRdk/q
 LI/vMli1g8oGBGrLuUWg0ctiJC4rZc5PirfMaHCx7kYKLl1do14r70XD3aGhrJct+B2j
 G0TIAy1QsF3z4L+uwhQ/xZTI50eTN/wCZvwpXpIoaSqy5YOrVIv66Ljhaxn1eOOOm2LT
 7cuKtqnbdMswgAlVCrMHXhRRzno+ZHbl6BI3lSBBzONQqLfzM8DoOpy5tHV+2cfxIArf
 4UVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=LYJv7tZh
Subject: [Buildroot] [PATCH] package/qemu: bump to version 8.0.2
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2023-0330:
A vulnerability in the lsi53c895a device affects the latest version of
qemu. A DMA-MMIO reentrancy problem may lead to memory corruption bugs
like stack overflow or use-after-free.

See:
https://lists.gnu.org/archive/html/qemu-devel/2023-06/msg00221.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/qemu/qemu.hash | 2 +-
 package/qemu/qemu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index e76aef0b3a..b6fcad83e2 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  bb60f0341531181d6cc3969dd19a013d0427a87f918193970d9adb91131e56d0  qemu-8.0.0.tar.xz
+sha256  f060abd435fbe6794125e2c398568ffc3cfa540042596907a8b18edca34cf6a5  qemu-8.0.2.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 6a6905d75f..c530896fa8 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 8.0.0
+QEMU_VERSION = 8.0.2
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
