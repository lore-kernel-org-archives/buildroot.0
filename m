Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E0AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 22:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B15866114C;
	Mon, 16 May 2022 22:07:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gcJ_uYoyy5M5; Mon, 16 May 2022 22:07:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE7AD6113F;
	Mon, 16 May 2022 22:07:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9EF7B1BF2CF
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 22:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86A5340119
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 22:07:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 99sqOeYaofDD for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 22:07:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA15A4010C
 for <buildroot@buildroot.org>; Mon, 16 May 2022 22:07:01 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id e194so17478205iof.11
 for <buildroot@buildroot.org>; Mon, 16 May 2022 15:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E0opGtmqho2n4XpQm6XvZlDk09TNDjfu3kSt50gXTY8=;
 b=aZMEMCvwY5yKJMRuNz766enfHTV7o0lE8/PFlehct6I0vdkWMwupA8UBCqqhX97FxX
 d1fnd6VLfOAKxzDzLnal2g/ylnqYaFAfzNZkg168smyNTewoJESZIlnHgKlc98ta+IlE
 WvjCPfMXw2MEL+6fBl0o/L8z7Mhc0+zt1QQhhm04QXnyvoaeF2a73UIbMx3NPP0ldn/K
 /4QhCoPZyc+5hVeaxeAL5nLiHDdDUvxftatKrxKuP/DK8j2TFVdG6hvrHV9pPjdYSt7v
 DhYCNaxlxiSSDelY4UjmMerfvmBVqGwN9J/g2rscZz2csA7BBAhxrwVhDpUssnh9NJKY
 jb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E0opGtmqho2n4XpQm6XvZlDk09TNDjfu3kSt50gXTY8=;
 b=HaAOtikKGfrlm+SR4uIpWtliKusUC5XQJu0EkDA84u1OnZm2uXm/M4QjfYT8a2v2CR
 1Ec53yOSzPraqrAoxFX7bfy8FtdY4KFy8VikuxPfgneLTj0zEqU19lkzu8TYKynGAsYl
 IFmaQYk4+n7StvUzshTCJbQdH//GWg5stk1ArwCYFo4B4IQ2tyDa1XI4DWmGDpOCLt6+
 FTONxeygEL9C0BcBnCWVBDJyfr7loPVQm8ex/a90hzF1FixJACjuts7tOgte5nJtXL5K
 /3ElSkuVmUGObBpqMN2a3cgpIHGRwbM+HNhrpr2DQxiVVcwalaKl8f73f3Y6VENq77eq
 Ercg==
X-Gm-Message-State: AOAM530IWsTWK6iuJCUDXeIcVrbruiv8gQixXn7BT3SJZ1WKMpdE7nQf
 7WvuY0Mf1x00ROFdnlwX82Yyu/9yWHc=
X-Google-Smtp-Source: ABdhPJz4XkNLA1PhmfSatOunPEC7RmIXKqfAJVEpUCGqGcKiJyH0PKTnwh76nkLZWLaJTFqs1p01hw==
X-Received: by 2002:a02:b186:0:b0:32e:222b:ff with SMTP id
 t6-20020a02b186000000b0032e222b00ffmr4926250jah.310.1652738820351; 
 Mon, 16 May 2022 15:07:00 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 e46-20020a02212e000000b0032b3a7817aesm3089756jaa.114.2022.05.16.15.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:06:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 16:06:57 -0600
Message-Id: <20220516220657.1931395-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libbpf: bump to version 0.8.0
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
Cc: Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to year/owner addition:
https://github.com/libbpf/libbpf/commit/9c44c8a8e01cf86bc801c3b72324358d5ea99e50

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libbpf/libbpf.hash | 4 ++--
 package/libbpf/libbpf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libbpf/libbpf.hash b/package/libbpf/libbpf.hash
index 06adc09885..23908ded7c 100644
--- a/package/libbpf/libbpf.hash
+++ b/package/libbpf/libbpf.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  5083588ce5a3a620e395ee1e596af77b4ec5771ffc71cff2af49dfee38c06361  libbpf-0.7.0.tar.gz
+sha256  f4480242651a93c101ece320030f6b2b9b437f622f807719c13cb32569a6d65a  libbpf-0.8.0.tar.gz
 sha256  847f4addbd56e2d5be20c4ea0845e972672fc07b755fadaae5f7abd35d71e349  LICENSE
-sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
+sha256  e1638b9a0c68ca90fad3df1d6b4e430804d2fbdc15e58d02cffddfae38953bbf  LICENSE.BSD-2-Clause
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSE.LGPL-2.1
diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index f50a82b581..987d1145f1 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBPF_VERSION = 0.7.0
+LIBBPF_VERSION = 0.8.0
 LIBBPF_SITE = $(call github,libbpf,libbpf,v$(LIBBPF_VERSION))
 LIBBPF_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
 LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LGPL-2.1
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
