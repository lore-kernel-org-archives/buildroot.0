Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFCDCF9C72
	for <buildroot@archiver.kernel.org>; Tue, 24 Sep 2024 02:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01C2341814;
	Tue, 24 Sep 2024 02:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bAsweSTBT1eR; Tue, 24 Sep 2024 02:39:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBBAD41940
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBBAD41940;
	Tue, 24 Sep 2024 02:39:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 062691BF37A
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 02:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D159A418F7
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 02:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6UxrVPITNRgQ for <buildroot@lists.busybox.net>;
 Tue, 24 Sep 2024 02:39:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDF294188A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDF294188A
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDF294188A
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 02:39:47 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-82aa8c36eefso284921239f.3
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 19:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727145587; x=1727750387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vC8EokPRFRfoUOQRHbvqtgyk1Zgjvd0/LFsoJTe38wo=;
 b=JkvswqCESZyjClc5O+x29XKHli9XS7RYAa3iIb2Qi52vu7gJ/Gd1N2Wn4YRLIgjzas
 xj1SVZOUdJwAG8CUYov2FKs1QAlmsna5/An5Yv/zzml5xcfJYxrArp4axv5bj85hG8DT
 D42EAPTwZIpBTvzCzJg7vIWrxiaxn2eclZ6KLkLIRmJO7h3BDEg50nm8ZpFYzJj22FlQ
 Ki6qahZr/+ecZoL4VC4Z26ujDeStUvbJDDKY0tCgMNQCs3ejXeW3cgiAwkB+1iZxJ6LC
 micb1rXJIRIH+SrmK+iZFDcJ3v70byl3oT099AatCWOdTMYhICCuPOzXyyj12j/BRlzQ
 Z3kA==
X-Gm-Message-State: AOJu0YyeL4pylj0PWMl8ENebgUPE7RNJ+NAODDre/hsUwgkt+iZJg8KU
 SsunVc2pgb2MGMQsXtg/GcxnJRy3cppuTTRS3iWwMvtINN65Dxxj7WcVEQ==
X-Google-Smtp-Source: AGHT+IFOcJcEXIaAJ4RNVWOr/MUdw9PlnZmrt9zonVyCCNT6h7Tfq4seGTZkZFQZqSKGR6XS0CTTCA==
X-Received: by 2002:a05:6602:340c:b0:832:4000:fc63 with SMTP id
 ca18e2360f4ac-8324000fd17mr61556539f.16.1727145586762; 
 Mon, 23 Sep 2024 19:39:46 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8323f5eacc4sm15459339f.19.2024.09.23.19.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 19:39:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Sep 2024 20:39:18 -0600
Message-Id: <20240924023919.1502635-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240924023919.1502635-1-james.hilliard1@gmail.com>
References: <20240924023919.1502635-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727145587; x=1727750387; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vC8EokPRFRfoUOQRHbvqtgyk1Zgjvd0/LFsoJTe38wo=;
 b=l2CYsNR8soLTsGsgukpEne+9oyz27a5iR3CpmsLqiczGwboFNmzqdOEyAmyqSY7HFJ
 7zfDDGhFznLvK2bzdNgX/nbMc3at29MsiUnNgf4MEuj6hLIsW785FuZRJMMd1qsUcME0
 6mNDFrEe9ZqyFcCcqSzCVMBsH1J+we/bjH0dsi2Pg+c2qxUf6tnyuYWYyOHQB0tT/qAZ
 OT19miJDMTumm6gdFvGNJQB8hoe5IYSCo0tLaF1WBqGJ4L0KHJ+F0aEZm335HPPhcAh8
 PNIhy7/k7bwKrXxpPdCiwXruZkapfJO7jPuZWO6fQag4ouWp768E3o7gT3VBVeE3meHd
 qBGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=l2CYsNR8
Subject: [Buildroot] [PATCH v2 2/3] package/libabseil-cpp: bump to version
 20240722.0
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Christian Stewart <christian@aperture.us>,
 Robert Rose <robertroyrose@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libabseil-cpp/libabseil-cpp.hash | 2 +-
 package/libabseil-cpp/libabseil-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libabseil-cpp/libabseil-cpp.hash b/package/libabseil-cpp/libabseil-cpp.hash
index c3fc0d85e1..76f1bd0f32 100644
--- a/package/libabseil-cpp/libabseil-cpp.hash
+++ b/package/libabseil-cpp/libabseil-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  987ce98f02eefbaf930d6e38ab16aa05737234d7afbab2d5c4ea7adbe50c28ed  libabseil-cpp-20230802.1.tar.gz
+sha256  f50e5ac311a81382da7fa75b97310e4b9006474f9560ac46f54a9967f07d4ae3  libabseil-cpp-20240722.0.tar.gz
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE
diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
index a5dfc8eb19..a27d013476 100644
--- a/package/libabseil-cpp/libabseil-cpp.mk
+++ b/package/libabseil-cpp/libabseil-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBABSEIL_CPP_VERSION = 20230802.1
+LIBABSEIL_CPP_VERSION = 20240722.0
 LIBABSEIL_CPP_SITE = $(call github,abseil,abseil-cpp,$(LIBABSEIL_CPP_VERSION))
 LIBABSEIL_CPP_LICENSE = Apache-2.0
 LIBABSEIL_CPP_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
