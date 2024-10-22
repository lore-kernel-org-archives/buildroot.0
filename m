Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8485DCDD0F4
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39B5580ACD;
	Tue, 22 Oct 2024 20:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8OQqNbQ2ZRvQ; Tue, 22 Oct 2024 20:51:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D26580AEA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D26580AEA;
	Tue, 22 Oct 2024 20:51:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 83CF059F4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6556680AF7
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NF2GaWibft9N for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:51:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 459FB80C87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 459FB80C87
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 459FB80C87
 for <buildroot@busybox.net>; Tue, 22 Oct 2024 20:51:22 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-37d4fd00574so161899f8f.0
 for <buildroot@busybox.net>; Tue, 22 Oct 2024 13:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729630280; x=1730235080;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DeD2pR/WFJ6reFmpmVVegJRQXily+EyiNUKuzH6u14U=;
 b=cCx7IqUxSV9n11nY/R5am+xu/cj0vtXrFFU3uePSzacJf1TNNWBwMEIcAyjyEqeJhG
 W25rbyxTiipYQ/6eH2wnlEebdbhQVu72im8xwxcCUB6dbtnlNZlVOmrc4EbD9KZYbgKy
 2w2Hq4nXC6CksSCZwkc+utpwT7L8vsJwf99aEvcHZefOZXN49K603spcV1qpuHtXc5F7
 LVKMwLrCvOC0b9wqg3VrAurM1nXuvOqrO941zTVmIbn78TGw0Vaogffm4MxPwjIBUatC
 8K9x/QFBzM1aTlgNoRGRnFIdA0rkuXcyF/HtesBLt5E1X5ILk34Pci/9gnWfcoHS/0gJ
 WbmQ==
X-Gm-Message-State: AOJu0YyhPvAcWfl5vMAPEICxyKbpGFYUyE9t2yNMLAnj3dhAXRsiHySR
 769P8BlmVmjfKMssrdEs41jJQ3wY35epl3bMM0mP+xINOfTycsNkETmcvB31hwey2btEd7dxqX9
 18w==
X-Google-Smtp-Source: AGHT+IGigPY3nQiaZZ1tHQdmecnfbqDHKV4weH0jhGny7vdUf2tiIrHes0KKHnzc0gyBxyRxwhyrwQ==
X-Received: by 2002:a5d:694f:0:b0:37e:f451:a05a with SMTP id
 ffacd0b85a97d-37efc653acdmr235087f8f.27.1729630280226; 
 Tue, 22 Oct 2024 13:51:20 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0b93ea6sm7407589f8f.84.2024.10.22.13.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 13:51:18 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 22 Oct 2024 22:51:14 +0200
Message-ID: <20241022205115.532158-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1729630280; x=1730235080; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DeD2pR/WFJ6reFmpmVVegJRQXily+EyiNUKuzH6u14U=;
 b=GYgpIMgu7d7RdAh/Wzjqb6lbiGUxQW4+CcnIcO0DRFJC7cZgI0SeyZc5R4nU+pR73M
 LmKZ1UvqTyCsO5fvcUyOigpnj4b+q0zVZEkEgql36hm4ospJ2ZUwqUnTn6UqUtWTWcPo
 N9Ccc6Svj8cFNNeQbeJ0VvpnEFmv+F2qzcX2pbdtuP7cUZM8K3gqf8AKcgp8tBXixI01
 vMV+1by/Nd+KRiUrKix9gcqXpA+NvSGZnYAJN0CEtQ5qBRkkUFuOAQGjymSoWIO+JeYA
 gWkTLl0iRDb6a2ehNYxnsUxMFexADVqJiCbgiH+hzIrmn4gIZqfUS9wT9RgPIpm3U4BN
 zQtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=GYgpIMgu
Subject: [Buildroot] [PATCH] package/libunistring: bump to version 1.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libunistring/libunistring.hash | 4 ++--
 package/libunistring/libunistring.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libunistring/libunistring.hash b/package/libunistring/libunistring.hash
index 256fb651d..e7fbc8541 100644
--- a/package/libunistring/libunistring.hash
+++ b/package/libunistring/libunistring.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/libunistring/libunistring-1.2.tar.xz.sig
-sha256  632bd65ed74a881ca8a0309a1001c428bd1cbd5cd7ddbf8cedcd2e65f4dcdc44  libunistring-1.2.tar.xz
+# https://ftp.gnu.org/gnu/libunistring/libunistring-1.3.tar.xz.sig
+sha256  f245786c831d25150f3dfb4317cda1acc5e3f79a5da4ad073ddca58886569527  libunistring-1.3.tar.xz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LIB
diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
index 05bdec71b..fc785c28a 100644
--- a/package/libunistring/libunistring.mk
+++ b/package/libunistring/libunistring.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNISTRING_VERSION = 1.2
+LIBUNISTRING_VERSION = 1.3
 LIBUNISTRING_SITE = $(BR2_GNU_MIRROR)/libunistring
 LIBUNISTRING_SOURCE = libunistring-$(LIBUNISTRING_VERSION).tar.xz
 LIBUNISTRING_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
