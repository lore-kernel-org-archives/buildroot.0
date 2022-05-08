Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B38C433EF
	for <buildroot@archiver.kernel.org>; Sun,  8 May 2022 15:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F82C403C5;
	Sun,  8 May 2022 15:48:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A1m3neIA9Q1b; Sun,  8 May 2022 15:48:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B018240350;
	Sun,  8 May 2022 15:48:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D4ED81BF356
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 15:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3F5281B25
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 15:48:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rMLUJV1Wo6P7 for <buildroot@lists.busybox.net>;
 Sun,  8 May 2022 15:48:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 993AE81AF5
 for <buildroot@buildroot.org>; Sun,  8 May 2022 15:48:24 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id bg25so7134415wmb.4
 for <buildroot@buildroot.org>; Sun, 08 May 2022 08:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EG62VlwoqbLx7DMhFtyQ8C6ulDdWFNwWUJxalVK2+3k=;
 b=KKCKoP65aH4OASBuILQ2HnnpwGcvUBemZPMgEj6DoYe072Dqzh69BN4dD0xDZpstEF
 Rt+grpp2kudqssqcFi1OxbQM6ZO8HXEQk0ZFHPVF9/aXgM11WCoMVzn3NJFZ/zhYZ0e1
 KuEbTfl1Jq6sYMBliT0yxNf84FEhiyDbl/qo4Lejo+bAFRJAzgGKKeRObhGGx2Kx72IH
 TJExOQqeAK4ophfz5AwhHorHRXJKPa8aAIWrYb7sMiyxcuHWFgx/Jypl6+5FxzaGcvpX
 486JdQ1UgdJ9wYMPM1W2CEAAO0dr2tAK6xml/MHxBeUvuuKdsoId25d9FBlaDgHZFca7
 vGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EG62VlwoqbLx7DMhFtyQ8C6ulDdWFNwWUJxalVK2+3k=;
 b=wDI5+fwD7QQMFgeOqourdGQJgsjvCcAOmfdLm4TYVP/M6UnXCGkyPGapAiYVc8ibuU
 XBVWSB+7ssCwEQKUUss76rPWnP0i44Q4Okb5TOpC8eUH0OkyXvPGNq8gHw6uzqKauO+s
 z1tAsv3W+6a4O8cRJfCooGtznd6wtArmT9Ybv2Ge3l7KKHkcH4mY2FkPo2YvWs5WcZKT
 zXiEZ762I5OIhsUoMkvzkvyspD/FmjTruZhy4NHVEhl6B01uu6bA8Av+sJgKsBYGLYv+
 BNyitcsnMke92sYIF+ivno7br3sdPdc578dg7z/iVq9K7CtnCwNjMSpyFCTs9D1ULVpr
 SLuw==
X-Gm-Message-State: AOAM533N0uvJ9iQbRAwSR4hl4JkLgld+xV5J2QK7SPxXEOEEkJcdwvB3
 iSSMNCatliHV+waNV5eoe6KZyBhqk7s=
X-Google-Smtp-Source: ABdhPJz33nhhx3hiHtQkRVuwd/vWctiUv0Gv2j04kvdsJqxcs4PE+x/8Q7fjKFwAzSkc+9IflbIMbg==
X-Received: by 2002:a7b:c381:0:b0:37b:e01f:c1c0 with SMTP id
 s1-20020a7bc381000000b0037be01fc1c0mr19440875wmj.98.1652024902489; 
 Sun, 08 May 2022 08:48:22 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a05600c198800b0039429bfebebsm10511209wmq.3.2022.05.08.08.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 08:48:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 May 2022 17:45:45 +0200
Message-Id: <20220508154545.313469-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/jemalloc: bump to version 5.3.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash fie (two spaces)

https://github.com/jemalloc/jemalloc/releases/tag/5.3.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jemalloc/jemalloc.hash | 4 ++--
 package/jemalloc/jemalloc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jemalloc/jemalloc.hash b/package/jemalloc/jemalloc.hash
index 5db53d0535..214fe8062b 100644
--- a/package/jemalloc/jemalloc.hash
+++ b/package/jemalloc/jemalloc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 34330e5ce276099e2e8950d9335db5a875689a4c6a56751ef3b1d8c537f887f6  jemalloc-5.2.1.tar.bz2
-sha256 94aa2caa98c25d942f58b956c71dba6a99ff98fc3a31cbc669fe2a4cd0268b53  COPYING
+sha256  2db82d1e7119df3e71b7640219b6dfe84789bc0537983c3b7ac4f7189aecfeaa  jemalloc-5.3.0.tar.bz2
+sha256  94aa2caa98c25d942f58b956c71dba6a99ff98fc3a31cbc669fe2a4cd0268b53  COPYING
diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
index e43a4f7906..bd8a2d7654 100644
--- a/package/jemalloc/jemalloc.mk
+++ b/package/jemalloc/jemalloc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JEMALLOC_VERSION = 5.2.1
+JEMALLOC_VERSION = 5.3.0
 JEMALLOC_SOURCE = jemalloc-$(JEMALLOC_VERSION).tar.bz2
 JEMALLOC_SITE = https://github.com/jemalloc/jemalloc/releases/download/$(JEMALLOC_VERSION)
 JEMALLOC_LICENSE = BSD-2-Clause
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
