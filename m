Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A60C001B0
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 17:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E802410AD;
	Tue, 15 Aug 2023 17:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E802410AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ICgxEQ5jJCBK; Tue, 15 Aug 2023 17:46:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8DD440A21;
	Tue, 15 Aug 2023 17:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8DD440A21
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F21831BF47D
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 17:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D763840516
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 17:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D763840516
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UxRtaHElThiZ for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 17:46:07 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8324B40296
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 17:46:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8324B40296
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-31963263938so3385865f8f.2
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 10:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692121565; x=1692726365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cwfuwCr4cGkP3k9znu0jEPYJDsUpP5HId4EW8O05jCw=;
 b=l2YSHVG9oOHUdo40UnUey76rbQ1UmtQmozZOijAoaQUrdYrR0DFOwLRvRTXcO73oFi
 JQwTW6kRdFtc7Jp1paGBpOsV1FdpDNoATzXRuA7RumU8ZLLhSdFl9eqSjEH6dA+ZANR9
 RD+pNmyBLS47xrWnjBUJyYowFskAzS7Ysz3fuYwRM61P3ktd5snB1CN2aLbcUol4lOEo
 mDOKrPPYOkml6dic9LYsCZ2qQaPnFZPBsGQt1ZOA7/QQ+53SR0sbVrU+/Bl5NPolXMQa
 wd0ph2A8Np0kNZeQV/TThDqomnAX/RHfp/g7t4uCez8umj74prNNIwB0SdP51svbkkB/
 ktew==
X-Gm-Message-State: AOJu0YycDuaEbdiQxnLMH+lSzWJGw5FPLDzgBxgxqay6KdWFor/1x5vE
 m7AUGKZddiOh1aS+ryd9XxqL+u0sCjw=
X-Google-Smtp-Source: AGHT+IF7Jit0T53nCkOPjw5F4zgl2xZMcu9NlBTPISPkOYYZL77dVb5wTHRpFnuh0WjxchXHZ3b/1Q==
X-Received: by 2002:adf:ed8f:0:b0:314:1ce9:3c86 with SMTP id
 c15-20020adfed8f000000b003141ce93c86mr9400290wro.0.1692121565309; 
 Tue, 15 Aug 2023 10:46:05 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a5d6507000000b003143b14848dsm18388028wru.102.2023.08.15.10.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 10:46:04 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Aug 2023 19:46:00 +0200
Message-ID: <20230815174600.290776-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815174600.290776-1-romain.naour@gmail.com>
References: <20230815174600.290776-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692121565; x=1692726365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cwfuwCr4cGkP3k9znu0jEPYJDsUpP5HId4EW8O05jCw=;
 b=nHoxZvw9XgMW3FQpXwAjAAl7mEyCGLbTWwMXHcaYrlZf8qI1zxzHc4eyy3ipwnlRCM
 hz9iNKyzSx6XIZGk6d3LJKV29MBy+omWGZTbTZNrCWtDDb1P1ljoB1YgQXgxWaCAb8eU
 0LUYdAn1OdKGmtisbZ5I23MoRDMCHEwVuFnLMvdSr7duqnb0sCY7YC4zx0WUS1WDqqDx
 t4ahCNmbrDIrX0Gxhxmkp/wzSJPa4QiA8W+aJVE6SHU6Wp+pqy2lgxTT3dZ0/CClyIkP
 F2QX8E+hvdCLowvO/JmPK3c/ncdvSQCQddtzAD8k97KwxahkIBGWrkDxWwc5ee2urS0i
 4lZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=nHoxZvw9
Subject: [Buildroot] [PATCH 2/2] configs/hifive_unleashed_defconfig: bump to
 kernel 5.10.190
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

We have to bump the kernel version to build with gcc >= 12 for riscv
and zicsr/zifencei extension [1] [2].

Similar to 0a4ac1e7fa715669aa2ab2a58b564fc875c07c68.

Fixes:
./arch/riscv/include/asm/vdso/gettimeofday.h: Assembler messages:
./arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01', extension `zicsr' required

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=7486227fa47aa84b102be18fd9985f6e8e11e756
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=0b077b22ea9ff698840ff9305d9382935fb41540

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 configs/hifive_unleashed_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index 37898284ac..c9d4a31ede 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -28,7 +28,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.190"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/hifive-unleashed/linux.config.fragment"
 BR2_LINUX_KERNEL_IMAGE=y
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
