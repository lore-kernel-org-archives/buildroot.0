Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E187EC433FE
	for <buildroot@archiver.kernel.org>; Wed, 15 Dec 2021 17:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57A2C41577;
	Wed, 15 Dec 2021 17:29:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JqbsvJaqd0YR; Wed, 15 Dec 2021 17:29:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2CDF4156F;
	Wed, 15 Dec 2021 17:29:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6B151BF2CF
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 17:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4F518282C
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 17:29:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NN9WLXn6oyzn for <buildroot@lists.busybox.net>;
 Wed, 15 Dec 2021 17:29:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2FD5824EE
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 17:29:38 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id k9so21668003wrd.2
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 09:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5sT3Uwd0MGoMYg3WsU6Brxb+9F9zdf0ujlMvt5y4FuA=;
 b=bFyAZhHNNnrsIsXKH3Lm0M98kdtzXZbXggr33J32AIt1YcOaeUDmNGga8kfe7tPScv
 QvfsMa7jUEpkOQvaUqdI1cLApcWvOEArisc839KfSgk6drLpq1Okl1ryXN/+0J0najhn
 ocvQ8NbRIicCf4WGpADIXhwboP3kcuWPyKUzYgC8cmu4KM0VkMiKNIRSo21yng8KwCVp
 OBXMo8Aite1MqFoJ11MHg9jz4yu3eRDQi9lK2dfBnjKlFWt9tjXsG1+wjQibLmSUO2CS
 XDfCXk9xo7O1eEM7icmi2ydAYXaLzd/K8ZRBRGs2LOu+eovC054woCQ/R8Mv7vLqaGyL
 9wkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5sT3Uwd0MGoMYg3WsU6Brxb+9F9zdf0ujlMvt5y4FuA=;
 b=OSYXpX+420kSb7daIIOUbq+lXPfngQEWYs5JQxgbc3p3WtdCtfvmVOKgFfX5GhdWRw
 2ZEbKbnHWoeAjCC+CncT1GZnwgdiNvdMIxquHmZ66RNxrLZI9koFN9fVrPN/jnly1E65
 B0CAJJqAUCflN3Kg0Phl+O+Yc0eLVE4mclj3eesj3UC75vyeOtZAY2HBvnWQSGy76Dic
 TxkvsN6ffgTGVeXPod3AtOnzY1RHun16M1fOAGuRI47hHfA8g9SyoFIVZWNHv7Qp+oxG
 9ACvR8T2Cr1b+vMoLWwgvz9tYhTjgxAeviOafkcn857kLQbIOw7GylcRYf8XwOkW5Asu
 HWqg==
X-Gm-Message-State: AOAM530C6tBVruGs7LebcthcEdXH2+p35gCuoXQ07wSfa05dPWOrL1eu
 YNAuL3XoYmvPF8Ft42WIMohV6rq9NetIYQ==
X-Google-Smtp-Source: ABdhPJwlG3sgka8FvAZ+hYIRu+PPa0ZtdJwlaLlj/YCyxxYPSmVvRmitNN+PHTm0S++AJ0dKeSI2cA==
X-Received: by 2002:adf:900f:: with SMTP id h15mr5424903wrh.562.1639589376864; 
 Wed, 15 Dec 2021 09:29:36 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id o25sm2407305wms.17.2021.12.15.09.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 09:29:36 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Dec 2021 18:29:17 +0100
Message-Id: <20211215172917.3798152-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/taglib: fix build on sparc
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure on sparc raised since bump to version
1.12 in commit b4bdf704fea59db81433bbc07585e4c4db258d9a:

/home/giuliobenetti/autobuild/run/instance-3/output-1/build/taglib-1.12/taglib/toolkit/trefcounter.cpp:55:21: error: duplicate 'volatile'
   55 | # define ATOMIC_INT volatile int
      |                     ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/387feeb6bcc190b3908e405ba5f8a888d7e1f348

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...e-on-systems-without-HAVE_GCC_ATOMIC.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/taglib/0001-Fix-error-duplicate-volatile-on-systems-without-HAVE_GCC_ATOMIC.patch

diff --git a/package/taglib/0001-Fix-error-duplicate-volatile-on-systems-without-HAVE_GCC_ATOMIC.patch b/package/taglib/0001-Fix-error-duplicate-volatile-on-systems-without-HAVE_GCC_ATOMIC.patch
new file mode 100644
index 0000000000..d8af73cb08
--- /dev/null
+++ b/package/taglib/0001-Fix-error-duplicate-volatile-on-systems-without-HAVE_GCC_ATOMIC.patch
@@ -0,0 +1,34 @@
+From 1d24bd3399f2284104cbe87d017f87325b1797ab Mon Sep 17 00:00:00 2001
+From: Oleg Antonyan <oleg.b.antonyan@gmail.com>
+Date: Thu, 13 May 2021 16:41:35 +0200
+Subject: [PATCH] =?UTF-8?q?Fix=20"error:=20duplicate=20=E2=80=98volatile?=
+ =?UTF-8?q?=E2=80=99"=20on=20systems=20without=20HAVE=5FGCC=5FATOMIC=20in?=
+ =?UTF-8?q?=201.12=20(#1012)?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* fix error: duplicate volatile
+
+* fix volatile ATOMIC_INT in constructor
+
+[Retrieved from:
+https://github.com/taglib/taglib/commit/1d24bd3399f2284104cbe87d017f87325b1797ab]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ taglib/toolkit/trefcounter.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/taglib/toolkit/trefcounter.cpp b/taglib/toolkit/trefcounter.cpp
+index 18cb596c0..5b089abf9 100644
+--- a/taglib/toolkit/trefcounter.cpp
++++ b/taglib/toolkit/trefcounter.cpp
+@@ -52,7 +52,7 @@
+ # define ATOMIC_INC(x) __sync_add_and_fetch(&x, 1)
+ # define ATOMIC_DEC(x) __sync_sub_and_fetch(&x, 1)
+ #else
+-# define ATOMIC_INT volatile int
++# define ATOMIC_INT int
+ # define ATOMIC_INC(x) (++x)
+ # define ATOMIC_DEC(x) (--x)
+ #endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
