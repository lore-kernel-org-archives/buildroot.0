Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF6FCF043E
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 04:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1033A810FC;
	Wed,  9 Oct 2024 04:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MXbvqOhOeJJI; Wed,  9 Oct 2024 04:19:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F072F8112C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F072F8112C;
	Wed,  9 Oct 2024 04:19:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 473191BF573
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 04:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3628E40407
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 04:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cUdZNkQOvG7Y for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 04:19:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D3806401AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3806401AF
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3806401AF
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 04:19:06 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2e0af6e5da9so4672503a91.2
 for <buildroot@buildroot.org>; Tue, 08 Oct 2024 21:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728447546; x=1729052346;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=893tKFjeZb0q6AlCdwp7JQmdtKC13JiUjwnz3y3kkQw=;
 b=qsXA5OdZNBLP9X2VeDgS1VP04muoZLckbX031LSghFL+PQJZc5byIi2W+0/G1FtoKP
 SWgQhG1XZyVxoupfuRYuik1uXzHMbvEvE6TderHge6cBs35mfSIVFlaBfQuCA8LfkKie
 r2j962ADzkUuGt0AifyZGjsnVF5uFpj5FKPstQmMQNx48mI9o9ZpmP92bkGwWa/oj/Bx
 jN+Y3JuVUkM9SzpMT/zmYstVQgY8FPc867eJlGFQJ54vHoJtH3l/WJztZOnncnCE2O0M
 Au6j0ZRUG6uk9lPJ6MR6gxPRfY8WSjmiR7/TWhA0JnHyLgrxIx1qcXHV7XURvER8Og9y
 m2PA==
X-Gm-Message-State: AOJu0YxPUmi6pLbjdNloL1UzB//9LbVxszSuLpcODsvyYDIR2S4HsYxf
 OjNQeiKQWBmpAPIdKag9njACQnrt4LUl0aQ5NgKLDXEOsxEzcmEQRsffmy6DGnQyzUk79zpamTk
 QSJA=
X-Google-Smtp-Source: AGHT+IGJOQNRwmwSUF+JpR6qJLusDTsXvggtgJ+qSXO/qU6IDqIZooAubqax/ZllM9k7AEEhJGcoVw==
X-Received: by 2002:a17:90b:e10:b0:2e2:9132:4c5c with SMTP id
 98e67ed59e1d1-2e2a2578af9mr1481024a91.36.1728447545899; 
 Tue, 08 Oct 2024 21:19:05 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e2a56f71b5sm482075a91.20.2024.10.08.21.19.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Oct 2024 21:19:05 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  8 Oct 2024 21:18:52 -0700
Message-ID: <20241009041852.75988-1-christian@aperture.us>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1728447546; x=1729052346; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=893tKFjeZb0q6AlCdwp7JQmdtKC13JiUjwnz3y3kkQw=;
 b=BmlgrIxzSjL4BtmxOEOXpR8GPx7TrDC5+IemKNZMEot+yv8l1l593Fgy4nzYihaqNq
 L7CVgiXPH8AM17FW/5XgPYarE5Wk0LTEgr+UC2y8ZOXSZaCbD7InxsHDJfkHpyow0A6e
 FsWShioQ+pHZSa5UA3Bh0fvpVCeaw6N0U35EvJDdp527ZIOjSURZZ5guWeXSAJTapgh7
 8jZ8cRyLiFWHKmcmcrVJ+J6VINRRna1BQrCz0/Q5cOmHTYOP16jCI01ZMkIbxLOfCQ99
 RrLVlo63upUsO254iiMbgS/KcDqfeuQipU+AmVKcbPTiSa2ar75hLj3BuE/zaUzWhGbq
 TgBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=BmlgrIxz
Subject: [Buildroot] [PATCH v1 1/1] package/go: bump version to go1.22.8
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

go1.22.8 (released 2024-10-01) includes fixes to cgo, maps, and syscall.

https://go.dev/doc/devel/release#go1.22.8

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go-bin/go-bin.hash | 14 +++++++-------
 package/go/go-src/go-src.hash |  2 +-
 package/go/go.mk              |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/go/go-bin/go-bin.hash b/package/go/go-bin/go-bin.hash
index d979bada11..4d18e0cd2e 100644
--- a/package/go/go-bin/go-bin.hash
+++ b/package/go/go-bin/go-bin.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  66432d87d85e0cfac3edffe637d5930fc4ddf5793313fe11e4a0f333023c879f  go1.22.7.src.tar.gz
-sha256  810e4d9f3f2f03b2f11471a9c7a32302968fc09d51f666cecacedb1055f2f873  go1.22.7.linux-386.tar.gz
-sha256  fc5d49b7a5035f1f1b265c17aa86e9819e6dc9af8260ad61430ee7fbe27881bb  go1.22.7.linux-amd64.tar.gz
-sha256  ed695684438facbd7e0f286c30b7bc2411cfc605516d8127dc25c62fe5b03885  go1.22.7.linux-arm64.tar.gz
-sha256  0fd55519819922f51d13503f2c9b1294730be7ffa0ead8dd36c0e540c2a27508  go1.22.7.linux-armv6l.tar.gz
-sha256  a6441d5da40a961039ec22b0aadbc8b513f52b31bb8919c359a7e2c3c5bcf26a  go1.22.7.linux-ppc64le.tar.gz
-sha256  08dc28de0dafb175501b9d1623c9b11a9b734eb4b3a35c9c658cc91d4dfce3f3  go1.22.7.linux-s390x.tar.gz
+sha256  df12c23ebf19dea0f4bf46a22cbeda4a3eca6f474f318390ce774974278440b8  go1.22.8.src.tar.gz
+sha256  0c8e9f824bf443f51e06ac017b9ae402ea066d761b309d880dbb2ca5793db8a2  go1.22.8.linux-386.tar.gz
+sha256  5f467d29fc67c7ae6468cb6ad5b047a274bae8180cac5e0b7ddbfeba3e47e18f  go1.22.8.linux-amd64.tar.gz
+sha256  5c616b32dab04bb8c4c8700478381daea0174dc70083e4026321163879278a4a  go1.22.8.linux-arm64.tar.gz
+sha256  5191e87a51a85d88edddc028ab30dfbfa2d7c37cf35d536655e7a063bfb2c9d2  go1.22.8.linux-armv6l.tar.gz
+sha256  c546f27866510bf8e54e86fe6f58c705af0e894341e5572c91f197a734152c27  go1.22.8.linux-ppc64le.tar.gz
+sha256  fabb3adc241474e28ae151a00e1421983deb35184d31cc76e90025b1b389f6bf  go1.22.8.linux-s390x.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go-src/go-src.hash b/package/go/go-src/go-src.hash
index f5727390f7..40cb5c801a 100644
--- a/package/go/go-src/go-src.hash
+++ b/package/go/go-src/go-src.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  66432d87d85e0cfac3edffe637d5930fc4ddf5793313fe11e4a0f333023c879f  go1.22.7.src.tar.gz
+sha256  df12c23ebf19dea0f4bf46a22cbeda4a3eca6f474f318390ce774974278440b8  go1.22.8.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 215c5fe965..68fd359ed0 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.22.7
+GO_VERSION = 1.22.8
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
