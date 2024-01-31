Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C845EC47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 20:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76924611CE;
	Wed, 31 Jan 2024 20:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76924611CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X-voFrSwLOEX; Wed, 31 Jan 2024 20:45:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEDF760F8F;
	Wed, 31 Jan 2024 20:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEDF760F8F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C92C51BF5A4
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 20:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A07F140160
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 20:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A07F140160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3mFs8c02sACn for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 20:45:41 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39E2E40139
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 20:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39E2E40139
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e8fec0968so2180965e9.1
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 12:45:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706733938; x=1707338738;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zpmQk/Hh9Uj9zyDTA+rdptKRobUOJnmT14/wdZcT6Ak=;
 b=n9A72vVxmBFWSPWyZ8dtw9p9UrX5A90WxKV8PL7I9tlji/aX7M+RpESncVRLct30by
 ZSVBImfRz/jikRUfSu8BYBqvZ6qk7Zm5RPtKsSrdfB3CtjDCCHlc2sHwelJuCe6FsPV8
 NxfLP4Co1KbXO9o4lPc8k+McvNb7Rx2Mm6x1AmR1bVL0MNERpnl9AIQECZBe6r6Y96Gk
 6SdUYaR/a+T2kfh5Dg4zmVts15U9cBqEmVRArbTCOHwlAU9UDEYjf26yTPq/yel68BH/
 jVzGCyht3iGqMJb3YN9XcYsICcvqSEXr9le6StZWsJPAMuoGQqGt6z1/ftkoVx/FevYw
 AdSg==
X-Gm-Message-State: AOJu0Ywx3q5YaIe37gRV8CdTM+/h+TTkeI1oZj/zSoBaXTskFtMwsVeN
 SJPpgC5U1PUWmLucmg60iOHr/ptB8Li1FOe758sFVcwvtiSsViWlM3XCABmXXyo=
X-Google-Smtp-Source: AGHT+IGojBHni47Ld75gwNg235Ay2wsbMShkaDqfHSuqeYPEe7hUZtcPHRnw8wt+IFCYCF4G0BIi4w==
X-Received: by 2002:adf:a40b:0:b0:33a:f6da:58ad with SMTP id
 d11-20020adfa40b000000b0033af6da58admr2013340wra.60.1706733938260; 
 Wed, 31 Jan 2024 12:45:38 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t8-20020adfe108000000b0033921c383b2sm14298339wrz.67.2024.01.31.12.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 12:45:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Jan 2024 21:45:24 +0100
Message-ID: <20240131204524.2098188-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706733938; x=1707338738; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zpmQk/Hh9Uj9zyDTA+rdptKRobUOJnmT14/wdZcT6Ak=;
 b=NE2/hnYu648vUI5ptYeuYGwFw8wLbacMRfotMwubLeIi289kPXgJGVgLOjJbU3+A+E
 bcyAbeJPRknLkrWlbDqvS6f0kop7rxJmfozRPUqr5ULMshGI/Z1QorpgI4nbWrSVvDY4
 RAhrfZ/Dmn3RdBK6fxkR6TLP+R+fJxGTLfN1y+B4wl4COobfBxa5+Sa43gUju9LwLiaL
 1aiMeKPhBSSE4VMnD9eYRV5KEz4XypxsW9ttd0kgfWZVJ5R1yeTvIQp0EIembbT2PNcp
 6RsgeqApONYcf3BQNWqoJVUWlP3KIoNjgq47sd6kfONC346jhkwHnG64aATrlQloilUC
 BCKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NE2/hnYu
Subject: [Buildroot] [PATCH 1/1] package/libjpeg: bump to version 9f
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

Update hash of README (changes not related to license)

https://jpegclub.org/reference/reference-sources/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libjpeg/libjpeg.hash | 4 ++--
 package/libjpeg/libjpeg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libjpeg/libjpeg.hash b/package/libjpeg/libjpeg.hash
index 1a2e82caef..5c223b4e3c 100644
--- a/package/libjpeg/libjpeg.hash
+++ b/package/libjpeg/libjpeg.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  4077d6a6a75aeb01884f708919d25934c93305e49f7e3f36db9129320e6f4f3d  jpegsrc.v9e.tar.gz
-sha256  50c1c5978d490c7f13062d91c4b89affc83774f87bc4568a714f748b62a5b216  README
+sha256  04705c110cb2469caa79fb71fba3d7bf834914706e9641a4589485c1f832565b  jpegsrc.v9f.tar.gz
+sha256  7c25493a9f64fed34d01445467341bda77bc1cdbeccbe33558659ef173fb9ff2  README
diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index caf7f05f44..2eb64e83e7 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBJPEG_VERSION = 9e
+LIBJPEG_VERSION = 9f
 LIBJPEG_SITE = http://www.ijg.org/files
 LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
 LIBJPEG_LICENSE = IJG
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
