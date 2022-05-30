Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CF0C433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 12:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EE3061163;
	Mon, 30 May 2022 12:45:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yXE2yYhSNY0M; Mon, 30 May 2022 12:45:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69B5A60AEA;
	Mon, 30 May 2022 12:45:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0C8E1BF425
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 12:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCF3E41A3D
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 12:45:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PiyjOdjccTB4 for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 12:45:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6575B41A38
 for <buildroot@buildroot.org>; Mon, 30 May 2022 12:45:01 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id q21so20656113ejm.1
 for <buildroot@buildroot.org>; Mon, 30 May 2022 05:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yB5TjSqR2TryTfkW1bfDaVhW4o8BI0UwEqrNirtGXL0=;
 b=UHFWzsdr4RVTCGmCEsQXW46bMg4KRLV8USFyZMfKhhzAQv67aq3wXckWTaZvdXpUbB
 c8rrONfEc6zIXr2nQSrRyCbNDFflzsfMfCX+ia2gUo9swPH9Ztn+7zlq4TXMfsbfjuTE
 6PmeFg+y7jZ178oW70IGSgDfHebSrizIeAoJzpQoH+9ehuNTGZXL+HUcOrxEHfdVeKwf
 NC6KzZSqVPlBA9t/nQLnii8UNYoa9CPlxBe/m54Hw0wYJ7djiTr2gShSh0G42KIoO4dg
 UVZSjnemDhHpypmIFfftv8iHFsE5uop29zvF/tPrHWo7n2GHEhFYvGtyW6P+X9DxLxwh
 RlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yB5TjSqR2TryTfkW1bfDaVhW4o8BI0UwEqrNirtGXL0=;
 b=t7fX9j/qvPyzVTfyeLR2U3V5Aun1BNjlyDm6FTD820W7RWac8H6p9vteFyZ15FzfmV
 cNAndywbkMFKlUm99TGld7cDvdsJHzr5rmJPq+6Z0LRgQav86ENJRqaRY2uId4LSFwo4
 8ABPIsX/c8kDUJIPCR0gOzFJFy500zs5wn+u564x51nhUdIrI8FuavPAijvhJ0464D/1
 xpw16YX6ME/me0mKQfjjX9aBpunLYVR4PHtO7gt42gbXap8QAfvI60oukI8FoDdi1GIE
 7QIqLmQGlcV5QSLui5Tje18mVFAyUNZRKyNGKORcQ6H+W3Lch91hJz2TtZ6jFQTJsPBh
 WbrQ==
X-Gm-Message-State: AOAM531RFZyFv+w8Il/2yHzvCg2GlVlrQGqbO3MqxXBX0IbRZl5VbWqA
 2IhualXn7dogAzurbZaLo3G+2ZGKasWEPg==
X-Google-Smtp-Source: ABdhPJxdW6wXokMGPtfSvXdgqk9LzN4gDmoZksmsvkKNDp2Oh3DKyeTreCor3ircKt48Xra1YcoFnQ==
X-Received: by 2002:a17:907:3e8e:b0:6ff:7867:8265 with SMTP id
 hs14-20020a1709073e8e00b006ff78678265mr4715112ejc.507.1653914699089; 
 Mon, 30 May 2022 05:44:59 -0700 (PDT)
Received: from 320-ntb-p0632.Speedport_W_724V_01011603_07_006
 (p5b2cdeb2.dip0.t-ipconnect.de. [91.44.222.178])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a17090632ce00b006ff045d7c9bsm4038499ejk.173.2022.05.30.05.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 05:44:58 -0700 (PDT)
From: Andrey Nechypurenko <andreynech@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 14:44:49 +0200
Message-Id: <20220530124450.19073-1-andreynech@gmail.com>
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
