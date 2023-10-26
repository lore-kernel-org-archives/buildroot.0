Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82072C25B47
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 01:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBED1822AC;
	Thu, 26 Oct 2023 01:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBED1822AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F8Xq7stdwZJ2; Thu, 26 Oct 2023 01:53:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D829822A9;
	Thu, 26 Oct 2023 01:53:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D829822A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 24FA01BF377
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 01:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F141B4062C
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 01:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F141B4062C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jBGG_2qwbx3F for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 01:53:26 +0000 (UTC)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 455A240629
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 01:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 455A240629
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-5b837db1b26so325957a12.3
 for <buildroot@buildroot.org>; Wed, 25 Oct 2023 18:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698285205; x=1698890005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AW95CRmnV9oTtV3VAjlw9sxVFl5WBRjhlhaulkjJ30Y=;
 b=RQsx4637ukbR2Y4g0cZnoWmF7w42h1tEOka6T09xHhaLM81gfyMm4AA9GlpWbz99Su
 Qb7uuqn271Z8kdjgM+mvCk0558NW9cXhq+a6o1CMkvtGVFcmJkW8TrXANlyHwEgbPnpt
 Bx04gZjZ3eTq3YuH7WgU8On+YDIgK8cDA6JP51vyI0jkv3mAUKLtGu+gUbZPClP7O0s/
 Dt4pIhujI4L21MrV49+gQyrBfCJFS84lb3Oko5JZMDINmJt+IdakXyCdLP7eHD0gOp0M
 l67y5LWZp1UmMT8HxPE91W3nW3a8qpH5/V/Pk31d4u/10hWjqqOL+4cN5qcyUxKkOGDM
 nEAg==
X-Gm-Message-State: AOJu0YzJtteHsSqYKzyfJnlQCFRPQtk8O1pTNwXcsm98+XessQaJ192E
 1UB+wtGde4eTPT2kK+CEkBwDdab0gNkXL8ku
X-Google-Smtp-Source: AGHT+IHjce+DI5eyCtRkrsSscqcsLqz8eAZ+IhCFE33CW5cUDJbOzLEms/kmq52yD2KjMw6Ix8eYrg==
X-Received: by 2002:a17:90a:de8c:b0:27d:24d6:7343 with SMTP id
 n12-20020a17090ade8c00b0027d24d67343mr13245833pjv.19.1698285204970; 
 Wed, 25 Oct 2023 18:53:24 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 9-20020a17090a190900b002636dfcc6f5sm598996pjg.3.2023.10.25.18.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 18:53:23 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:53:10 +1000
Message-Id: <20231026015310.716044-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698285205; x=1698890005; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AW95CRmnV9oTtV3VAjlw9sxVFl5WBRjhlhaulkjJ30Y=;
 b=YRjgKoPt+hzEvkzbsE/oJFeF+2GfKrG0UDu/mH4Hqfz8XO3cMobrihigEcLd/Ju3MF
 8lt4G/zDdzC/7dbw3EPcHbo6xejNf00MmN5k+WT4pyfcxIxqjDiAspod9IVEwcwzLicO
 nDgo5TLYp8RZHHRlH6FyEYHO+OfidkGP+1mRdwo2V0bWAutv/lrmUIr1v/aY/WiV4Di9
 xOKopRQoJKQPruaFc9jXRyWBvcmGogh41Q7O40oNkH8wNnQyju8y+BQspN24a9JGCaUl
 Og/ABYK7w2HAzOse9/FyqfPIx8JHaPTl0g+s4t+9EknXjBcl07wlMYv+Ch8PxkQn3EW1
 T3iA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YRjgKoPt
Subject: [Buildroot] [PATCH] package/libspdm: bump version to 3.1.1
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 package/libspdm/libspdm.hash | 2 +-
 package/libspdm/libspdm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libspdm/libspdm.hash b/package/libspdm/libspdm.hash
index 3280ebfb88..23faba1c4b 100644
--- a/package/libspdm/libspdm.hash
+++ b/package/libspdm/libspdm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  73e0d7df3c91beeb9f61a50eaa0a44c8e32b7a62ce32ed3cab1f0fab406ed5b8  libspdm-3.1.0.tar.gz
+sha256  84d4a755f57b17775c63b5c8be646d518ce34d5d1b85994b6150ebce9d31b183  libspdm-3.1.1.tar.gz
 sha256  7dc072bff163df39209bbb63e0916f4667c2a84cf3c36ccc84ec7425bc3e4779  LICENSE.md
diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
index b216d98093..34dbb457c4 100644
--- a/package/libspdm/libspdm.mk
+++ b/package/libspdm/libspdm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSPDM_VERSION = 3.1.0
+LIBSPDM_VERSION = 3.1.1
 LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
 LIBSPDM_LICENSE = BSD-3-Clause
 LIBSPDM_LICENSE_FILES = LICENSE.md
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
