Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B80CC6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 09:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E16ED61078;
	Tue, 14 Mar 2023 09:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E16ED61078
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Fu5yQLfr9Dh; Tue, 14 Mar 2023 09:53:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2409361073;
	Tue, 14 Mar 2023 09:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2409361073
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC5931BF3EB
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 09:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86E366105A
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 09:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86E366105A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1N6_j3CJQpwu for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 09:52:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 004DA61057
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 004DA61057
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 09:52:56 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so19788871pjb.3
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 02:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678787576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j/Q+6/KVpkIYsTaq3AcffTMZ1DH3nnoXA8NoQS5zmm8=;
 b=NGtvEdI89qDfiuh9b5DGthP9bJdxcn+urFv9ybkkoee+RH19vhK61FOwjlBI2xNDi+
 BaOtszDS0A7QSb5uagJ/dmlrlW9J2YUkO2HgFEfhJalIWfvyEjnoVKQL7nyXpnjyIBiV
 JGvLFXeMOAmdRLKDcfm9SAHIZVbrTT5E5Zs55mbgXuwi6ZDtdhKqd2PNvQpAZM2AMieq
 QtIkrDgZK3GzqZCR+M8ya/DYGpEauwAr2HFpDE7G1ybL/5DaGsLLUOfOeGP1/825eRTV
 GFk2rIVodCpF9mi7g1Blr5ur3eOP/TLHhffawGoeaSyLMnMFMqrh86A5lvz6mlHgo5IV
 fjCA==
X-Gm-Message-State: AO0yUKUpXkVGNY3ee1a5LfSt3eok9P8OYxg6pxZ/skPjdXB/m5jbX16U
 19m7h95EC3UCs1yJjXefmLTHrIeSfGE=
X-Google-Smtp-Source: AK7set94oOfi8VXjlJdLwQHHqtDUCN3Ih01Xevgtu7NzEnUHGEX8ToMKnT2ltCyIjMsae+qiEFG7nQ==
X-Received: by 2002:a17:902:7605:b0:19a:f02c:a06d with SMTP id
 k5-20020a170902760500b0019af02ca06dmr32636431pll.29.1678787576181; 
 Tue, 14 Mar 2023 02:52:56 -0700 (PDT)
Received: from debian.. (subs02-180-214-232-19.three.co.id. [180.214.232.19])
 by smtp.gmail.com with ESMTPSA id
 km8-20020a17090327c800b0019aa8149cb9sm1358783plb.79.2023.03.14.02.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 02:52:55 -0700 (PDT)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.org>
Date: Tue, 14 Mar 2023 16:52:34 +0700
Message-Id: <20230314095234.284584-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314095234.284584-1-bagasdotme@gmail.com>
References: <20230314095234.284584-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678787576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j/Q+6/KVpkIYsTaq3AcffTMZ1DH3nnoXA8NoQS5zmm8=;
 b=JdjaEEOu7QDM5srWQx2LVkZsP6nAj+wF7c7mH30SLBPk11icllHaZbPJq96NtFfp7i
 6anIwwHdZEwMeTeHjW85lL8T57FxapI4UXUycigtCChLIzUz89XT5GZTM6ILeUJPRhth
 o1JOL1Pg3l19RnrO/Lg2D/Ljjc5uEBBVV7clLv8271Jb93/2p8zsMUO5WvRUkBoTQcdP
 VR7LdgupJRymOrhNaPEF1I2iXA7xGA1Rn85kVka0/sRDu42wwphCXPEvqqTeL12xEqyj
 kV7FNyy72WcaWmyM3QC6w/p9oSKsPgZ4JffFKpdVdNBI/hC7S+TvrgB2VjJJEN9tE5PW
 ZbXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JdjaEEOu
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: Add entry for Bagas Sanjaya as
 Buildroot developer for git
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bagas is keen to maintain git package for Buildroot. However, due to
limited resources available, he can only do testing as far as
build testing. Other developers are needed to help him maintain the
package.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b49491da7a..b6d288c54f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -273,6 +273,9 @@ F:	package/orbit/
 N:	Attila Wagner <attila.wagner@onyxinsight.com>
 F:	package/python-canopen/
 
+N:	Bagas Sanjaya <bagasdotme@gmail.com>
+F:	package/git/
+
 N:	Bartosz Bilas <b.bilas@grinn-global.com>
 F:	board/stmicroelectronics/stm32mp157a-dk1/
 F:	configs/stm32mp157a_dk1_defconfig
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
