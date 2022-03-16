Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EDDC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01E3A409FC;
	Wed, 16 Mar 2022 21:24:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EnUF3nIX0ISZ; Wed, 16 Mar 2022 21:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28AC8409B1;
	Wed, 16 Mar 2022 21:24:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 590781BF2C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48C158131D
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:23:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4qq026xgQIBP for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:23:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5EB418131A
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:23:54 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j26so4774540wrb.1
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 14:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C4IRlDBwtp9w+en7X9Vk88ugDg6bIVRRexRd/yCZICg=;
 b=D3zb76wZbVQSJPnJw00dvKh41FpygZJ9FvJUlTC2ldTh4mxUiWepTIduAqRT8PxGrP
 dXa4pnVWxF2Vj0zWv6DoF6o5HGJnYEuqkBk7tO2LQIrNRDVwTLEt7zV+qB3pQfm0+K/c
 n+sQIFL63RXxphwibLh+G6n+FWujlDIwhDqAQbX0Kvl9XwnueARDReh6/oa4KXF+B5zZ
 sdouhdhOe1g74pDjBpx/H7+bukzbDgjzl7QbV2Mbp80E6XdvRSuXiLLFusYAqIfruBMa
 KO7OrAlypdiO8+oMtxp29ZcJnqb0rhjyus1we/lol/E6KSjU3/dplhmNUbWsc1CO1o+V
 NTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C4IRlDBwtp9w+en7X9Vk88ugDg6bIVRRexRd/yCZICg=;
 b=0rC2RyShM7oUiELMfFP/ECUUfdSEv97hXawqklJmHR+IP5XRqSgfANvb95eqNQ+GDU
 pE08e/AhwitnFmj26zzu6uq9rBMynJa1CHGadQFc5FCkNIH8pTPF9uLJnRZWJ8nF9fdK
 Zkn/2hDuTSB9JibzYLeTS2GQHYaguxeBUoMT5ZqHtpjzwCt2qtLrmLpvvDIqw8z1uYvc
 9BVik+iKNQXATrMkyuD34aRbASGEjhst5nEiXHxjklNTdf0wpxgOx4yjykNVbhsljE8c
 AbXHiVtVt+M+JhnZ4cc8P6RUpKK3KLlvQmwCH6th4CaCWjSMQ7PwHFs13458JH9iTwHE
 Fd4A==
X-Gm-Message-State: AOAM5330r6rXUbbiWLAjym1xmQphIibujNP8kbcZ1UPZV5VzHbL4bbqN
 GQuAEes7eTp9UjymdeSSbMrvibDXOgU=
X-Google-Smtp-Source: ABdhPJx1kNdzCBvOFbyCX2BNhUq4f66GJ7IChT1uEkJbsucWz8Z5z7fvLAPDatW7v31dzmWiOJtixg==
X-Received: by 2002:adf:eb87:0:b0:1ef:85f5:6ab4 with SMTP id
 t7-20020adfeb87000000b001ef85f56ab4mr1536572wrn.158.1647465832446; 
 Wed, 16 Mar 2022 14:23:52 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a5d4586000000b001f0436cb325sm2440959wrq.52.2022.03.16.14.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 14:23:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:22:17 +0100
Message-Id: <20220316212220.3437314-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316212220.3437314-1-fontaine.fabrice@gmail.com>
References: <20220316212220.3437314-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/6] package/zynaddsubfx: fix atomic linking
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit 18a863063735e2c658fa6947a4e540e9dda6c431:

/home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.3.0/../../../../riscv64-buildroot-linux-musl/bin/ld: libzynaddsubfx_core.a(Master.cpp.o): in function `.L1880':
Master.cpp:(.text+0x7cc0): undefined reference to `__atomic_exchange_1'

Fixes:
 - http://autobuild.buildroot.org/results/91b5959ca0eb136c1609462e71d109ff09cca5e5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zynaddsubfx/zynaddsubfx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zynaddsubfx/zynaddsubfx.mk b/package/zynaddsubfx/zynaddsubfx.mk
index b2eb1921fa..db0459ce62 100644
--- a/package/zynaddsubfx/zynaddsubfx.mk
+++ b/package/zynaddsubfx/zynaddsubfx.mk
@@ -14,7 +14,7 @@ ZYNADDSUBFX_LICENSE_FILES = COPYING
 ZYNADDSUBFX_CONF_OPTS = -DCompileTests=OFF -DPluginEnable=OFF
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-ZYNADDSUBFX_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+ZYNADDSUBFX_CONF_OPTS += -DOS_LIBRARIES=-latomic
 endif
 
 ZYNADDSUBFX_DEPENDENCIES = \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
