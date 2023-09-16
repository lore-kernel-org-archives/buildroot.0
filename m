Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAB4CD37B7
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 10:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD625607FF;
	Sat, 16 Sep 2023 10:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD625607FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8CtObLSTTuf1; Sat, 16 Sep 2023 10:40:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DF4B60736;
	Sat, 16 Sep 2023 10:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DF4B60736
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08BF31BF370
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 10:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D61A381FDC
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 10:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D61A381FDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eHVe78YVACaU for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 10:40:48 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 959D681FD5
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 10:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 959D681FD5
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31c8321c48fso2597783f8f.1
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 03:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694860846; x=1695465646;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y5HzD45stsXy3PVgvI2ENumcJAACa/61T+yT8eQECq4=;
 b=ZLzh1vYVKhXa+/KnoiEadtoOHm5C3U6lkxPGmLUjHy39F9ihqRcjM7zZQFImLGz2AL
 /2GKFc8uI+nS3xteGeP/9c7Zdoa72R6mIlZ/0sfa7XGslKXB2lt5wuFgUb0vPUwdMFDC
 1ZY3t884HGkhcDKepHZME3lQp8FuANkJTmqxbayMhHkKnHR3mrhqbnyBWXnQhFPaUZmz
 sgvnt5OlkQMn/g5Vn6ROSdqi9PouVND2N3bsGQwQrTNl8oofHlEEQP8I/h2yJDXQ2ED2
 SycXo7QcDKHmWPZSLKlWJpPNtxzfAVrpSysDSjCUzmerpXBSBq2hH6pLOlxqRTUdCjm+
 NypQ==
X-Gm-Message-State: AOJu0YztFrfRMtz2RClNtoCLgj2UeympO+LZhEeZMa/Tj/JOC0IbVNTf
 ToexEgwb5yhncQV8GWSCaurTVXxqNrs=
X-Google-Smtp-Source: AGHT+IEki9FAvbRT/91MPDCIhLyYAf94WgsSa02T4U7r7GE1DQqtZ50oNYldxE311Ui7YcvX4xYB8g==
X-Received: by 2002:adf:b35b:0:b0:31f:e7f9:628e with SMTP id
 k27-20020adfb35b000000b0031fe7f9628emr4959861wrd.17.1694860846044; 
 Sat, 16 Sep 2023 03:40:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 w4-20020a5d6804000000b003197efd1e7bsm6895376wru.114.2023.09.16.03.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 03:40:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 12:40:40 +0200
Message-Id: <20230916104040.315026-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694860846; x=1695465646; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y5HzD45stsXy3PVgvI2ENumcJAACa/61T+yT8eQECq4=;
 b=HTf0X/HAKN9USzZ+mrl0bIoh9SByA3mM6Nk0CpayOrQmk0+5iGQvxnQKlgTKPBPPJK
 rx5tW6WjWsQD/YsSYNcowUqHOZvsCz3ikpijkEMBqeUuDAEBQqb/PI2TyVgPr2WAOaGx
 u/YQ0WqHp2q08eGlC7pEXwlEwKAfsSeA2E5Yo40AD4J1uOvxQlTD1yld9dz7RBVm4luh
 HB59+rNP9m22DWNbNUCTQaVjPBTOL3svMiYUnXuv9uBSHmiWeutzEFnohLxnL2joMWU3
 VMxJEak9V3Ux5rLK6AD3cgAlO/bUmieGhVtWGJqI0Q1NxOyPBoDQDaWbGyNh+rZOpYv8
 nZUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HTf0X/HA
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: link with -latomic when
 needed
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since at least bump to version
0.15.04 in commit 00553ea186357fd3e2b3c89fa560e9711cc67472:

Fixes:
 - http://autobuild.buildroot.org/results/127ed4c110d99c6453a01ce221f628d40e566dc1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/stress-ng/stress-ng.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 0f204bcf79..a7b57459f1 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -20,6 +20,10 @@ ifeq ($(BR2_PACKAGE_KEYUTILS),y)
 STRESS_NG_DEPENDENCIES += keyutils
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+STRESS_NG_MAKE_FLAGS += LDFLAGS_EXTRA=-latomic
+endif
+
 define STRESS_NG_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(STRESS_NG_MAKE_FLAGS)
 endef
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
