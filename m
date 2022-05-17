Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377FCC433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 06:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2131605A6;
	Tue, 17 May 2022 06:36:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vsr21m7mKJtX; Tue, 17 May 2022 06:36:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2DD660595;
	Tue, 17 May 2022 06:36:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 27FCB1BF309
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 06:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C2B541917
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 06:36:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uB7ytXd3H_MC for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 06:36:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98F9A41508
 for <buildroot@buildroot.org>; Tue, 17 May 2022 06:36:44 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id b18so29531919lfv.9
 for <buildroot@buildroot.org>; Mon, 16 May 2022 23:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version:organization
 :content-transfer-encoding;
 bh=n8aEqcxJyl8Shy6KNl1YTTSOO6A60RoMZYmsA5nPpGw=;
 b=Lq30XxXo8c5zQWNLrQoKbN27H0vEnKLF6lJDIIemfww/QExFcuSjyUnNw2CgKLc5aI
 hla/yq73hNeFGP+zDUV7iSB/4cIxjtvrZvWq7/RumLdXsu2A8kBzh9UwAmgKKFgnY4S5
 HIOQEobQ1cPGCgGd4y+MvSBiXiIs1KRfuDmYS2rSRDxVrwWRaC+xOaSmGblG5jE9rBZq
 c0Vw79zDbq+QFjtYbkyn2QhV00lDPzGBA5CbhOEzOGCjbQqTHklmtX/cjv9oURgQB+/8
 jPzKEtMdrCgP3ZIHagBMXbgIe4NzuDcO4itHXxRogRd72BNVeGg2cF0sNIOU1nu8v4hO
 24SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :organization:content-transfer-encoding;
 bh=n8aEqcxJyl8Shy6KNl1YTTSOO6A60RoMZYmsA5nPpGw=;
 b=PMt65FwjSc2XNYmtVzgLUOXhxdcCfAK6S9maEzWf78kcJTkx7Ho8h0NEn5OSazWstm
 n4iqZbPqZBy/hbBKa+kCK56WuQHWgwFffJhGZR6MfjAZRnQUMNH2BrURY1eQSTE2DyB8
 sMP3Ix2Ul9RhQ6Z31Geuv0ZI/KyS3UXgZzB6me04SDNbyAgLUTKtIT+lh9e8Klnz32Y6
 rQ4Svz5maCjvEDSY95SEHvs2hxKM8ZCE+BbvyyhaoSn0z5GR0Fl9rPjd/3s6ViIrKirw
 qbyUwWPVRxvH/LogY0+rNGYh6Kk3i+jr2Jf3PuC7yl/I0u4LJaGYYBMIgi24FjANR/Mk
 3icw==
X-Gm-Message-State: AOAM533kZZycXgbGBxK3JQ19fgN4N1NZwcRcl8p217yQZfyAn7sjtDNG
 0CcJSUr/gcNJPISas2KIJoioBNE9ZwM=
X-Google-Smtp-Source: ABdhPJzn4qE280NPygZqTzD0pP48E4xTDl5dxCLnhPU/g5ekPmJ+TkuCOppECyfT0DhIXCd804CcfQ==
X-Received: by 2002:a05:6512:4d0:b0:472:1941:fea9 with SMTP id
 w16-20020a05651204d000b004721941fea9mr15691197lfq.57.1652769402147; 
 Mon, 16 May 2022 23:36:42 -0700 (PDT)
Received: from gimli.addiva.ad (a124.broadband3.quicknet.se. [46.17.184.124])
 by smtp.gmail.com with ESMTPSA id
 27-20020ac25f5b000000b0047255d210desm1500514lfz.13.2022.05.16.23.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 23:36:41 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 08:36:36 +0200
Message-Id: <20220517063636.858401-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Organization: Addiva Elektronik
Subject: [Buildroot] [PATCH 1/1] package/libite: bump version to v2.5.2
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes:
 - Add printf format attribute hint to all vararg functions. This will
   help users of these functions by telling CC what to look for

Fixes:
 - Fix fisdir() segfault on GNU/Hurd
 - Fix touch() on Debian/kFreeBSD, use creat() instad of mknod()

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/libite/libite.hash | 2 +-
 package/libite/libite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libite/libite.hash b/package/libite/libite.hash
index 1dec65bd6b..8b622d87a9 100644
--- a/package/libite/libite.hash
+++ b/package/libite/libite.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  5278fa0ca933727c78f4e05082cea58256d9302afac30bad0c3760cf2a18ef8f  libite-2.5.1.tar.xz
+sha256  baa9bf9931427ef5e9ddfc5b72139981047a8d0d3c03a534d9716de38cf18bb5  libite-2.5.2.tar.xz
 
 # Locally calculated
 sha256  20db0601195f708d68ff7907907b3cd3b25808efa8332e064b11f00c839a5d2f  LICENSE
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
index 185ffe77de..66a8253c62 100644
--- a/package/libite/libite.mk
+++ b/package/libite/libite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBITE_VERSION = 2.5.1
+LIBITE_VERSION = 2.5.2
 LIBITE_SOURCE = libite-$(LIBITE_VERSION).tar.xz
 LIBITE_SITE = https://github.com/troglobit/libite/releases/download/v$(LIBITE_VERSION)
 LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
