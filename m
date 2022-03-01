Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CB5C433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Mar 2022 23:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02FB041554;
	Tue,  1 Mar 2022 23:05:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VhsREdFqFQja; Tue,  1 Mar 2022 23:05:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 297584152D;
	Tue,  1 Mar 2022 23:05:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 679231BF580
 for <buildroot@lists.busybox.net>; Tue,  1 Mar 2022 23:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 558414152D
 for <buildroot@lists.busybox.net>; Tue,  1 Mar 2022 23:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zlPWhJrHF6-L for <buildroot@lists.busybox.net>;
 Tue,  1 Mar 2022 23:05:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C07041525
 for <buildroot@buildroot.org>; Tue,  1 Mar 2022 23:05:29 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d17so22884817wrc.9
 for <buildroot@buildroot.org>; Tue, 01 Mar 2022 15:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DIUaDUwniKpbVbJka19Zt2dp+3x+vGJ/JClBVksoKoc=;
 b=GMZVG/GcwnaMZFcAFA5jB786sCcl3CIZVECR7Y7VOUUx5k9a1TiXeqOz1TiV/JVCEB
 Sjn5tFqYz1qyn/kK0KW+agpVxHv/6MqHfaE8BdYFqsDC1nKqREpbgb3S2QTKVGaikxZj
 DbDwxxEGk8ZXfzfXEXsSrzZ1yiR5YKl19FQm4qPYjHOeeZWqS/UoFL7vIrmPc/DNfUyR
 W28VZrl7l55ARxuO9pk8tLrGFKcIayAQC4zrXUiQCeSiCISfFAQdueyvICUgmNhdKhOJ
 GfhFR3K/VSLtRoE6PFVph90x3A5kPFnRPLAjYMHr/ydgb+VszUCCFPioNZbZcvvc2wYo
 zqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DIUaDUwniKpbVbJka19Zt2dp+3x+vGJ/JClBVksoKoc=;
 b=pObRm4eX4qxuNSBGQEzgTNWQYSfHgfcomEwb+NfNgqryhDXjR2XhJrIywM5kcb3l6i
 zAregbSMZuAuJ27RJq0ywdLNQ9gNKxi6yn1kCQ/zq3PLamzb9AG7K0WlSIXPxO3/Ajkp
 rODZUpqsWzpdg2c5a5fdqdzjB/HmEVnjHN6hZ0aEPtzJr2Ou27k5kDp4MLNpX03ynsqM
 o7n05v0FfMAq1z8f28SaQi2Lvej91h6sMwfgI0CtFTIvg5VSCv0+75OYD//7rXupwE/k
 2K982FKFS0F0alKPFa5yuTTzPWyPFw3uqhV4xJMcrbb5++VcLbNtiDS2qXZLcxVZp2jc
 m/zA==
X-Gm-Message-State: AOAM530q52WpcVFDpOj1y+aQQdcAaPRatfCDvXKLnx1VQ2viI5W02tvY
 rWO+P8VTdPt8q8eEC2RmiS/1K1ux/AQ=
X-Google-Smtp-Source: ABdhPJyQeU1mLdF2pUK4ceiqjv9DCGoC5qwxP6x3eICBdOoB/MNGCL0861e/9E8TN3fNNK8bTDOe9Q==
X-Received: by 2002:adf:e401:0:b0:1ed:c254:d51f with SMTP id
 g1-20020adfe401000000b001edc254d51fmr20767157wrm.49.1646175927420; 
 Tue, 01 Mar 2022 15:05:27 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a05600c2d4900b0038100a95903sm3582622wmg.41.2022.03.01.15.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 15:05:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Mar 2022 00:05:04 +0100
Message-Id: <20220301230504.1000454-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/parted: bump to version 3.4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://git.savannah.gnu.org/cgit/parted.git/tree/NEWS?h=v3.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/parted/parted.hash | 4 ++--
 package/parted/parted.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/parted/parted.hash b/package/parted/parted.hash
index 2c466eb8d2..392436ec4b 100644
--- a/package/parted/parted.hash
+++ b/package/parted/parted.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	57e2b4bd87018625c515421d4524f6e3b55175b472302056391c5f7eccb83d44  parted-3.3.tar.xz
+sha256  e1298022472da5589b7f2be1d5ee3c1b66ec3d96dfbad03dc642afd009da5342  parted-3.4.tar.xz
 
 # Locally calculated
-sha256	0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf  COPYING
+sha256  0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf  COPYING
diff --git a/package/parted/parted.mk b/package/parted/parted.mk
index 66940fc516..23158179e4 100644
--- a/package/parted/parted.mk
+++ b/package/parted/parted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PARTED_VERSION = 3.3
+PARTED_VERSION = 3.4
 PARTED_SOURCE = parted-$(PARTED_VERSION).tar.xz
 PARTED_SITE = $(BR2_GNU_MIRROR)/parted
 PARTED_DEPENDENCIES = host-pkgconf util-linux
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
