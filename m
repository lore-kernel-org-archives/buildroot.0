Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A22EC282C6
	for <buildroot@archiver.kernel.org>; Mon,  3 Mar 2025 19:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3CDD60760;
	Mon,  3 Mar 2025 19:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UpuFOgf-CgvM; Mon,  3 Mar 2025 19:38:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F15EC60842
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F15EC60842;
	Mon,  3 Mar 2025 19:38:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 15905182
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 19:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDD2260A44
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 19:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7wBVOny4agZs for <buildroot@buildroot.org>;
 Mon,  3 Mar 2025 19:38:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com;
 envelope-from=pargue@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E26E660760
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E26E660760
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E26E660760
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 19:38:25 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-474e0bd966dso14226561cf.0
 for <buildroot@buildroot.org>; Mon, 03 Mar 2025 11:38:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741030704; x=1741635504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zLvsD27rtphkOV6oTBNMUMc2BEB6eTA4MtqKzs27zA8=;
 b=LlvpsuaSx6A7FGa80rmO920FfSQ+TTTfDRgKpmPLBU0xUQHBH3sEzzVrIZtqnXej0P
 T5yB0m4HMDhRX3OIBM97N8HTH0g0rSVDIR9YZP73/AOq6WTb3dhs8L5ysGt396dcNJCV
 /GL7UvgjTM7QI+eTcFB7Gvm90gyCG30Hw+ssh6wHTA1iZFFomsus2LoSncK7IV4bxNGD
 ZG7HZ8j0xZWueEXdTvd+znnVJpSGpyPHhSSkgKqGCuruhqjpkrRbnPs6iEQn7B6x75IC
 Z7argkhGdB5qCQNz+dJ1ryIkCtWeaDeq6A7/kmYD+WpxQBd+3GTE6IjIrbE0Chxgz6FF
 cTXw==
X-Gm-Message-State: AOJu0YwKCTeVYcXCU3OPzxi1CZ5awD6qPPYKtgsUmmDGMKXeCF6d4x5/
 i5F9x4P4cT/+1Sjo23QGEZKh66srSN4a/gEuxKyXfFfByF+CHxVIMdMETkXd
X-Gm-Gg: ASbGncsrfJlgEabqFRO+CmuyeGlD+qSkNv0lKhwZEfN7xVxK8JPqz2ngpxH9G6x0DzZ
 VNCwWFQS2khMRoX2W4jx2/mPYuQdWeCA3Js9wVeqAyXuxm17GwxDQoseGN/e7ykByOs2fyVxiwf
 Q7ALYsBeGtD9sj/0/yuD/2RCrSOoNIGHcNyKxKWbIC3jq1749bvv3hZESl5GomTTxfNm5DEDw6r
 Bw0hx2yMlIoJcLwRLJZk06cAyI6pjKiLDBalhq3oOFTOPG4LQMeSmegYDiFhz0OlIryHwNfgyVG
 t+R2r+HjIYeVTTmSFh8qnkvd44UT1GA/fStLkGGyC0A=
X-Google-Smtp-Source: AGHT+IF55oQtMUkhVTcQrrc8hbhnvy66VvQy9xmeORXXV8QWiv+P7au8zUjdhW2JLy3KDhePaGy69g==
X-Received: by 2002:ac8:5484:0:b0:474:f081:f71e with SMTP id
 d75a77b69052e-474f0821d31mr37376351cf.17.1741030704342; 
 Mon, 03 Mar 2025 11:38:24 -0800 (PST)
Received: from US38Q1RG3.. ([2601:249:4480:40b0:111e:4a69:d9c2:f00d])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-474de7bf0a3sm20572381cf.35.2025.03.03.11.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 11:38:23 -0800 (PST)
From: Paul Argue <pargue@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  3 Mar 2025 14:38:11 -0500
Message-ID: <20250303193812.2501444-2-pargue@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303193812.2501444-1-pargue@gmail.com>
References: <20250303193812.2501444-1-pargue@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741030704; x=1741635504; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zLvsD27rtphkOV6oTBNMUMc2BEB6eTA4MtqKzs27zA8=;
 b=hqk8uHG2ntH0J2Ywm1jREGP0JHeJ70hBw3K5RIWo2WHwJdZL5phA1Tldl1w0pbGmeR
 tSQcjsGVrKGpQKVRtx0dX5s3TRQeiASU6XRlDG9E9WaQyjymSkkZFTLbXmSMY4PZyz5M
 QpZw4VKJ/VyTKKCVH0kAhFLQQF3JSHswuL1hYQgoXGzqS3jtZEooJq4BymPwIurip/85
 5x5N/yflhkeg2911Tvc80+nuTZwXHsJzd1FOGZoYavighoPHwFlvvwQDwcuW2eIJCGoA
 3Rq8m0RurwPylIJ4ZkQYi7mnk9lWK4t/kgrM0BnRTkNMXZmDVt5vdhB8jGtYyca1XPZU
 79eA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hqk8uHG2
Subject: [Buildroot] [PATCH 2024.02.x 2/3] package/libxcrypt: use official
 tarball
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Paul Argue <pargue@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Use official tarball and so drop autoreconf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Paul Argue <pargue@gmail.com>
---
 package/libxcrypt/libxcrypt.hash | 4 +++-
 package/libxcrypt/libxcrypt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
index f021436b71..9bcf119077 100644
--- a/package/libxcrypt/libxcrypt.hash
+++ b/package/libxcrypt/libxcrypt.hash
@@ -1,4 +1,6 @@
+# From https://github.com/besser82/libxcrypt/releases/download/v4.4.36/libxcrypt-4.4.36.tar.xz.sha256sum
+sha256  e5e1f4caee0a01de2aee26e3138807d6d3ca2b8e67287966d1fefd65e1fd8943  libxcrypt-4.4.36.tar.xz
+
 # Locally calculated
-sha256  b979838d5f1f238869d467484793b72b8bca64c4eae696fdbba0a9e0b6c28453  libxcrypt-4.4.36.tar.gz
 sha256  f9b48b0bc67a92b752780710aa774cf08b62ec2ebaa3f4aebd00069fba6effd2  LICENSING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index 7f6c31fb02..60901988ac 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -5,11 +5,11 @@
 ################################################################################
 
 LIBXCRYPT_VERSION = 4.4.36
-LIBXCRYPT_SITE = $(call github,besser82,libxcrypt,v$(LIBXCRYPT_VERSION))
+LIBXCRYPT_SITE = https://github.com/besser82/libxcrypt/releases/download/v$(LIBXCRYPT_VERSION)
+LIBXCRYPT_SOURCE = libxcrypt-$(LIBXCRYPT_VERSION).tar.xz
 LIBXCRYPT_LICENSE = LGPL-2.1+
 LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
 LIBXCRYPT_INSTALL_STAGING = YES
-LIBXCRYPT_AUTORECONF = YES
 
 # Some warnings turn into errors with some sensitive compilers
 LIBXCRYPT_CONF_OPTS = --disable-werror
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
