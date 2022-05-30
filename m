Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AAFC433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 15:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B290840A90;
	Mon, 30 May 2022 15:16:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LP5bb-D7SX4W; Mon, 30 May 2022 15:16:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0D8140A88;
	Mon, 30 May 2022 15:16:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16D141BF2E5
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 15:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05D4283F01
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 15:16:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z14Zm5TfNHGF for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 15:16:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5907E83F02
 for <buildroot@buildroot.org>; Mon, 30 May 2022 15:16:25 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id q21so3883837wra.2
 for <buildroot@buildroot.org>; Mon, 30 May 2022 08:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gFS1cXOm10niIZ31yf25dLe7xDn/3laeU3B9MO+j4r0=;
 b=IKGxfHMmVIg4UphV0bIuKUjsDpBBJqJEGVN/hKVMEYdo6Y/Pk/6VAGr4Yl1HQRq6EU
 dqaWVZbVCrr4SWVYPRT0hVpsV26fVWfNGxnP5+s3j7gIonD/ryq2Yy3ujjbCQwMoOvVj
 y0Z0H0byGnngoWBsp3IDCoUQZrzGctd6C7DSwPwxyCaeQY5KV0xHlt7VoKxmBCaeK8Tr
 Wkd36ojTQvj03OHQXttDFBvwh+2ryt5RxHzIk8cF4vOrl1AcSdg2HCMfMlDw1fewIPw7
 OcxKodTWQif7tkCAmY9DS7pGW0C8pTXx6Uwq5v5kyOakGAGDKl0x17+ehhzxYPYk3IDO
 k/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gFS1cXOm10niIZ31yf25dLe7xDn/3laeU3B9MO+j4r0=;
 b=pZD8qwSg9xobQXNdazug4wMMcNGCCY5ugf4u+E0OAmRmRXUfb1vKpRWisjs6j+TmkI
 MT/7wLTNmfqkahtKtzde6h47JZktOgiSPSwFUKtFkf2oW5weJfsexvbHoapPX6u4s0U3
 R3fC26ZND3cXftv0QAEgX/voPKrspUCi0f1YY78pmRu58ssO9TiztxqApCsyKlRt7ELb
 iAzvhH9TEZ5L7nEyplYnMAdp/nPIXvKGZlZRbFyPH2nLaRT98ykiLoigsRVOjJ4ZshhI
 cvgPdyRxj1OjBmVhKfAxpM4z535yNCDC8cRqjpZ+pcY+3c+8rTl5P+23Fkz3zIv1hZvG
 fsIw==
X-Gm-Message-State: AOAM533CYr8Z3fXl6MNhuD/9gzp2ifF0dnL40k2AAmqDQ9t8DHv0Yo2/
 oZxsg+RSu5geXGkeAduYPxzjfv2r8iI=
X-Google-Smtp-Source: ABdhPJx+CMFtgQgR6J/FW0Jcgvrhe8P3qsrd09btzpaMkLVcjIVCuiRCpqI91yuwmDpkdWIxEVPx/Q==
X-Received: by 2002:adf:eb46:0:b0:210:997:42c with SMTP id
 u6-20020adfeb46000000b002100997042cmr18135137wrn.555.1653923783116; 
 Mon, 30 May 2022 08:16:23 -0700 (PDT)
Received: from thomas-Latitude-5590.barco.com
 ([2a02:a03f:eb68:2f00:90f2:9cb1:bc9e:9841])
 by smtp.googlemail.com with ESMTPSA id
 l7-20020a5d4bc7000000b0020c5253d8edsm9247486wrt.57.2022.05.30.08.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 08:16:22 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 17:16:12 +0200
Message-Id: <20220530151612.3072914-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qemu: add qemu host tools
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@gmail.com>

Allow host tools e.g. qemu-img to be built.
Similar to the BR2_PACKAGE_QEMU_TOOLS option.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
---
 package/qemu/Config.in.host | 6 ++++++
 package/qemu/qemu.mk        | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index f9cdb9b703..2aa6991263 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -102,4 +102,10 @@ config BR2_PACKAGE_HOST_QEMU_USB
 	help
 	  Enables USB passthrough support from guest to host.
 
+config BR2_PACKAGE_HOST_QEMU_TOOLS
+	bool "Enable tools"
+	help
+	  Say 'y' here to include tools packaged with QEMU
+	  (e.g. qemu-img).
+
 endif
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 1bcffc2340..9623068c93 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -348,6 +348,12 @@ else
 HOST_QEMU_OPTS += --disable-libusb
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_QEMU_TOOLS),y)
+HOST_QEMU_OPTS += --enable-tools
+else
+HOST_QEMU_OPTS += --disable-tools
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define HOST_QEMU_CONFIGURE_CMDS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
