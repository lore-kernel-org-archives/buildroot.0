Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B55C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 07:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A01C410D2;
	Wed, 20 Apr 2022 07:25:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uLKSbJzmpfWo; Wed, 20 Apr 2022 07:25:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9048F410C6;
	Wed, 20 Apr 2022 07:25:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 84C8B1BF38A
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 07:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 727A782B51
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 07:25:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SC_4SJB2hwUP for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 07:25:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 716A2823EB
 for <buildroot@busybox.net>; Wed, 20 Apr 2022 07:25:43 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id e21so948878wrc.8
 for <buildroot@busybox.net>; Wed, 20 Apr 2022 00:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HoHG9tm5Ls0RYp7YxXn3VvsUt+K2znuXMupbLx3PzTI=;
 b=XyZETgmR20pjiVwyOZunC8mjkbfWGwxlCJu0P0Pg4wwnxsWy/AwAnob8qKzq+ZD5ab
 sJpBnkrFQnYjyZgijYuNGd8E27ht7J36yVdZXi5hjzEdUiOJwdh5sXYCnchnw67b9gQP
 B3tO88w01L+IMIaR1cqWeuGWrIRK+eqp018eHsRE/yuIgPkG7Tq1fKPqK9JJdBwYP0Ee
 Gj9HrV/y746Hg2nXtFXtFz5rc9pxM2/XC6I6fFCSlWPduhG0hZUIh8I93RQSURhJkn49
 63MTuNv/WLJQT1eCLUxaS7oYTT8HT9fyChpvhkNF7J1AH0iQla/j3kLWpr4iPpB34/OQ
 22fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HoHG9tm5Ls0RYp7YxXn3VvsUt+K2znuXMupbLx3PzTI=;
 b=JcSjXTkta4Vw5HlemXg+vDlEJcHkL10O+FjNgivhOtdVAAY+1Bu6fAMAFAH94RAPS+
 i0rufIMx5aPym0ShiM4PfMp/jYnZOsiywu+C9PtL5CuXrurtGXE2HiW5hbzEC/10N65/
 87CkW17gGpRzlwkOSXGiggzjRNK4ClsZlvevsmRlpVBxYSqO8r3MOzpk651SXtrHhmP3
 cJaLXDMn+3K9+WdTxFA8efzqmFwOqJcwWI10q6MB+aBTujarAyb0AfS8zItsEXHRewnz
 XRlvbiINXg/CH69EA5BSx2VjJBE+dYswohIAFMA+2p+Px3M/3lrkvGdl4xIwsD8zKF93
 cDZQ==
X-Gm-Message-State: AOAM5308xlplNU9wlHFACP6kunucGm1Zc2TQlLGBUUkRxtf1ml/OxeAI
 061sBkFoJCI7rK/YkBPqVwq+HrZJxXY=
X-Google-Smtp-Source: ABdhPJxwmFkLFCW2X1uqM5ZSMcFwMNRSu+1TiJPrJZm+wibvmMF0Fkbh/i3jAkDXtHNO4upfZLJiKQ==
X-Received: by 2002:a05:6000:1c8:b0:207:a350:404 with SMTP id
 t8-20020a05600001c800b00207a3500404mr14344428wrx.311.1650439541545; 
 Wed, 20 Apr 2022 00:25:41 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a1c3807000000b0038ffac6f752sm17313447wma.45.2022.04.20.00.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 00:25:41 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 20 Apr 2022 09:25:30 +0200
Message-Id: <20220420072530.3422018-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/enchant: bump to version 2.3.3
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/enchant/enchant.hash | 2 +-
 package/enchant/enchant.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/enchant/enchant.hash b/package/enchant/enchant.hash
index 9df5316aa..36ac4e07b 100644
--- a/package/enchant/enchant.hash
+++ b/package/enchant/enchant.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  ce9ba47fd4d34031bd69445598a698a6611602b2b0e91d705e91a6f5099ead6e  enchant-2.3.2.tar.gz
+sha256  3da12103f11cf49c3cf2fd2ce3017575c5321a489e5b9bfa81dd91ec413f3891  enchant-2.3.3.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
index e00fcb25e..ee6f06195 100644
--- a/package/enchant/enchant.mk
+++ b/package/enchant/enchant.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENCHANT_VERSION = 2.3.2
+ENCHANT_VERSION = 2.3.3
 ENCHANT_SITE = \
 	https://github.com/AbiWord/enchant/releases/download/v$(ENCHANT_VERSION)
 ENCHANT_INSTALL_STAGING = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
