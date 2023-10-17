Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A53CDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 13:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E224A404B9;
	Tue, 17 Oct 2023 13:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E224A404B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qwie2sowMFh6; Tue, 17 Oct 2023 13:13:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A48B140A48;
	Tue, 17 Oct 2023 13:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A48B140A48
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 070151BF97E
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 13:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D462E820C3
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 13:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D462E820C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xYWkv3sc0wDi for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 13:13:10 +0000 (UTC)
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DCE1820BD
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 13:13:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DCE1820BD
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-4064876e8b8so59946395e9.0
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 06:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697548388; x=1698153188;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=91fB/jG39U50lIvdPDq2mQ/U2kd/KUNbh3BAv7ImEjQ=;
 b=mFp8mRXo5WzmBljemjh6wFD2JI9DqO29il9tBL37wFRNH5xB2/aYvQUVF57Pv5pJSq
 M/b7JMRj9IQaLcQe/zOq5KzbigG3j5lUMgo6i98f/nQlI72e9GpP0D2pRRiHoSajneeY
 /E7NHzZzBoW5vB5ai77DsJ3aqTQK/A+a/mpeDTQ5xBObqOSlxd6FYWix5oHH5giwq+YI
 ieRHAMnwoHPQywv18SfmTsd3a+7EevORF0g2G7HZCpCbKB0DEvreebHQ95HWwPfxepWi
 uQJQejQNgfYPgOi4LVpPUIteyZVBjOjZm2AWlZwy6NAW5vILkkzIbLSVaMXk3UYZ52sg
 Wugg==
X-Gm-Message-State: AOJu0Yy+LxGdmtwnXa1XEyd/1XyefvaDkP4WD3jjLi08SWoSw9yAMmqG
 Mzxge2KLlilajyOfqbCPeTcsn/89ztX3VPEyI46Xq63J44INGw==
X-Google-Smtp-Source: AGHT+IEc8ietgpw68o1V1fFIiOEpaEPcRD2xr+aQcDTwoST5I9+bD5SbGrQra5XywKazrR7LbhjM3Q==
X-Received: by 2002:a05:600c:45d2:b0:401:daf2:2737 with SMTP id
 s18-20020a05600c45d200b00401daf22737mr1705342wmo.30.1697548387039; 
 Tue, 17 Oct 2023 06:13:07 -0700 (PDT)
Received: from localhost.localdomain (net-91-81-8-146.cust.vodafonedsl.it.
 [91.81.8.146]) by smtp.gmail.com with ESMTPSA id
 s26-20020a05600c319a00b00405588aa40asm1880730wmp.24.2023.10.17.06.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 06:13:06 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 15:12:53 +0200
Message-ID: <20231017131257.2211225-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697548388; x=1698153188;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=91fB/jG39U50lIvdPDq2mQ/U2kd/KUNbh3BAv7ImEjQ=;
 b=jgm8pZ8VQwqRdJKQIDB8tX4/c2gnQgByDlzbnoC70pDVbsnWiBIolw8eGZbKyAsqO/
 pxCcbSXxuEXcxNfqNr2yqcxWvctDHEAyCmaUaOOoymYFSGXrcPULk0KIIzj1tCGkj2P8
 bJ5IUD4drhW7yxMYn8GNBJPGGyxefi9jIu6p4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=jgm8pZ8V
Subject: [Buildroot] [PATCH 1/5] package/flutter-sdk-bin: bump version to
 3.13.7
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
index 9daf6c58be..41c8a3c681 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d9bbfbfb6fe3c72a29c1040235126edd0cd461e4e18556335fd1cf217c2e1473  flutter_linux_3.13.4-stable.tar.xz
+sha256  5901524b91b02bca0799981e806a6b8f0a5ba1f1b18b5a814d80bbe95761b1ff  flutter_linux_3.13.7-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index dc6d68fdcb..5563135f9f 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.13.4
+FLUTTER_SDK_BIN_VERSION = 3.13.7
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
