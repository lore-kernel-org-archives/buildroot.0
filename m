Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B43C678DC
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 23:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77C1360FCB;
	Thu, 17 Aug 2023 23:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77C1360FCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7upshszOreUe; Thu, 17 Aug 2023 23:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C73D160EFF;
	Thu, 17 Aug 2023 23:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C73D160EFF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55F871BF476
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 23:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CF0D40111
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 23:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CF0D40111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6f2o03BKaUs9 for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 23:08:53 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF06740576
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 23:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF06740576
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3fea0640d7aso3742585e9.0
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 16:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692313731; x=1692918531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RXp7KP+IuRiL9/r5pejSmhKjAk67Uvji4n5mgqZvPCw=;
 b=TSsU8o/+iak6ZlgftmJ/txLtfoxFpIFeZy4owYMF+HdSRDTWEra2HqpggyzB89yQ8y
 ivokpKOYompgXZ9cDdyAH99cvejKTnCpyf8s5YfmYfbleuRysdp3jvLLvk5DRhV8bcGk
 8XQqs6ck57qJCkgRJNt0kT/B6VKI+CXrhUrylP4XSWVDVPNJLsiCHkCOkGCQ0OlXWoMQ
 VHWoV3uSQ3UfgMwOTauGTDC3nmiqydb1YQFbtrYGczSJ96V8nILVecPoCxv4XNadenE2
 O7uidLUEPMsEkaXpx/BnCCdZs7HERMPTqFVkZo09OES40l7agFOalnFxdQ6ZsGlQgLN6
 Fjtw==
X-Gm-Message-State: AOJu0Yx0hGN5kEM4mxdHuqUdi9E3fqB04nxN/UZlFutGfeeKGavyV0rE
 xMDBizUny7qFZO7cdZOjjn3o5WxbaWU=
X-Google-Smtp-Source: AGHT+IEMCfedjQ6Y7j37LeTIiD8ilQ5Saz3IuTcGCI9GeAUx6X96CgHpwMSesLKfA1p7v1SLZE9obw==
X-Received: by 2002:a05:600c:1c9b:b0:3fd:e86b:f095 with SMTP id
 k27-20020a05600c1c9b00b003fde86bf095mr823182wms.13.1692313731045; 
 Thu, 17 Aug 2023 16:08:51 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 26-20020a05600c021a00b003fa95f328afsm4409479wmi.29.2023.08.17.16.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 16:08:50 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 18 Aug 2023 01:08:43 +0200
Message-ID: <20230817230844.450092-3-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817230844.450092-1-romain.naour@gmail.com>
References: <20230817230844.450092-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692313731; x=1692918531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RXp7KP+IuRiL9/r5pejSmhKjAk67Uvji4n5mgqZvPCw=;
 b=jb8zaV+e56TzaZT55JEMBgOeDQUDPnwXCjw+ye2t25Md5V5fp3wkgf37GVYuFe+KGZ
 gJqGnuXfFXkzx18/DBuzFTkYlW2l4iA3TFyUEWAVbX3I2ZOfJQjlU20vRg8p3LA5m/jx
 UxvclfeGGQaiOnnq7M0CYHSEGGC7xdHBUZ88rDVTTQXnwA4znts0DRQRyi9b8yyv7HCr
 GFdrpsGq5um63bWz7FPMgrHsR16EBx6ayC8aDc8j6bdtFqeVG6ObqL5HYvDqFqqqdpCv
 SHFXNLTgtLEF5t2G3+vpMSxrNeABNYhyla/vXcSOQ2rUlpusH5QQPWupyuYFoehCNBKV
 CczQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=jb8zaV+e
Subject: [Buildroot] [PATCH 3/4] configs/ci20_defconfig: bump to kernel
 5.4.254
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump the kernel to the latest release of 5.4 kernel series
to fix an issue with gcc 12.

arch/mips/jz4740/setup.c: In function 'plat_mem_setup':
arch/mips/jz4740/setup.c:64:25: error: comparison between two arrays [-Werror=array-compare]
   64 |         if (__dtb_start != __dtb_end)
      |                         ^~
arch/mips/jz4740/setup.c:64:25: note: use '&__dtb_start[0] != &__dtb_end[0]' to compare the addresses
  CC      fs/debugfs/file.o
cc1: all warnings being treated as errors

Fixed in v5.4.195:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a60def7568216684f62b117c199429c4a9a89570

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436573

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 configs/ci20_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
index 09eddc4e68..7e119376e1 100644
--- a/configs/ci20_defconfig
+++ b/configs/ci20_defconfig
@@ -15,7 +15,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ci20/genimage.cfg"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.58"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.254"
 BR2_LINUX_KERNEL_DEFCONFIG="ci20"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
