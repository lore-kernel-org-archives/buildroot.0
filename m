Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AC7C433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 08:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E947F40124;
	Sat,  2 Apr 2022 08:29:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Fe2n8IXRYi5; Sat,  2 Apr 2022 08:29:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C2DF400F8;
	Sat,  2 Apr 2022 08:29:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E29081BF42C
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 08:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E124482977
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 08:28:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xImVWHDti9ir for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 08:28:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2C50827FB
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 08:28:51 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id p189so2993292wmp.3
 for <buildroot@buildroot.org>; Sat, 02 Apr 2022 01:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=avMBMKucwY1PBMXYko5GsxBbhB80/OooHPzw2Kzd8Rs=;
 b=e+VEa65X/Yc7eGzKChbFh5UY5M4IXtH/dpDwii5lpWktYaDunGpq0GGVp/Z1A66Hvs
 NJ7WNjfWRsYW9QMXMJ54pmUfA/OBmrJ+kt/UTxc7epIE8yqkiYXl1m1kwONUR/msRkqG
 NZQIVHlQvKdMi0O33AUaX+0aHqHt781wqC6/FOLk5uCTg13J4GpKy9UH3PUx7p3Vifl/
 fbTG0a/KPIxr8KQys6GYMZaDzF/axIBHA2EVStnv+fmLpFLENWJsU6wfA2mb1Fszg78c
 97qB3JtPSkR9zy6swW8QR2R4O6mHbQnvO69E6fQ+vXgukwu7LgHlgXqBIM36qk+36nWq
 79kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=avMBMKucwY1PBMXYko5GsxBbhB80/OooHPzw2Kzd8Rs=;
 b=MUALU0COH3iW7Czw7LCeUJwWCLUJwxC9lUzQpSFbAcpYtjmbcVCP/6oR5FHf/JjGpC
 wSW79s9NwuyiJ4LlPV2tb5M90o8sKXfkkX4sRI0irBXLa9AQywOscKQFvZ4BJFrCmpch
 zwBbKVMHOqNhriQJkAR8c+EIxCDxC7CUZY/wLeI5D9qvwc0tiBaz6S3a69waBXj3j4PP
 Dt0/U8UbVGvvzbco56nI6mxg05ZBTvynltajbG/EfS/huDdLvXs5gYFfmBtvWT+0kWht
 avFtzsUB0dGeKPqqZUyWR3mNXAnJSNTw1q0Q2r+IUXWv1XI/sJ/whaRuHqJt8QgJy2q4
 ej+Q==
X-Gm-Message-State: AOAM532qDHsKFI3uzaIt6kfRlCq8vrBsowhHuqYnEA4pU7Mgwymwa6MP
 ZvSWpUHsMvpd5nQj0N7HSF0Dhm/DJQA=
X-Google-Smtp-Source: ABdhPJyV5vjSm1el/fT2scrJHdO81t/ahfn+efHilvC/EBt7kNOBG4FaWUthwVgXahGrHL0jxsR38g==
X-Received: by 2002:a05:600c:25a:b0:38e:654d:35a8 with SMTP id
 26-20020a05600c025a00b0038e654d35a8mr1474866wmj.104.1648888130011; 
 Sat, 02 Apr 2022 01:28:50 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0038ca453a887sm12362123wmq.19.2022.04.02.01.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Apr 2022 01:28:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Apr 2022 10:27:15 +0200
Message-Id: <20220402082715.1497098-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220402082715.1497098-1-fontaine.fabrice@gmail.com>
References: <20220402082715.1497098-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2, 2/2] package/ipmiutil: bump to version 3.1.8
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
Cc: David Bachelart <david.bachelart@bbright.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop IPMIUTIL_TOUCH_CONFIG_H_IN as aclocal.m4 is not newer than
config.h.in anymore

https://sourceforge.net/p/ipmiutil/news/2021/11/ipmiutil-318-is-released

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ipmiutil/ipmiutil.hash | 6 +++---
 package/ipmiutil/ipmiutil.mk   | 8 +-------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/package/ipmiutil/ipmiutil.hash b/package/ipmiutil/ipmiutil.hash
index f87c2762de..c1a813ad1f 100644
--- a/package/ipmiutil/ipmiutil.hash
+++ b/package/ipmiutil/ipmiutil.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ipmiutil/files/
-md5  fab260bc834a0f3f9324a6365fc26eca  ipmiutil-3.1.7.tar.gz
-sha1  a0cd29820b15166120eb4a51e6239bfa6f9c65dd  ipmiutil-3.1.7.tar.gz
+md5  b38ef567b6bb8a24418e448f23115190  ipmiutil-3.1.8.tar.gz
+sha1  0697fc2342c55ba4374e31dcd38e58a00d1287e8  ipmiutil-3.1.8.tar.gz
 # Locally computed
-sha256  911fd6f8b33651b98863d57e678d2fc593bc43fcd2a21f5dc7d5db8f92128a9a  ipmiutil-3.1.7.tar.gz
+sha256  b14357b9723e38a19c24df2771cff63d5f15f8682cd8a5b47235044b767b1888  ipmiutil-3.1.8.tar.gz
 sha256  7e0ec8238aa1431e95a4950032a4483fe33fec3fac348eaade5856cdc5ae3e39  COPYING
diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index 97a644e314..ad9fbfc24c 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -4,19 +4,13 @@
 #
 ################################################################################
 
-IPMIUTIL_VERSION = 3.1.7
+IPMIUTIL_VERSION = 3.1.8
 IPMIUTIL_SITE = https://sourceforge.net/projects/ipmiutil/files
 IPMIUTIL_LICENSE = BSD-3-Clause
 IPMIUTIL_LICENSE_FILES = COPYING
 
 IPMIUTIL_MAKE = $(MAKE1)
 
-# aclocal.m4 is newer than config.h.in. Touch the latter to avoid autoreconf
-define IPMIUTIL_TOUCH_CONFIG_H_IN
-	touch $(@D)/config.h.in
-endef
-IPMIUTIL_PRE_CONFIGURE_HOOKS += IPMIUTIL_TOUCH_CONFIG_H_IN
-
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 # tests against distro libcrypto so it might get a false positive when
 # the openssl version is old, so force it off
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
