Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF80C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 17:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AD1A40136;
	Mon, 27 Dec 2021 17:51:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gAwnhXzLXIuF; Mon, 27 Dec 2021 17:51:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBF3B400FF;
	Mon, 27 Dec 2021 17:51:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D7A4C1BF3E1
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 17:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D56024077D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 17:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sqXX2w3K0R-N for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 17:51:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF4E0402BF
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 17:51:39 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id fq10so14357480qvb.10
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 09:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CeZBbgYdok+jIG8+/r/CCqFO+ePanUiRsNwRXYR03AE=;
 b=T00/Hd4vfXqnZR/dZkFYMAop6srKrEhAJJlGpO7SJNpm+mPAkl/bSpubjLYvHBd1tc
 Hl1A0JRGvXm/GBz5ijPcwx/WfeFTh6Z8DAW2Z/Wv2IOqk1hUiXRHoBWw6dbApJUnh3bT
 R9iSmbFAZLAAouPWtJ8VO1C8XMvnmrr/1uTferiZkAzmSJH/2/Mp2b5dK9/aGIt55TnQ
 +FyPLIG2UEE/5Yw77BFVQGoV3sUpVzNgAVDOOt7hCHOFW4pTcZM1w8m6K/6gO/g3fs4b
 C+9pfc+xotl14lWerSTHcV5XU2BT2P8EJbP6FQiYj+fOEDEoEfpQYiFLOoByQslA5/uX
 /xhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CeZBbgYdok+jIG8+/r/CCqFO+ePanUiRsNwRXYR03AE=;
 b=cGcYFXGMPKgRJAwRsvw5x3JjoqIoiGHhis8x/HNU5Rr803v5joFLVpubT/Vqip3gLb
 ue0RNoqfzpzSABeI9AvxHEXBvjlIL3LF1q3t+MholrkXJy7hGRQAgUfcWMudJknWcCdm
 M5CyvmLWYWDRejuTdHhq97A4R0FnOgPAPEsBaZVuVFXwQ/joL/EGQv33JNWpzJEmQOJy
 21oarItitBxAi8BTahH/vvZGDFZrEdv7w/KLfdANqbSj0Dm5NvTgS8w9LfagKSjejdsu
 qU38x34zWz29R7+ZbXJfOz7cM2XX2UR9nkAPSrvGgOt5e5zt7OSraC1/lVUCJaRq+vnj
 vSJw==
X-Gm-Message-State: AOAM532PRh14s2cU5+QNprr9+mHIf3NziA6UoqqO8iPYLZx3HRN12WFy
 cqKy4q6hNmXQz0RhZMftWM6UAi8jR84=
X-Google-Smtp-Source: ABdhPJzg6ZTqwwI48KbOF2Fg/JKiC4OAZsoMzkfLFixZFRvYMsYd5IqRenZDmB9v8eLhONtsn0m3QA==
X-Received: by 2002:a05:6214:1761:: with SMTP id
 et1mr15460583qvb.131.1640627498523; 
 Mon, 27 Dec 2021 09:51:38 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:8f6b:751e:ed35:8559])
 by smtp.gmail.com with ESMTPSA id
 j16sm14087862qtx.92.2021.12.27.09.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 09:51:38 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 14:51:28 -0300
Message-Id: <20211227175130.2986949-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] configs/warp7: Select
 BR2_TARGET_UBOOT_NEEDS_OPENSSL
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Select BR2_TARGET_UBOOT_NEEDS_OPENSSL to fix the following build
error:

include/image.h:1178:12: fatal error: openssl/evp.h: No such file or directory
 1178 | #  include <openssl/evp.h>
      |            ^~~~~~~~~~~~~~~

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006500
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/warp7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 830d5187c8c3..5fca9f6cfc71 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -27,6 +27,7 @@ BR2_TARGET_UBOOT_BOARDNAME="warp7"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 
 # wifi firmware for brcm43430
 BR2_PACKAGE_LINUX_FIRMWARE=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
