Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F64C433F5
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 14:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF106404A9;
	Tue, 29 Mar 2022 14:59:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7C_YeS7UDuTv; Tue, 29 Mar 2022 14:59:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F149B4039D;
	Tue, 29 Mar 2022 14:59:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 222121BF20B
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 14:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 102B060E7C
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 14:59:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ewCULQ6X52DB for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 14:59:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB3C760A68
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 14:59:15 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id lr4so27298271ejb.11
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 07:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yB5TjSqR2TryTfkW1bfDaVhW4o8BI0UwEqrNirtGXL0=;
 b=i5CYPjG45bsFxbg3YN6cUfmTn9cUvUvGHQbCuYVPLpQ/3piKOTc6ytTjCKv4JqOxpf
 IQVZuzbDfck2S4GGiUmBtIbjqtqlfvm0F64LJzAPaiON71MYwieOdKIAd+QeMq5EIGl5
 p4J1heSdxjQcI8WPm+7Xaa/glkvZQkCgZM3RCT3mfMFq4YGpoNDoS7l8KVanSB7z5GAy
 Ie/+U6rA1mK7QMc+b08RItIeByN37gimiUSqzHTxv81KXXLxaFiU8sQ6ruCj+/yt3/6r
 Qo7xZY77k1UL/mIQ/BdDu6YrA20kVbBYg16ksesrT6BRnO7eFZgVzATqp/qRaifgQW5z
 YKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yB5TjSqR2TryTfkW1bfDaVhW4o8BI0UwEqrNirtGXL0=;
 b=qsqF5y0llDMtrO89LgCnjorpWmdrsVCiTzvt195/yroTsfd785QecUDPE0QLaUzJK1
 FyWwtVPjkJA0sko0mMNdD9CCAeb3NL9rIz0XczKdxXpWn96gbi7gCfemy33qy0GihWC5
 tTeQT08hbOU2l5TQisEdBrEC6DqdTorLeiOnt+T/+MynugsWNbQhGzUw8qC5eEr5gXUu
 udI12ja+n+QcRWJkGYnVSb28+ReNj9PIQCd/vbwLiXYNSkNrHgHvW+gqt4bqtPqcdLzm
 xLiv2p7OLry3zQbJnMpOtRZ8astmNfpUuw/l4dDrRk0xVlJFrjtqw0coAFMVDs1YBmKH
 opuw==
X-Gm-Message-State: AOAM533G62pbyVoArUSjV4CbR1x9L3xNnSTR6Iwr3Ff9/mASR0Mz3zJS
 scYEEHLAB/stcOyNsvQqQPc6SvhZP9CeZYgH
X-Google-Smtp-Source: ABdhPJzwvV6FIZ+G+JGWq7rFb6Xe/Sn9NWOY4Wg1aH18MRj9NvWsNYxlC2RrOAGUdzaWCrVSRf9p2g==
X-Received: by 2002:a17:906:280b:b0:6ce:f3c7:688f with SMTP id
 r11-20020a170906280b00b006cef3c7688fmr34329733ejc.468.1648565953185; 
 Tue, 29 Mar 2022 07:59:13 -0700 (PDT)
Received: from localhost.localdomain (p5b2cd18d.dip0.t-ipconnect.de.
 [91.44.209.141]) by smtp.gmail.com with ESMTPSA id
 v5-20020a50c405000000b004161123bf7asm8327865edf.67.2022.03.29.07.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 07:59:12 -0700 (PDT)
From: Andrey Nechypurenko <andreynech@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 29 Mar 2022 16:59:04 +0200
Message-Id: <20220329145904.63900-1-andreynech@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/cmake: bump version to 3.22.3
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
Cc: Andrey Nechypurenko <andreynech@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 3.20 is the first one where the following issue is fixed:
https://gitlab.kitware.com/cmake/cmake/-/issues/18299
Was affected by this bug and decide to bump the version to the
latest stable
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index da514a6d6b..1749db8c27 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.18/cmake-3.18.6-SHA-256.txt
-sha256  124f571ab70332da97a173cb794dfa09a5b20ccbb80a08e56570a500f47b6600  cmake-3.18.6.tar.gz
+# From https://cmake.org/files/v3.22/cmake-3.22.3-SHA-256.txt
+sha256  9f8469166f94553b6978a16ee29227ec49a2eb5ceb608275dec40d8ae0d1b5a0  cmake-3.22.3.tar.gz
 
 # Locally calculated
 sha256  131b9ff756b64a25b7461c3c1382e70b16c70a5b4833a1577897fa3ea6d88f8d  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 4177b119ab..053658fad6 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CMAKE_VERSION_MAJOR = 3.18
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).6
+CMAKE_VERSION_MAJOR = 3.22
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
