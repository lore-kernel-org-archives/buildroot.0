Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017DBC25B7A
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 11:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90CA581775;
	Wed, 22 May 2024 11:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2EI2Dugbh2i1; Wed, 22 May 2024 11:10:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2E76817A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2E76817A9;
	Wed, 22 May 2024 11:10:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15D251BF27E
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 11:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FC3D40103
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 11:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tObS82g9i8pC for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 11:10:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4F8FA40102
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F8FA40102
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F8FA40102
 for <buildroot@buildroot.org>; Wed, 22 May 2024 11:10:38 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1ec69e3dbcfso9360175ad.0
 for <buildroot@buildroot.org>; Wed, 22 May 2024 04:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716376237; x=1716981037;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u7UWuYbF3eR1X267xy8nqRUtdHNDcU89j4zS8EG0Yzg=;
 b=rzdPaxap1ex9gladQVwXVsCiPPbWnQXF8FmtCnIpJFh7gWfO+rEm+oiuavLag6eDt2
 U8FmJyXMfgFzh/91+d2bo++L7NGlb28nN9N+sGJDOvsYC9UEPA2KHt6swMyuBst7qlj9
 SeNdw94h85M8IvIhHR7DWp1abqsl40TagLb0DU0JYHRokBiy2QblzLMGQahM2gRrdBDk
 HA2zdMdmUSArcUHIMCHymIPydMLeOPjXEirZXjNlaSLFvthWJ7bZ/kUb5gGjWgpckwbl
 xRwNB2WlMIT+bwK9F9HaGZwSFPg0eGv60xT4IyOS8DCVatIijcbfcIdIWCvqbyqgw+Xp
 2wNg==
X-Gm-Message-State: AOJu0Yz1WeTzyC2h3vmXoznwBs7oIry1yPx1AhQEdzER5ngwMKGgKj4R
 gDzuLEsGe2ON50Z9GIV8h1shr3elhr6wJ0S3wBankAEtX9IEk5UophW7ORcXQs6d+ALxDJTH1on
 7
X-Google-Smtp-Source: AGHT+IFF442u9WuJVna/D8qVurr1GK/GGQEv5CeKG56RX2WbQ8u0kcprxdp7wh7+VKgMM6BH4k6jFA==
X-Received: by 2002:a17:90a:ae04:b0:2af:3c0e:f6b8 with SMTP id
 98e67ed59e1d1-2bd9f34569cmr1638590a91.3.1716376236903; 
 Wed, 22 May 2024 04:10:36 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2b671783519sm23322514a91.57.2024.05.22.04.10.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 May 2024 04:10:36 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 04:10:32 -0700
Message-ID: <20240522111032.3095-1-christian@aperture.us>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1716376237; x=1716981037; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u7UWuYbF3eR1X267xy8nqRUtdHNDcU89j4zS8EG0Yzg=;
 b=lUGrRBFdrucWgO+Uhal2lN1vUHeAvizwIc14WIKa0LPNU7TdECuPrAAVDeSYxllCmo
 mjOgN0d0xihNf66DPCEhPNFy50DO/pc1dMRuF8dNC7tqCnhQ4Y/Jdk8rWcpdYPRLPbvf
 y2ejuAw6hEMhXCTHG+vaNuJz0hAIjnq2UNjCEYBKqd1A7zXRcFkFLdgRpdBwinAT9LYV
 axfkZkB951MvYTnZr8w7UrUc7dcARmUOJLg8VNTvVLzUWn4K9vhJwGrCZb7mS5CFhHcM
 Ns0slBwKAi4dHU35OzCzws4Ze2QW0Ec/DL2uOBZzuMD4KkGx//zmvECKWK+nGoge/dHb
 yW+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=lUGrRBFd
Subject: [Buildroot] [PATCH v1 1/1] package/embiggen-disk: bump version to
 v20240521
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

Switch to the skiffos fork as the upstream is not maintained.

Update the tarball hash.

Drop the GOMOD line since this is now the same as go.mod.

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/embiggen-disk/embiggen-disk.hash | 2 +-
 package/embiggen-disk/embiggen-disk.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/embiggen-disk/embiggen-disk.hash b/package/embiggen-disk/embiggen-disk.hash
index 86e9346e9b..02c99add6a 100644
--- a/package/embiggen-disk/embiggen-disk.hash
+++ b/package/embiggen-disk/embiggen-disk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  aa6019311ea869b1f7cbca640462eae6cfa0fef5a65ec5266ca394b261217960  embiggen-disk-9e7b2fc7b99c4dece41a805489a6ca377ce55a62-go2.tar.gz
+sha256  25e536bd58969077554927a456cd3cb79e21f126e47545ba511abe64a0f3ba5e  embiggen-disk-v20240521-go2.tar.gz
 sha256  063aedec1652c5a05c2d04c40e032b932453142ee8ef7fd53c04a9acc127fc95  LICENSE
diff --git a/package/embiggen-disk/embiggen-disk.mk b/package/embiggen-disk/embiggen-disk.mk
index 66f2087dbd..47b86c072b 100644
--- a/package/embiggen-disk/embiggen-disk.mk
+++ b/package/embiggen-disk/embiggen-disk.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-EMBIGGEN_DISK_VERSION = 9e7b2fc7b99c4dece41a805489a6ca377ce55a62
-EMBIGGEN_DISK_SITE = $(call github,bradfitz,embiggen-disk,$(EMBIGGEN_DISK_VERSION))
+EMBIGGEN_DISK_VERSION = v20240521
+EMBIGGEN_DISK_SITE = $(call github,skiffos,embiggen-disk,$(EMBIGGEN_DISK_VERSION))
 EMBIGGEN_DISK_LICENSE = Apache-2.0
 EMBIGGEN_DISK_LICENSE_FILES = LICENSE
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
