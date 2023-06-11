Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC48C7EE23
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 13:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FB484052A;
	Sun, 11 Jun 2023 13:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FB484052A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WJLPr_mzWx9o; Sun, 11 Jun 2023 13:16:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 498AA4034B;
	Sun, 11 Jun 2023 13:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 498AA4034B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C002B1BF2A3
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 13:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A60EF83486
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 13:16:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A60EF83486
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Aw6X7n2SNccu for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 13:16:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A5368183D
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A5368183D
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 13:16:37 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-30fbac9639fso568059f8f.1
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 06:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686489396; x=1689081396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vJI0RAXnQQrBm9E4ZQrzRI+7GZ02rmWAwTp01hQZV6Q=;
 b=lS6h7uEREuv9wJvKrDZXA7NZ1axhY4nLl6x8M8orHDRc6Cfzc9HoHpj3B7lRqELjW7
 n5OjBv/bi2dyRsu42wfmxVKBNtDwyHNiKw8P963sWaCEa2HGRx4OPGvyaT1pfqQZibQP
 etDHX/wxKNt5NFRpksVGxMyQxIH6+txB3s5yDh4q6siCc508Y7NvmKgIG5phPXReLc6a
 Rw86qiTcitDW6vygVah+PA6Cm2ngUI5sxYIotdMzV8C22mAqDvaHYp5ncTiyAFvJ80Fw
 mdUfVVZH2jGZQfuj7hpTVjCHKQUP8ra4TYoUiM1EbSAitolM37PJL8jk4UEHql4PG+RT
 Pp3w==
X-Gm-Message-State: AC+VfDz5aXRFO2gmmR2EMBbs0PHrOiq0UzUN+QUw3Jp5fiW1PVm3zFDU
 H/5fgBFt1qOxEFpovooHSLlWQ+J80OY=
X-Google-Smtp-Source: ACHHUZ4tZ83dDm+l/7cBXWEatxkVTT9OJQNFiZPaZQxS1W1lzSu+mWh1cSiLtYjolx7r17iEqR9DtA==
X-Received: by 2002:a5d:4ecf:0:b0:30d:2184:84c0 with SMTP id
 s15-20020a5d4ecf000000b0030d218484c0mr3079919wrv.30.1686489396063; 
 Sun, 11 Jun 2023 06:16:36 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a5d4d4a000000b0030fc079b7f3sm747585wru.73.2023.06.11.06.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 06:16:35 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 15:16:28 +0200
Message-Id: <20230611131631.806432-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230611131631.806432-1-romain.naour@gmail.com>
References: <20230611131631.806432-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686489396; x=1689081396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vJI0RAXnQQrBm9E4ZQrzRI+7GZ02rmWAwTp01hQZV6Q=;
 b=FogW+aJmGrfUVfyTj7+Qjqju0cgWRNdiWxZe+eN9fVPnMgD38Y6KKs6gWWRe1zknjy
 q9PCAq7P95ARZLMFjwe7GnjZrOMtNT9sz7YM3falT7qhS1K6nR6n5x/nHkrFEGPuUvpf
 62evkbIOOaBwAQsbqm9mbnEeVmPTZJnaF2RENPmHLXkSgr3mHgT7a7AA5buxNMYL0lxZ
 91mZBzeSsB8921WbKJG8v9Xi7bzHziGoWhG7/FqsIFuKOP2K6br4LyVDB6Iqso1BgkMt
 O+/2KDij1zMRl5tV5WMRGv8i+DFWsS16FvarIjqSQOhxT2aCaBYlXAZhqfyQcVovosFL
 Of8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=FogW+aJm
Subject: [Buildroot] [PATCH 2/5] package/{binutils,
 gdb}: switch to https urls for archives hashes
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

FTP urls doesn't work anymore with Firefox [1] and Google Chrome [2],
switch to https urls.

[1] https://blog.mozilla.org/addons/2020/04/13/what-to-expect-for-the-upcoming-deprecation-of-ftp-in-firefox/
[2] https://chromestatus.com/feature/6246151319715840

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/binutils/binutils.hash | 2 +-
 package/gdb/gdb.hash           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 1a8574de92..5d45813b5a 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -1,4 +1,4 @@
-# From ftp://gcc.gnu.org/pub/binutils/releases/sha512.sum
+# From https://gcc.gnu.org/pub/binutils/releases/sha512.sum
 sha512  5c11aeef6935860a6819ed3a3c93371f052e52b4bdc5033da36037c1544d013b7f12cb8d561ec954fe7469a68f1b66f1a3cd53d5a3af7293635a90d69edd15e7  binutils-2.37.tar.xz
 sha512  8bf0b0d193c9c010e0518ee2b2e5a830898af206510992483b427477ed178396cd210235e85fd7bd99a96fc6d5eedbeccbd48317a10f752b7336ada8b2bb826d  binutils-2.38.tar.xz
 sha512  68e038f339a8c21faa19a57bbc447a51c817f47c2e06d740847c6e9cc3396c025d35d5369fa8c3f8b70414757c89f0e577939ddc0d70f283182504920f53b0a3  binutils-2.39.tar.xz
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 04c7d02d2f..36e2685a25 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -1,4 +1,4 @@
-# From ftp://gcc.gnu.org/pub/gdb/releases/sha512.sum
+# From https://gcc.gnu.org/pub/gdb/releases/sha512.sum
 sha512  3653762ac008e065c37cd641653184c9ff7ce51ee2222ade1122bec9d6cc64dffd4fb74888ef11ac1942064a08910e96b7865112ad37f4602eb0a16bed074caa  gdb-10.2.tar.xz
 sha512  07e9026423438049b11f4f784d57401ece4e940570f613bd6958b3714fe7fbc2c048470bcce3e7d7d9f93331cdf3881d30dcc964cb113a071143a02b28e5b127  gdb-11.2.tar.xz
 sha512  425568d2e84672177d0fb87b1ad7daafdde097648d605e30cf0656970f66adc6a82ca2d83375ea4be583e9683a340e5bfdf5819668ddf66728200141ae50ff2d  gdb-12.1.tar.xz
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
