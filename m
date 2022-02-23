Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D4DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 20:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BECB60FC8;
	Wed, 23 Feb 2022 20:27:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SuY6yiH8e7MM; Wed, 23 Feb 2022 20:27:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D26260FC1;
	Wed, 23 Feb 2022 20:27:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8315B1BF5AA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D87382983
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PyTLjD46ImvP for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 20:27:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AEE980CF2
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 20:27:05 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id l13so520830wrt.2
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 12:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/LS2A+LeVXI1qOsx4XPVFUT7pLfGDBEbIRxml0Jdc8I=;
 b=L6q5NBjyD8tdWwF/Dt45xdKWWZWCkjlrQeZqsm+hNNQFLhW6jMieBJIQm762daM0kP
 s0DBIz8CJqRFUm+z/y4iouUZ0lpRb47SBHM1qXFXrxH0UBXkhSstyac9PVcHTJzbaZwy
 eOsr+jpa4kmkS+k4xZo37ruS+cf6IcuryWURDxHrlXGM28rj24nrY18hsueVtslR84Q/
 vP9hLodibc8hEKrf+hTJ/TmGRvUCyxJfHm+9r8NG8O+GuQrK+ObBJZP/fOkVivRdrqVk
 sEMCIXv+O8CgX29ePO1dSOkVjzP1PoCb3MSFCe9KmhqD6ipBKA3cFhIllD1OnCv6p3b7
 H8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/LS2A+LeVXI1qOsx4XPVFUT7pLfGDBEbIRxml0Jdc8I=;
 b=Qc8fHRapcFaKTvuUgwVG8BxSEt8ZW1Xa1la7CVCMug61F7dywL1OSc1fkGB1Mcg6hp
 tNI7MQU/GKLau416ql8clMojSd4ChyPFsteDnvh9wTNUodTPvvXNj5YKVsmzq+abOS+V
 6oSmIMBdcGHv5KXxPCfdSaj1G5RgbIkhJhcSOy9MFQaOn4GudnY5a2Vm1BbkprZAXfaf
 DaOsZEb+pvlgDnWPz9fHr0WWKcLUzj07+Nf9ZKGL2sLYi3UhkIvLZg4GYY5yRZafn0+f
 Yech7H4J3vN1HefbZ3L6f6LP258TJdclcF+xk/+dJX8G2ncSCUXmN+W6HY/lwAZIz1GO
 VwQg==
X-Gm-Message-State: AOAM531lsKTE+UWP3oyq/GeyckaX9b9AOo46csqoPXeXjJmLVvgx+o7z
 Bf/VWCCMQJiq7orwqff0VedlVYrZ6N0=
X-Google-Smtp-Source: ABdhPJyyQNJWzg2YfENjPP8/JZqk7WDqMXnHbN25r4doyUB38kz8usnhe1Pg1h295AeNBbmRU1wHBg==
X-Received: by 2002:a5d:64aa:0:b0:1ea:8265:9740 with SMTP id
 m10-20020a5d64aa000000b001ea82659740mr1007208wrp.572.1645648023166; 
 Wed, 23 Feb 2022 12:27:03 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id u14sm673992wmq.41.2022.02.23.12.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 12:27:02 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 21:26:48 +0100
Message-Id: <20220223202648.3398307-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3,
 1/1] package/ghostscript: disable tesseract without threads
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

ghostscript embeds a local copy of tesseract-ocr which is enabled by
default since version 9.53.0 and
https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=7322ef87546c55b29056c1d96d8bdbb7f3ba53ef

Since version 9.55.0 and
https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=5459f7aca1ded3b7cf96c339a2419f418aa406c7,
ghostscript expects that tesseract is disabled if threads are not
available resulting in the following build failure since commit
7a4944569ce83b0b7b0cabd6e8aa184b8cb72a22:

configure: error: Threading disabled or not available. Tesseract OCR relies on threading. Rerun configure with "--without-tesseract" to exclude OCR from the build

So disable tesseract if threads are not available. It should be noted
that there is no way to tell ghostscript to use a system provided
tesseract-ocr package.

Fixes:
 - http://autobuild.buildroot.org/results/fd35a47b2a77cf57c243ec1c88802b53ddca8f52

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after review of Arnout Vandecappelle):
 - Only disable tesseract without threads

Changes v1 -> v2:
 - Unconditionally disable tesseract

 package/ghostscript/ghostscript.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 24a0c489a8..02cb35fcfc 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -83,4 +83,8 @@ else
 GHOSTSCRIPT_CONF_OPTS += --without-x
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+GHOSTSCRIPT_CONF_OPTS += --without-tesseract
+endif
+
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
