Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C16C433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 13:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F7314026A;
	Sat, 30 Apr 2022 13:31:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t7nvGG8V7Myz; Sat, 30 Apr 2022 13:31:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 081BE401AE;
	Sat, 30 Apr 2022 13:31:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E293D1BF403
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 13:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFABB8407D
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 13:31:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q-3l756-5-iA for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 13:31:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F070383FF9
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 13:31:01 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id bv19so20173706ejb.6
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 06:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U/FS2D+jqvyj/EJs/tC0aVO9oM4u20R+ULRLpHSyR6Q=;
 b=BhglGc9r6MdOdSdrxn68ZhycXQwlR+9UTowXuvssXzyQT29mU2y8j4HeCiYDwcPoi8
 BuKk3Hvcq7jjhJv/GBIWcER0mtjjmveSkBhK/PcrGFb3Roluw1ewBMsbqb2CZeQ4pT66
 kM9yVc7rANXT01VfDTO8ZbwTvR2a0p5wrHidy5q7in2ml3Oem5R+6lpWGOBni1n44Xsx
 CsNrD6Ec/KtLesVJe1vC5SNosiXW9LfPG88rhxkxntQd7jjBPv7UbWWvrZNOP1P8xBrT
 TBzWM9H2RsraxcvjRpeEKUdVA2Ff2f7Y5wmKrYaElxs9Pn67xLqMXOUr28pwOdQSkp4v
 hLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U/FS2D+jqvyj/EJs/tC0aVO9oM4u20R+ULRLpHSyR6Q=;
 b=Nh8TpyOKItib99QWSUZfxPTZ1ue0BZYYcfVq36PZ6KxHJOhWLTmu8FfF7aypQqyw4k
 epGRjvJKkAVdPUJVfdwZIYMqCj2xv6DRTNW2i9od3mN/b4+8DWpl4IF7/J658SP/LJ/l
 NtANXYkTg4dlxKA0crrn2Wov7ZhQ5o8CVcVX+NRTLSzXlHiwOoWUD9tEYTArPeRzUBHa
 7OF5lYJNtYrLx9YNLCu/Em+1FdVA1HfMvhXg48/7phOtplrv6H7eFK1o0IEOrXhS/hzl
 EplShnP4u7WxTZOGpagQWWZ9VF/YERtvzJ4Oe9+/84s6mfJ/6jWSlRvmi8L6cUJtTVrn
 Iw/g==
X-Gm-Message-State: AOAM530j1+aFXAZH8mNStEa/wVUix0G7SckyhI5tU1U+zm6iW13tBO6A
 EXBOqp2KEy6YTr1svWuobhEk9SePdHL+aA==
X-Google-Smtp-Source: ABdhPJyG0pQ5ABnRS7HKSmB8Dxhwxpqp3xmDPJ32+BIeamdiZRMmuKCfwmZKb2DUMCDt3ISri6glgQ==
X-Received: by 2002:a17:906:a05a:b0:6ef:a44d:2f46 with SMTP id
 bg26-20020a170906a05a00b006efa44d2f46mr3849245ejb.192.1651325460011; 
 Sat, 30 Apr 2022 06:31:00 -0700 (PDT)
Received: from LinkTed.fritz.box ([2a02:8070:41a4:2c00:b6c6:fe17:60a3:53ae])
 by smtp.gmail.com with ESMTPSA id
 p21-20020aa7c895000000b0042617ba638dsm4054471eds.23.2022.04.30.06.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:30:59 -0700 (PDT)
X-Google-Original-From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 15:30:50 +0200
Message-Id: <20220430133050.19519-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libcap: bump to version 2.64
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
From: Raphael Pavlidis via buildroot <buildroot@buildroot.org>
Reply-To: Raphael Pavlidis <raphael.pavlidis@googlemail.com>
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://sites.google.com/site/fullycapable/release-notes-for-libcap#h.e8k97s2ae0nc

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 package/libcap/libcap.hash | 2 +-
 package/libcap/libcap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index 2cdf92bbc1..7c48cd950b 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,5 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256  0c637b8f44fc7d8627787e9cf57f15ac06c1ddccb53e41feec5496be3466f77f  libcap-2.63.tar.xz
+sha256  c8465e1f0b068d5fc06199231135ccac7adb56d662b1de93589252e8cd071e13  libcap-2.64.tar.xz
 
 # Hash for license file:
 sha256  f58c80bcce8c929db39a23c32e924876e3311f3ffa54f66076c38056d38fa59b  License
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index ed689ce503..91e02638e2 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.63
+LIBCAP_VERSION = 2.64
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
