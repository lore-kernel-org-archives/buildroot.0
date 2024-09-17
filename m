Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181F1CAC596
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 18:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D477760896;
	Tue, 17 Sep 2024 18:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMNLmbGFTZ50; Tue, 17 Sep 2024 18:33:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA7A3608C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA7A3608C3;
	Tue, 17 Sep 2024 18:33:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55BE61BF310
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5137B401ED
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVFO6xmRlo54 for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 18:33:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0780D40139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0780D40139
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0780D40139
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 18:33:48 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-82cd872755dso254228039f.1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 11:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726598028; x=1727202828;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DazskB/pwwhztFtawAwWRNa+PWD2u1jvyoTvTxfItKI=;
 b=HzqnaMA2KRLmQO++iSbJJPU8fUloN7YeTAH66LfvXBo8iJlx0eZ9pWirQMCZWnOGKE
 BD2Z4Og7THl0PwpDLgrKRVzywP5upMcK/cRqxcUcwCyZfyr6ia4OIEb1ujWBp3UHshco
 27gDldZjYX08SfTXa+/Ll40EhwGMvl9BKzjKY8KB5oAc1zmRQIWPjKIFdO1eTyxRwoBK
 7JAe/Az3uMHR67MUPIUm84t5AYhObu18pVFHHYRkPDJoKhmYkeE1KPxNUvm31Cjo8uqT
 0uL1Jb7WHONfGcojhRf5XMdrsdJHwW82u+eL69mMkHmuRNDsSPHSzNRqMiXZLkIEqwzS
 Uk7g==
X-Gm-Message-State: AOJu0YwP4VxqT3URqHZlUG3f9+oEktFUTm4NRii3+ERO+kfDIo033Wer
 /pItZvGK/LQayfLT2hvT4P7tcq+8VmeaC8jvsc20H8ratcy3RBkf2d6ZaA==
X-Google-Smtp-Source: AGHT+IHtfHgSeTKIoPvqVHxmWBm+tIo+14suV69Dg7ytFDkyfHBrOUeVTMhkcd8YSkH8hOH4TI1wag==
X-Received: by 2002:a05:6602:1555:b0:82d:2a45:79f6 with SMTP id
 ca18e2360f4ac-82d2a458bf6mr1901940539f.11.1726598027850; 
 Tue, 17 Sep 2024 11:33:47 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed19ebesm2068412173.112.2024.09.17.11.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 11:33:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 12:33:46 -0600
Message-Id: <20240917183346.3877590-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726598028; x=1727202828; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DazskB/pwwhztFtawAwWRNa+PWD2u1jvyoTvTxfItKI=;
 b=E8M5V0SaoHnSeeD5UUV7oW1zM9cvB7LMDHS5gz/tAfUF8nFtkBc4AA064OplaQDN0v
 znWRQ2XgD8ik9HKWZySyo8gknOnZ1yEu0cUS1fktOK7f8IzcaohUFnAhVnSUc8AgLfiN
 K6S87P7M7CKPCjCeGt4N1IPTgSGju92+l8umszHR/+/bfplxqAlOCXkNE03WA7CNEWOq
 SFL0Nu6zizfdIAhX07j+Xfa99bohq+XBywAMh96O6xPayu1hCylIfNqXtSc58dx3PJMB
 wzPcb0xExyhjBSwQojeiSt9+IyhbiYQpYAx3qimImPSNJWr6kzETiTyfQX/WBlA4NJko
 MhHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=E8M5V0Sa
Subject: [Buildroot] [PATCH 1/1] package/python-pefile: bump to version
 2024.8.26
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to date update:
https://github.com/erocarrera/pefile/commit/4b3b1e2e568a88d4f1897d694d684f23d9e270c4

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pefile/python-pefile.hash | 6 +++---
 package/python-pefile/python-pefile.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pefile/python-pefile.hash b/package/python-pefile/python-pefile.hash
index af2288487d..2174b7afd2 100644
--- a/package/python-pefile/python-pefile.hash
+++ b/package/python-pefile/python-pefile.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pefile/json
-md5  fa0eba7c91f4e696771ddbfacdca25e4  pefile-2023.2.7.tar.gz
-sha256  82e6114004b3d6911c77c3953e3838654b04511b8b66e8583db70c65998017dc  pefile-2023.2.7.tar.gz
+md5  f511b370db4c80137aadf457a905fa53  pefile-2024.8.26.tar.gz
+sha256  3ff6c5d8b43e8c37bb6e6dd5085658d658a7a0bdcd20b6a07b1fcfc1c4e9d632  pefile-2024.8.26.tar.gz
 # Locally computed sha256 checksums
-sha256  bfd4b5e4f8a99c961fd6f94d708e38396cc146bfe8fbc5d2a86e63aa29fb4208  LICENSE
+sha256  b44409c067c6da52bfb54bb6624fb11a7b52157c3a13ae1400232f8196e86ad3  LICENSE
diff --git a/package/python-pefile/python-pefile.mk b/package/python-pefile/python-pefile.mk
index c65f1deb60..e04db7a116 100644
--- a/package/python-pefile/python-pefile.mk
+++ b/package/python-pefile/python-pefile.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PEFILE_VERSION = 2023.2.7
+PYTHON_PEFILE_VERSION = 2024.8.26
 PYTHON_PEFILE_SOURCE = pefile-$(PYTHON_PEFILE_VERSION).tar.gz
-PYTHON_PEFILE_SITE = https://files.pythonhosted.org/packages/78/c5/3b3c62223f72e2360737fd2a57c30e5b2adecd85e70276879609a7403334
+PYTHON_PEFILE_SITE = https://files.pythonhosted.org/packages/03/4f/2750f7f6f025a1507cd3b7218691671eecfd0bbebebe8b39aa0fe1d360b8
 PYTHON_PEFILE_SETUP_TYPE = setuptools
 PYTHON_PEFILE_LICENSE = MIT
 PYTHON_PEFILE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
