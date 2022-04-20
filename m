Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C68C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 16:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF587403B8;
	Wed, 20 Apr 2022 16:45:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0kf1owakhvFt; Wed, 20 Apr 2022 16:45:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D51C54052E;
	Wed, 20 Apr 2022 16:45:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99CB21BF4E3
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 16:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96B5E41571
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 16:45:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vm7Bm5j97_3k for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 16:45:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A71941529
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 16:45:24 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso1620676wmz.4
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 09:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+OMpk3Eu4Ltr2wngNUFBG67doGk5knB4fOunDdpooyM=;
 b=K0kFHVrwR/zqe4APhxMeqlM7StQ9rzFWEUphU+7OQfVOMfOVDcxMCLgfCvqcK146FS
 mb6E5fiYV+IgJ/S1I0BC1p1vBwO+GbqVpvzM7lx2HP76v1lfLtzhXrgSNkCcqKyPpXiR
 VSTnJTgmLRvyR5M8m8G55PPfjX0bbuyOp7UPRhOZDrhqtON1Lmi58u5djYumrfEfd6Ug
 0i1SNoWbeaar4DbSEIzkrDt8utpwYrkgE3Q3rpPmnDkIjrdCYabBPGoNuksU0OxkIDew
 WDPB0+EdOMxd+up10ypfpOGpxa3JEDjp692ITRLQtJd9JNupO8f80PLpqXl/+8UOMa3S
 YVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+OMpk3Eu4Ltr2wngNUFBG67doGk5knB4fOunDdpooyM=;
 b=MH3e7D7/kyBuM6VUNDrw7Gb9TU6fASj/CQKNQnr0+Z2gD5cfVn3eH7gdEWytva2sqW
 YG7vkccewRqFK1uyNOcS2PcE8p1VFaVRh45lGum/UPakbzDt3M8FaJVlgplaX7sFTKjt
 nlDTxcmOFmMOHBHz9kgXsjnvWG9flGNd5hFvsUyypoJH7VhiSLmWqk5dUccbIU1F5wu0
 kcY3/B5VgZDihuETeIdjq2cdxAuQejExqnS7Q7yZIOSA/1Sypy6Lu+goY1dv9tiYxwkU
 pvOHh5tiY4ztkXmhi5gFvgpMBD1dMgvSifz/Kf6fdlzOKxyLp0sBKtn1Bo4uqpTNL+0R
 WK1A==
X-Gm-Message-State: AOAM531UMxM80MRQeTeIxVaXG0/tAMyNJLPCSYMHADCJVqhfI9I2yoaR
 5YdRLd84A48wXQrXMeot5DxPzX49qNs=
X-Google-Smtp-Source: ABdhPJxnNnLQcdbUuBy/hFAHCM9LSrP4/HcfxqfOFXdtbchfKUvB/MXH3o32GY/Jlrw81qiG57yLfg==
X-Received: by 2002:a1c:5401:0:b0:38e:bf1c:d25c with SMTP id
 i1-20020a1c5401000000b0038ebf1cd25cmr4580213wmb.119.1650473122266; 
 Wed, 20 Apr 2022 09:45:22 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c4f1600b00392889d04c4sm350557wmq.23.2022.04.20.09.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 09:45:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 18:43:19 +0200
Message-Id: <20220420164319.1114520-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tbb: fix nios2 build
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure on nios2 raised since bump to version
2021.5.0 in commit 3c66ac07a0783b21f95e699b3762edd15e27bdf9:

In file included from /home/giuliobenetti/autobuild/run/instance-2/output-1/build/tbb-2021.5.0/src/tbb/tools_api/ittnotify_static.c:17,
                 from /home/giuliobenetti/autobuild/run/instance-2/output-1/build/tbb-2021.5.0/src/tbb/itt_notify.cpp:43:
/home/giuliobenetti/autobuild/run/instance-2/output-1/build/tbb-2021.5.0/src/tbb/tools_api/ittnotify_config.h: In function 'long int __itt_interlocked_increment(volatile long int*)':
/home/giuliobenetti/autobuild/run/instance-2/output-1/build/tbb-2021.5.0/src/tbb/tools_api/ittnotify_config.h:348:12: error: '__TBB_machine_fetchadd4' was not declared in this scope
  348 |     return __TBB_machine_fetchadd4(ptr, 1) + 1L;
      |            ^~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/2b55d1d171f21030be8312f984ea02ec8c8348a8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-Define-ITT_ARCH_IA64-when-undefiend.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/tbb/0003-Define-ITT_ARCH_IA64-when-undefiend.patch

diff --git a/package/tbb/0003-Define-ITT_ARCH_IA64-when-undefiend.patch b/package/tbb/0003-Define-ITT_ARCH_IA64-when-undefiend.patch
new file mode 100644
index 0000000000..5b7f002499
--- /dev/null
+++ b/package/tbb/0003-Define-ITT_ARCH_IA64-when-undefiend.patch
@@ -0,0 +1,27 @@
+From 6fad69889da67bc4d4baff4afa94f77da45e006d Mon Sep 17 00:00:00 2001
+From: Felix Yan <felixonmars@archlinux.org>
+Date: Thu, 7 Oct 2021 14:16:16 +0800
+Subject: [PATCH] Define ITT_ARCH_IA64 when undefiend (#550)
+
+[Retrieved from:
+https://github.com/oneapi-src/oneTBB/commit/6fad69889da67bc4d4baff4afa94f77da45e006d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/tbb/tools_api/ittnotify_config.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/tbb/tools_api/ittnotify_config.h b/src/tbb/tools_api/ittnotify_config.h
+index 8ecc23781..f904a8e9d 100644
+--- a/src/tbb/tools_api/ittnotify_config.h
++++ b/src/tbb/tools_api/ittnotify_config.h
+@@ -147,6 +147,10 @@
+ #  define ITT_ARCH_IA32E 2
+ #endif /* ITT_ARCH_IA32E */
+ 
++#ifndef ITT_ARCH_IA64
++#  define ITT_ARCH_IA64 3
++#endif /* ITT_ARCH_IA64 */
++
+ #ifndef ITT_ARCH_ARM
+ #  define ITT_ARCH_ARM  4
+ #endif /* ITT_ARCH_ARM */
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
