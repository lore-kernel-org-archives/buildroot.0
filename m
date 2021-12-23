Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C47BC433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Dec 2021 01:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4C6E40616;
	Thu, 23 Dec 2021 01:11:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q6ZjhY5-XX9w; Thu, 23 Dec 2021 01:11:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 844B7405F7;
	Thu, 23 Dec 2021 01:11:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 334521BF473
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 01:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CD08813F1
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 01:11:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FjqfyyI6CNKo for <buildroot@lists.busybox.net>;
 Thu, 23 Dec 2021 01:11:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C6598142A
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 01:11:51 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id v11so3817752pfu.2
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 17:11:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FKhdDWLgTZV5126S7BOM2U5B1+qI/2P4Gyyin2KWs8Q=;
 b=AJw7K0o0vjKwAh66vlDXEE0/BpoTB5lFaGjgPptqQp3v1s9HFcY0UhLct1qNDQF8ai
 Qt75zkkzjl7GQu2y2nX2zAz+b9Zl68YU04F3lROFAbIucG9cj5oUIcpRZf0ZoBHCa7Ad
 nnM+p/HP1xJWiHJbVgzzvD8pHrxdrXC/anXMaVA861FWwm5xdlhD9WdIcpLvG/J4tToZ
 4vAV2lAnfBpv2HxAhVjrfrcSvzRrxiFEC95wtn26huJJebJxM3EKra62DDD2vOlzLXaM
 NLKadMqhjtCD/on/AIDy7i3xZLOTl2CnbcOwHl4u6ghQ/Jtt/Dj/Wit0Z/CfLUt8jmAa
 sHJg==
X-Gm-Message-State: AOAM530tK+jzEVijCktSFTAG+afyInPZAvNKiSkQDMZNz3Jlhd/ioQLa
 xTRUy5vtcyHOaxJlsyBIksJJ9UyM8V7jJQ==
X-Google-Smtp-Source: ABdhPJwYSUhFoIfeKv2ezj9yqYeLQXcCNlY83IIwniJsaoWixzHwjb6a22f9SkPfOOJfL3p6gC/5Kg==
X-Received: by 2002:a63:83c1:: with SMTP id h184mr221809pge.361.1640221910736; 
 Wed, 22 Dec 2021 17:11:50 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 n20sm2974708pjt.40.2021.12.22.17.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 17:11:50 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 22 Dec 2021 17:11:47 -0800
Message-Id: <20211223011147.2050411-1-christian@paral.in>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.60.3
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 467f540761..02d8900003 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.60.2/meson-0.60.2.tar.gz.asc
-sha256  64e6968565bf1b8152f4f9d6ca8154efb9e14caa9aabf7b22e71e6c5d053e921  meson-0.60.2.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.60.3/meson-0.60.3.tar.gz.asc
+sha256  87ca5fa9358a01864529392bd64e027158eb94afca7c7766b1866ef27eccb98e  meson-0.60.3.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 154f712f5b..e8443eacba 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.60.2
+MESON_VERSION = 0.60.3
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
