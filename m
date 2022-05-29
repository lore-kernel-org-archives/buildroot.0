Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FDEC433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 13:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BD5040A30;
	Sun, 29 May 2022 13:18:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kgeYLH6t7qgf; Sun, 29 May 2022 13:18:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF0BD40477;
	Sun, 29 May 2022 13:18:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 551471BF4D8
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 13:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 430F760F08
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 13:18:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zfEaHpPvxB_l for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 13:18:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57F066108E
 for <buildroot@buildroot.org>; Sun, 29 May 2022 13:18:22 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q7so510546wrg.5
 for <buildroot@buildroot.org>; Sun, 29 May 2022 06:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bC2i2C+0ruExSB2CukIjrqCBgHssykf45mu+CF2ZS+8=;
 b=o4ev14BpSLJsAiAr01qpVRoTuK5NFmbSx2lwdZYSvoLycaaBZiOK0iMS3yy70WrvHL
 8jBrbT2PZhsG2DvCuIUVQbD8eik9S61mX77A/01KIqIk8U6kAlKrQDRwYDZp0Uf3dnMH
 R24jtE+7OnuLbUrix0KOmsgJ3fo4s630r3AvMPVClD00tBIn25ZIu9E/ttBDJaqm0AqQ
 ODfhYw4XydKkCkuWoI6cE+2K9rpWvroirS2PgZ41zruz+dZd24EKKa3UvRTg6JZXfuug
 vV0sQLORmBeAjAdDwoM+dud1/QCQuLZI4zotuEfgp2I94AlqHy+uMD9137OBXUCwKgMP
 vyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bC2i2C+0ruExSB2CukIjrqCBgHssykf45mu+CF2ZS+8=;
 b=boUYK9OVFtY0yVqqdit24DGk2iAvI4wcb3ZewXXivJiXnQMkFdlyRtT2gS+4W7c28I
 D9BFWLPds0h5vMn/10iDqbXlW0MfONdxy2ikdbYm+++qqK9A3TYhKde7vTCzTMVZqPIO
 gJGl7O7BOzvpHK/dNcEVR2JErPXCgjv5yUVBSUGwWXrFRR6oGzaEj5swLhWJ4FwCnLYL
 m5VqaewOampVNFGSmDuz0IQcFVNrrv3Hocsf15n9AX35owFcjEvu0tiZcFR1zSrKg9z+
 4hBo9jM43PmAO4OTa0id5Rxwezw2mPdsqYgYd+Csp2sgiT/qIiQj72gSdT6m58NYG0D1
 r71g==
X-Gm-Message-State: AOAM5308EvmVNCCZVDFQyYxWlqyYRocaaDHGnKbTQ7k+jGBPoPIVIMw1
 ncgqHuSKcgj8A2pX6jt27sUfprv7ok8=
X-Google-Smtp-Source: ABdhPJwL4aSRVSwCdrd/f+zpOzgeXeh3I3QwvGiirMeMkpsJGd7BLGqzBXphL9ooeWKNfWEbmjkT/A==
X-Received: by 2002:a05:6000:110a:b0:20d:131e:bf0c with SMTP id
 z10-20020a056000110a00b0020d131ebf0cmr42691240wrw.108.1653830300477; 
 Sun, 29 May 2022 06:18:20 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a05600c34cf00b003949dbc3790sm7492562wmq.18.2022.05.29.06.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 06:18:19 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 15:18:02 +0200
Message-Id: <20220529131811.481017-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220529131811.481017-1-romain.naour@gmail.com>
References: <20220529131811.481017-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for-next  02/11] configs/qemu_riscv{32,
 64}_virt: kernel bump version to 5.15.43
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
Cc: Romain Naour <romain.naour@gmail.com>, Mark Corbin <mark@dibsco.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To build this defconfig with gcc 12, we need a patch from v5.15.24 [1]
fixing the build with gcc 12.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=7486227fa47aa84b102be18fd9985f6e8e11e756

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Mark Corbin <mark@dibsco.co.uk>
---
The issue fixed by [1] can also be trigged with gcc 12 and binutils 2.37.
---
 configs/qemu_riscv32_virt_defconfig | 2 +-
 configs/qemu_riscv64_virt_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index dff87ef342..faf4e1e312 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.43"
 BR2_LINUX_KERNEL_DEFCONFIG="rv32"
 BR2_LINUX_KERNEL_IMAGE=y
 
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index d67d070185..c455680ee0 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -19,7 +19,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.43"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_IMAGE=y
 
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
