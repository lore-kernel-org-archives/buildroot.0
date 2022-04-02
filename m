Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E590C433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 02:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2922408DA;
	Sat,  2 Apr 2022 02:08:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VEaVWSx0GnHb; Sat,  2 Apr 2022 02:08:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDB5A408EB;
	Sat,  2 Apr 2022 02:08:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BF8E1BF263
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 02:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A38F841CC
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 02:08:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L77Jo_bVFTQp for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 02:08:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0863841BD
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 02:08:02 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id r11so3202469ila.1
 for <buildroot@buildroot.org>; Fri, 01 Apr 2022 19:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DpvIxG9Qzqf/Qv56nmF0GPZrHvW3SbiDSQJrpbwg7iM=;
 b=eX7cCvHo5QZfp98/4c6ebiBZU/rZwUz5n63mm0oRJQnOm3HuqaE5VXUp1JqreAH++R
 y6FI6XNlekMcyup93V1mWqEVtRv1y1vZi1vopC3XI6LoG7c/C/uqngod/8shlUG0tOQT
 sNvy7FEnUeVj1/1dCrqS0kLVUchWJl/RQa56Wjm+vo4vmQh/HvAK5CN9K4wAJb/J+lyJ
 qg2khTEIp6Ox274pdphX5xnI/7hirZsPsldq5/3/LTzFyl4v86GXvB9xyg9Twp/qLAnv
 /KlBdbWPINq0WmzQNqnlJvQtUIqmbuJl4RrOm95Rs77uYTSA1eDwpKd5gAlMN1pQGku2
 50pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DpvIxG9Qzqf/Qv56nmF0GPZrHvW3SbiDSQJrpbwg7iM=;
 b=hYPKy+sIewKB2rmL41GZTrnW3gXuxShNpp3MDpLaVtM/kIIA9WT63ALFeZQj4y2Ps9
 gYWwpwnFF1KSFHvpf/qh+imA1K3JD9eW8+vPPd8trqhOYxZDk+qmtf7n594jwDmG4Js+
 cA+/LSSat83BEXBvtrievuwkjGljku6k6IjDP07ueLj7Ce05B44Vjs3LP6SSX+CoHYYZ
 QkwaByelOUF6WBSWI4QDyCmTbY/YKX6xZVEjoQAWd4Fvld4ZMfM8tZmY66PnUTqiQBi/
 jmIVh/VsVLUFCbiHovr3QkGeZZqStoPB3NZ6Eao4OlT3i/DWPUzS4qg9JLfIOawAqIFP
 kMJw==
X-Gm-Message-State: AOAM5332zidoooyib057NIAaCWHrJbpPOXJxT7wtLpvweaeMgVKlpTqb
 ArgttQRJ0iTXSse+X76nXMZif/D4BJSvgg==
X-Google-Smtp-Source: ABdhPJytDfVL0F+baBLRJxJLa9Sad2hFtr5r6IYqd8xCED1UwoTT4F8wyxk6FcpbC16Z8raS9qkZrA==
X-Received: by 2002:a05:6e02:180c:b0:2c8:825c:5052 with SMTP id
 a12-20020a056e02180c00b002c8825c5052mr1233166ilv.0.1648865281702; 
 Fri, 01 Apr 2022 19:08:01 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 a3-20020a5ec303000000b006496b4dd21csm2263272iok.5.2022.04.01.19.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 19:08:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Apr 2022 20:07:56 -0600
Message-Id: <20220402020756.415845-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] toolchain/toolchain-external: ensure
 BR2_TOOLCHAIN_EXTERNAL_PATH is set
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 299b6008aa..8274ace980 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -69,6 +69,9 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
 TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
 else
 TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(abspath $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH)))
+ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
+$(error No external toolchain path set, check your BR2_TOOLCHAIN_EXTERNAL_PATH setting)
+endif
 endif
 
 ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
