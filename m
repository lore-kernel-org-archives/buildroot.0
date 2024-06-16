Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5297BC27C53
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 14:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB29F40177;
	Sun, 16 Jun 2024 14:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cz-H7ifq-wSw; Sun, 16 Jun 2024 14:10:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4B26401F3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4B26401F3;
	Sun, 16 Jun 2024 14:10:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 448F81BF2C1
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 14:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E59B440414
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 14:10:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IcTkYhfB_0mI for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 14:10:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 640A2401F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 640A2401F3
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 640A2401F3
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 14:10:47 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-421a1b834acso30524805e9.3
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 07:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718547045; x=1719151845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=79pDCg6c0VjtJPvqqZJjYP0pbrtk1xC+aNEHPuNiKN0=;
 b=gqBvUgVshVpXuzex2hZJ2b4nmNl9DVjl5nLmb+iZdBD328gcN4l6palKiKSuX2as0r
 XEctmeDzoC1dm1mkmNxYtdtlOJQrj99jz3oHwIomriwQs38RkpDP5FC8eo7aMPmYXqn6
 LsrnzaNbkd80Cm45EbnjSCuoZP675hmTdPnIWFUUBIme3G/poAyXwXf4sBYIbX+fp+k5
 Jy7kAduz7S177o6mOy3S9cOEH5ycLqL0/5PzsreBLRt1tVOVxz/2tB31iqWAdwMR+PaV
 97HbkeJxWvLqHPPs/EAMQCpuN2HY652MWj5SDWvd5hdp5kFmMcYPBDHUS7HxvIdgx+Ci
 jHWA==
X-Gm-Message-State: AOJu0YzRsrRlVr/tMXeKaSf5uOTgECOMCVNEVQXVCBHpIHcx4kNzOK0Y
 IKew/i5hZOq4sBPSWd42riRXPSTobiDrOT3SZkGJrT5WZtj70eW9MgClhA==
X-Google-Smtp-Source: AGHT+IEw5oGqMqupONNKxxUduTZljMNrG2JUCYSvQz4jQh45ZS7jAUW1oJSxZbg2D/JIYSekZYFisw==
X-Received: by 2002:a05:600c:154e:b0:421:aace:7aa9 with SMTP id
 5b1f17b1804b1-42304827c18mr52454355e9.9.1718547045014; 
 Sun, 16 Jun 2024 07:10:45 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4246a2db4fbsm4421575e9.5.2024.06.16.07.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jun 2024 07:10:44 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Jun 2024 16:10:42 +0200
Message-ID: <20240616141043.2775083-2-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240616141043.2775083-1-yann.morin.1998@free.fr>
References: <20240616141043.2775083-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718547045; x=1719151845; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=79pDCg6c0VjtJPvqqZJjYP0pbrtk1xC+aNEHPuNiKN0=;
 b=Z26vPEFQ2HjpOKnsAF7baUm/QUyJ6+0zWajORkOIwDi+FYjP77TOgxyFqV6YJMvMzM
 s37sg0juZPMbn6Y7vY+v0Oj4pO3kLJTUwlTfTynIpYVBxNFlqG9A0ubFU+ehkTl+SvBk
 kfkLhmG6Su1XzBSXebmLUzaR7u9YTGuS4HPhF+fGuY9LZQAQWtXzFY73IFdeSXjByxBk
 +08nBuH7cUo766/qIEb+S/TjoXyJl0ynGXiWjjrIvk8nkKKrcO4vqoJGq8i7W0hUsEDD
 XwQb78yTud5fs+RFjMU82f/z3iPlGet3HQPJVSY6pob4Mhhlk4Cu26pNsdiBpRDfC3bi
 pikA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Z26vPEFQ
Subject: [Buildroot] [PATCH 2/3] board/chromebook-snow: force checking hashes
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The chromebook-snow config uses a custom kernel version, so add a hash
for it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Alex Suykov <alex.suykov@gmail.com>
---
 board/chromebook/snow/patches/linux-headers/linux-headers.hash | 1 +
 board/chromebook/snow/patches/linux/linux.hash                 | 2 ++
 configs/chromebook_snow_defconfig                              | 1 +
 3 files changed, 4 insertions(+)
 create mode 120000 board/chromebook/snow/patches/linux-headers/linux-headers.hash
 create mode 100644 board/chromebook/snow/patches/linux/linux.hash

diff --git a/board/chromebook/snow/patches/linux-headers/linux-headers.hash b/board/chromebook/snow/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/chromebook/snow/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/chromebook/snow/patches/linux/linux.hash b/board/chromebook/snow/patches/linux/linux.hash
new file mode 100644
index 0000000000..1064af46aa
--- /dev/null
+++ b/board/chromebook/snow/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Localy computed
+sha256  5a26478906d5005f4f809402e981518d2b8844949199f60c4b6e1f986ca2a769  linux-4.15.tar.xz
diff --git a/configs/chromebook_snow_defconfig b/configs/chromebook_snow_defconfig
index 50e355647c..9a5bcce98b 100644
--- a/configs/chromebook_snow_defconfig
+++ b/configs/chromebook_snow_defconfig
@@ -2,6 +2,7 @@ BR2_arm=y
 BR2_cortex_a15=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
 BR2_GLOBAL_PATCH_DIR="board/chromebook/snow/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_GENERIC_GETTY_TERM="linux"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/chromebook/snow/sign.sh"
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
