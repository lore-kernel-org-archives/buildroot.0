Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E36CAC594
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 18:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3856B606B6;
	Tue, 17 Sep 2024 18:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VW0crRbIs34b; Tue, 17 Sep 2024 18:14:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F9356072F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F9356072F;
	Tue, 17 Sep 2024 18:14:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EEB091BF310
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E93C1412C4
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DlJldpuxCiIN for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 18:14:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BEA36412B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEA36412B4
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BEA36412B4
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 18:14:26 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-82cda617e1aso421628239f.2
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 11:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726596865; x=1727201665;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SFedL83pzv7jG53SHfBmWolXTYPD1M9M0Ae2spX44bA=;
 b=PwaGs0DMRc8OPLfimgxAHFm6Ste7LhQIxskXYbDFdtzZZiFVHysynrFD9/LJbkODDv
 LAszuLbvTFL5VeRfhhBYqbbjPEsbXGpNjyyL7wN1FNIMgfa8UbHG+L5JtXDeevVdDHHQ
 8cZHYuOQLGXGKR8cVa1D+5Ka5SLOiEOHuW8Snq5MNyhiGsVYNCKfjL5rwIiAy5MuC3lt
 Uuc65jWR66ixRRqgauMPjzqyO6DG1Y2m7wZHVaNQgVY+GcLEg+IUDJQozYTuYcJhZwlP
 K369AyxhMy7WFM9bGWofx4Rg9XO9qAqkpi9NSeVEp73QBZwZZLmLkUNfnmQ1oCqcWjZk
 u68g==
X-Gm-Message-State: AOJu0YyjxCIfT/qDp970ERavxxAWLOqprVgorHlTUSJ5SsS2nTdstvJm
 c5l4BNQt8/1QeLtxdGvPwegOxOj0Qgge4gzB1zZeTTzdUkQ5UeLLvNJYig==
X-Google-Smtp-Source: AGHT+IHjG8ZNH6FTo1KuSrqiEeDtvHfqp2kaOzFhoXCvzZZCHzAiy2qMTKHedX6y588V/GlfR7zxVA==
X-Received: by 2002:a05:6602:1354:b0:82c:d843:edcc with SMTP id
 ca18e2360f4ac-82d1f96f3bfmr2402252539f.11.1726596865469; 
 Tue, 17 Sep 2024 11:14:25 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec17fb2sm2111651173.43.2024.09.17.11.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 11:14:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 12:14:23 -0600
Message-Id: <20240917181423.3866422-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726596865; x=1727201665; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SFedL83pzv7jG53SHfBmWolXTYPD1M9M0Ae2spX44bA=;
 b=ePYi8217tSacBKGLspDZrYzBCmKVkMpfBGRXka/iABEHg0535GeqpWqa4lUsSNOkgd
 ZOX0wdULxgYVrK5b+wqRoKLuKC4rc50Kdrg0cTz0FNHKcb9ftoq7i+3uRf1abLcKt3Vt
 W9fgv8L9ggR3LaSxd3ZCmKEBV4luZQa2YnaazvVMDQDkb8lpV4qXt5GTTe0T71qu5c7I
 eSw7UQPTquZWJ64xulWCLmhdm+7aaU0eJcthqWNzIcndoxYy7cN5xMNztbCA/hOvU2Q1
 3T6KkNzSY1tkhZYYUoxzKr/TsfEbSl0S4lrFGFk0tVgHu70l0nljkFS+vU+l8Pl4/W7R
 IJ4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ePYi8217
Subject: [Buildroot] [PATCH 1/1] package/python-packaging: bump to version
 24.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-packaging/python-packaging.hash | 4 ++--
 package/python-packaging/python-packaging.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-packaging/python-packaging.hash b/package/python-packaging/python-packaging.hash
index 1c15c2e82b..dca59bf975 100644
--- a/package/python-packaging/python-packaging.hash
+++ b/package/python-packaging/python-packaging.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/packaging/json
-md5  8e3bc7b152efc9ffadabddc9f8465b02  packaging-24.0.tar.gz
-sha256  eb82c5e3e56209074766e6885bb04b8c38a0c015d0a30036ebe7ece34c9989e9  packaging-24.0.tar.gz
+md5  99b97d1f30017a62a2aae777a14782d0  packaging-24.1.tar.gz
+sha256  026ed72c8ed3fcce5bf8950572258698927fd1dbda10a5e981cdf0ac37f4f002  packaging-24.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cad1ef5bd340d73e074ba614d26f7deaca5c7940c3d8c34852e65c4909686c48  LICENSE
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.APACHE
diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
index e795b61881..01d6c2bbf2 100644
--- a/package/python-packaging/python-packaging.mk
+++ b/package/python-packaging/python-packaging.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PACKAGING_VERSION = 24.0
+PYTHON_PACKAGING_VERSION = 24.1
 PYTHON_PACKAGING_SOURCE = packaging-$(PYTHON_PACKAGING_VERSION).tar.gz
-PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/ee/b5/b43a27ac7472e1818c4bafd44430e69605baefe1f34440593e0332ec8b4d
+PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/51/65/50db4dda066951078f0a96cf12f4b9ada6e4b811516bf0262c0f4f7064d4
 PYTHON_PACKAGING_SETUP_TYPE = flit
 PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
 PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
