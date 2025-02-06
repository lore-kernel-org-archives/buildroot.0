Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B50C02199
	for <buildroot@archiver.kernel.org>; Thu,  6 Feb 2025 19:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8997580FC1;
	Thu,  6 Feb 2025 19:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uymI0YM8zldj; Thu,  6 Feb 2025 19:18:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A86D08417A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A86D08417A;
	Thu,  6 Feb 2025 19:18:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 77C75E2
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 19:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B3EB80E1D
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 19:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JIRT3tf_5mNM for <buildroot@buildroot.org>;
 Thu,  6 Feb 2025 19:18:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8548980FC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8548980FC1
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8548980FC1
 for <buildroot@buildroot.org>; Thu,  6 Feb 2025 19:18:29 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2fa1d9fb990so875066a91.2
 for <buildroot@buildroot.org>; Thu, 06 Feb 2025 11:18:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738869508; x=1739474308;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U2TpWYCdOfnsV/mPwkq7peh6BO98I9yQjQMgWJVI4yQ=;
 b=lan+MMpC8Wu1zXffz9gm/H3//k4Gf0ZjOC877Nm6WqQOcpvuZkPUvl4oWk2OS4tf9P
 PR7tdEfS45T5+iCzy5kFlBjSAZcnBKksDB0TuiRxvCyOw8H8wZfRx5swB9M5MOosmVkc
 gdwtWRja+emoiwepkopg2/kO47/viu26gcvn7fFcEkdsO51qyEf/pV1YdA6AuMNILcNI
 jsmif4/rmACDryu6erK4athF4vkgFkAAPtL2NEZOteN4+y//a9SSQ4Np4AsYXSx4dvJ1
 cWHBBiSJaPB1Ew8xlawAmWhg9fbIZWXHDvG5SOYRHoe/aQm05Nx2g3at/mNN4WizNGCJ
 3NIw==
X-Gm-Message-State: AOJu0Ywf1zBg7lucaaq+BMyiiKNbuaO8WSR1/io2LCMy8H0FbjlY3CPl
 c7yF4+zfbnteE1V4/e6mKEoO+qAnVVU4QRwoqObjsvcoUeTglRD3GCkDx5W3
X-Gm-Gg: ASbGnctlCZ4uXTmuqww3zotCMIC1UH5Qr7Atm894ZMQMRlxKajKir4PW/Nhf6KPYVEK
 eZuZx8kJ7GW5RU1jA8/NaIxcemaLB1bBeue7022MFLyfdGf0C0LXehx0OcSagMgGr0ZBNkKxmiX
 joCtDREILnJRD58+EGAMTyJF/igkEF/Wi+3WKd6QQ5d3Q4OF/zJMnOpSQ9P/nnl7/PaHU7dm+xE
 PKmRb+jF8KYbJHx0MLV7V1zu+vIDnBDS9AgFwVI4m5GI/51MtEZNdds11ceu9Z6pDKoCaNtYbZ0
 kQsHLJvANcFEMs7YAZLqkm8OGb7EfVKwRLTde48Oh+ZAgMxHxeqjPgDbShODppbHooWQV8/Q/Ew
 =
X-Google-Smtp-Source: AGHT+IEHgL9BwMRiFZGuuG5D07e1NDKf1nt5HSbRwh+zVvj6zMG6IgbnCqSu8Ph7Z7FUcIuX01XK1A==
X-Received: by 2002:a17:90a:ec85:b0:2ea:9ccb:d1f4 with SMTP id
 98e67ed59e1d1-2fa22b997b4mr538530a91.0.1738869508600; 
 Thu, 06 Feb 2025 11:18:28 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3653af58sm16587435ad.70.2025.02.06.11.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:18:27 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Thu,  6 Feb 2025 11:18:25 -0800
Message-Id: <20250206191825.8733-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738869508; x=1739474308; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U2TpWYCdOfnsV/mPwkq7peh6BO98I9yQjQMgWJVI4yQ=;
 b=XDLq5xtMXHUU5lWsrMfI3sUFcO3q9aCcqTpdTqjWqpas5GO2bhCwyo4l32FdT4bJ5O
 VQlTEnrmaIo8FZPfBPLJzE2JT+VebDD96fBhYeEsPiojLHPghuCT6TqCZ3GQr4Q80O6B
 gpQADUfY8I3q6lxEgW3MwQyPIloJsGJ7GsnZA2smv66BYXAw92cRaxSeYSXoRfxd/id8
 eYCtLZWaj5csF+NyLXG24SGyy4dce6War3CoGCofi7eqQ/jHqc4e55YZ9idInSIvSLYh
 3OsCSzxREXW5zfoZPWvcZVJ9WaskLAPQGveDI9Mqo/eZHLXdxxyKta9EJq7RESsguzng
 KoyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XDLq5xtM
Subject: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.392
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

Release notes:
https://github.com/vcrhonek/hwdata/releases/tag/v0.392

Changelog:
https://github.com/vcrhonek/hwdata/compare/v0.391...v0.392

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index c559c99374..9c8d37323d 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  620fe1c22922a3d1bd1062424e9cc6b954acea2f83b72ff0cb45144981cb1975  hwdata-0.391.tar.gz
+sha256  1f472d8f2ec824d4efe6a75480767c4ce240fa5d91b6428d9f8775035da3ba1f  hwdata-0.392.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index bbf7b861f8..eb9166dc72 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.391
+HWDATA_VERSION = 0.392
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
