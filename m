Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D78C46CA2
	for <buildroot@archiver.kernel.org>; Sat, 16 Dec 2023 16:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93F8E41761;
	Sat, 16 Dec 2023 16:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93F8E41761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3f976GdURARw; Sat, 16 Dec 2023 16:10:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1988417FC;
	Sat, 16 Dec 2023 16:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1988417FC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EEC1F1BF28A
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 16:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4EFB4177B
 for <buildroot@lists.busybox.net>; Sat, 16 Dec 2023 16:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4EFB4177B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xnqC6Kr9jtI0 for <buildroot@lists.busybox.net>;
 Sat, 16 Dec 2023 16:10:07 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EE254175A
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 16:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EE254175A
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c2bb872e2so18676395e9.3
 for <buildroot@buildroot.org>; Sat, 16 Dec 2023 08:10:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702743005; x=1703347805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0f8vHfSow3CM+vatuL8/KzJSK7T+qN+PX8WLWFWDQTc=;
 b=Huf/BDs5LwIOSIxt1tUcioxD8q45iOWDSujCjgAlB1/pg9nhWOyB+I7rkmXwvQWmq/
 xnzCqJkiSTRnuUaJGMc7eoQ7OQjza3Qbgo8YT1e4pW04wo/IWMZ7uVeJV50mFd/rqUVB
 phWixMv581COhK/jp4VlCuf6PWDwJaGTX1M1MnTX2AZ1Lr1Ls+bxkrJ1VY0qqcXOjt+R
 V/PZ2fF5SimXXuDqebTUIT5LYSqBfedygeoFJnyKDYgrkKxLoXrSK3MAzm6WDkc0XW8e
 i/JOLZztzn8Umw+iBplQJEN76Ue2gqzehWxz0RBCLrozAJnrrVMWdR0ZGV5+YwuFnG7a
 /g2Q==
X-Gm-Message-State: AOJu0YwC/oQ4MWOg5EXu4aSUSSWBGzUx3opy7G/FrIl2zKEk9MFYS9r0
 nf7k31aWnK19M/4AeFEfdRt0FVjCJqs=
X-Google-Smtp-Source: AGHT+IGhoEGcpI2IISRx9mEM5DXbd4FBNSOF5bTKjQtUcGJLhkzwUN58ptrjlV9uZp5NGEiSSuMryg==
X-Received: by 2002:a05:600c:2108:b0:40c:31e5:49b6 with SMTP id
 u8-20020a05600c210800b0040c31e549b6mr3571284wml.283.1702743005126; 
 Sat, 16 Dec 2023 08:10:05 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:4f89:5708:1633:580e])
 by smtp.gmail.com with ESMTPSA id
 k40-20020a05600c1ca800b0040b45356b72sm36319926wms.33.2023.12.16.08.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Dec 2023 08:10:04 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Dec 2023 17:09:59 +0100
Message-ID: <2cb66b4764a0dc078a1d100bb2570e1be86381bb.1702742998.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1702742998.git.yann.morin.1998@free.fr>
References: <cover.1702742998.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702743005; x=1703347805; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0f8vHfSow3CM+vatuL8/KzJSK7T+qN+PX8WLWFWDQTc=;
 b=bp/DELuFdSyHAN1eG+kmue06DG05lsUcEWbPYWD5H0Kkuz4gBafOtN5qdL7iSSUQiv
 7qdldsZG1Y5wpRcDrscGGOSlBDwgcbC+lw9FDS/sdpLLqSeSRcEW6oddjC+pV2YcFiSJ
 wFyR5xCHfw7oQ1gjifgKL8uin+l8KudEjAFPNRB99FnVJDhUfC5rP1w1JYcYxFpwTBC4
 QVillBYsH0nBPa6Q/pvLNaX93tiqyOw2Qsw5G3OfFUU59QBtgJi7YEeRFUu905/9tvo/
 u7Z/VHHciEDokaaKjQ0qIGy0r0LAeglU1m3Qifis2Q+T2NE7xo+bjFYdTXBPBB73yrRG
 5wAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bp/DELuF
Subject: [Buildroot] [PATCH 6/9] support/docker: add script to generate
 docker images
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/docker/build-all | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100755 support/docker/build-all

diff --git a/support/docker/build-all b/support/docker/build-all
new file mode 100755
index 0000000000..d5c01771cf
--- /dev/null
+++ b/support/docker/build-all
@@ -0,0 +1,17 @@
+#!/bin/sh
+set -e
+
+BR2_DOCKER_VERSION="${1}"
+
+if [ -z "${BR2_DOCKER_VERSION}" ]; then
+    printf 'Usage: %s VERSION\n' "${0}"
+    exit 1
+fi
+
+BASE_DIR="${0%/*}"
+for context_dir in "${BASE_DIR}"/*/; do \
+    distro="$(basename "${context_dir}")"
+    docker build \
+        -t "buildroot/${distro}:${BR2_DOCKER_VERSION}" \
+        "${context_dir}"
+done
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
