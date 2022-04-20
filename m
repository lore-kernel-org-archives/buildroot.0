Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C71FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 07:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5FDB612F7;
	Wed, 20 Apr 2022 07:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hzXTh09ZnhZn; Wed, 20 Apr 2022 07:26:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16214612FF;
	Wed, 20 Apr 2022 07:26:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 461151BF38A
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 07:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33CBF82B51
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 07:26:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T_8BCksjrfMH for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 07:26:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7665C8401D
 for <buildroot@busybox.net>; Wed, 20 Apr 2022 07:26:05 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id c10so982688wrb.1
 for <buildroot@busybox.net>; Wed, 20 Apr 2022 00:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kv1dQh5e2BrFdgjHobx4ZuHSKyqQ5yylRhswF0GXa9M=;
 b=MauP/c1FquLmP32MEHboUXH/QDc8N3YzgMSFVjMla4n7s0nfkdeK+4lKc1gOJ/GMXl
 +rhuJVp5Rbm3/XY8XxFqIwaaSXuFsI6WdV/lrid7xIRIvKByMUlDOBCgMkELDs1yHxvp
 8q8dON4BZaoRsTzpUp5S972J4n8E+ZYYbzMnjI8GQdkq4OtY/PjNtAjZAaRVnCg9lhDU
 b209eQT8ODOEWRRSDIY/qkdbKNsKUPkrnUSlYpMAEZuTxvg650Z3gnfVc7jezVIIAlD/
 zmCF6xWJCzEyZSyCKDHIHWeWQwbgmX3+OXDYOc8YjJIS4zVJ2Y45QMZ20BN7bTFDIOQF
 vB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kv1dQh5e2BrFdgjHobx4ZuHSKyqQ5yylRhswF0GXa9M=;
 b=AORZzwoUis+elndvpz3jZJ8ebSv5A7HUOMxTLBfyPsGIsORoEDf3UYAZyNce81Y589
 gmYJivmwZy7IkfZ7VsObeQ76U7Feasy6g2YWCjU/fH6nXD28MQ7zNcH09/jyE2AY3vP7
 D8ZsLAvpLECts0kGrsze5B6lEagI+zZNA1E2d2UdYjzlMIiVa/yvyrjgWnBnArYyi8mC
 F4mZvHlVGoTQgLd8GngJewoSUuMchjvqeLTJPH2fn/jl4zxUlmcvx7Kjvh26VPyEntID
 pE5HnVB8RD+8c04WhOB4OQghsDPIfTyNyMy8sI1Kr+mN+jtAKu9DZ58NCVbMu1fP6ap7
 hrSg==
X-Gm-Message-State: AOAM533wd3yurkISEQuCBLUbtGHbQzdfN0T0vdAYcw/2JtaIUv6ND0Bv
 j9mtkQPqV7mjgZLWqww9dOtjBCwC12c=
X-Google-Smtp-Source: ABdhPJzMKcCvafK9qbTztGqShW9IjvG/Xx28prYE4vaolItjArvvQSH7bOe9Z+4TKuP2qa12dePZAQ==
X-Received: by 2002:adf:f00f:0:b0:20a:80c6:bdfb with SMTP id
 j15-20020adff00f000000b0020a80c6bdfbmr14476192wro.378.1650439563574; 
 Wed, 20 Apr 2022 00:26:03 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 bi26-20020a05600c3d9a00b0038ed39dbf00sm17464017wmb.0.2022.04.20.00.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 00:26:03 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 20 Apr 2022 09:25:48 +0200
Message-Id: <20220420072548.3422167-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/janet: bump to version 1.21.2
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
 package/janet/janet.hash | 2 +-
 package/janet/janet.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index 50e6b1fef..aff8e95bb 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  02ff892f4bfc060a8a37f4a5c3e659bf34ba5f1f1c5eb07d60dc2642c5cf0476  janet-1.19.2.tar.gz
+sha256  52db8d18f93351256d0731810e8bea95516db8142f51eeb31664f7884bf63088  janet-1.21.2.tar.gz
 
 # Locally calculated
 sha256  e2d2ae8360d95386af751ac7d1a3da36ea8ceb230e5f0eba7eb762547b1c58c9  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index 5b6a9a182..24a0f8603 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.19.2
+JANET_VERSION = 1.21.2
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
