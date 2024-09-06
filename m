Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB36E6FE41
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 18:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF085605B3;
	Fri,  6 Sep 2024 18:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OE_HEQLkb07e; Fri,  6 Sep 2024 18:30:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBD7A605FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBD7A605FA;
	Fri,  6 Sep 2024 18:30:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 567C01BF309
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6DF940151
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UudPRUvW-9FI for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 18:30:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 868E54032B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 868E54032B
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 868E54032B
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 18:30:03 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-39f4fed788bso8577645ab.3
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 11:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725647402; x=1726252202;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xz67GA8GwN2+FnWGnYXehGOSRsWZDxhbJDGsQySc2M4=;
 b=YKgpIt5srAYN4Htya1JRQv4DAhPLSktSZm6EgrtCCtsX8X8Bxi0bHeeU4oR1zv+DHK
 nrLOd36lK9KRwHfJJvGw3MJMaNvENyfAuF5vDe3cZ8P/4fYpwHRxGAFN8/ny8sHLHWUs
 EJb5uBGlgCkDAUbWuUz3ZE/NsR3IIThhBDvQXBjTBotoWwOVMRqid0V9J5vRVM0Fap84
 r9qc3d1dAUR3lckjAgUa502HuTgJ5xCPzjWA4l26uxqSHUMN/++n2dPhmTq2lG6uIA9P
 hVP0GGYj0YLXCECQ4kSz6INMX7ORMPledtRc97jVo89mgwEs93aBUUG7JX7w8mdey1Ax
 sW3A==
X-Gm-Message-State: AOJu0YzvSxUL6i3Qi7OESt6AZbn+KvxNCgIGu71CpDMexLoOG07wpn0B
 c1Yp8zsboMhrXPyu830cM3waglCC3ySXJqQSXW4JIcHeGqqqIupqlln5hg==
X-Google-Smtp-Source: AGHT+IGUHpSYrAjX9TEuc4+vzAhKYpl+X7h8DDo3DyWLqxcdd1HzD2M3hoIo4s8vQWcI6icfm6OKNQ==
X-Received: by 2002:a05:6e02:1786:b0:3a0:463d:ce1e with SMTP id
 e9e14a558f8ab-3a04f08be16mr48165045ab.12.1725647401969; 
 Fri, 06 Sep 2024 11:30:01 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d082bf841asm579518173.150.2024.09.06.11.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 11:30:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 12:30:00 -0600
Message-Id: <20240906183000.475670-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725647402; x=1726252202; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xz67GA8GwN2+FnWGnYXehGOSRsWZDxhbJDGsQySc2M4=;
 b=JjIS3F+KfTqoDnGJJZQBCJSkrU6L7ResM5TtIswXpJ2dEQ4MMVyThMBanMQ3oapTxu
 xpyp657ldshomJ+WFlxfuUYzJqrjSV883FcM6xCZXvmPtSQNfSOrS4kae6f0enunRWsl
 N7wXKU2KzS9fXliDHlHWf0owBvcXcBR1sNIdRjucudE7EDJww6CPPmT2ASERL3U36qT3
 ljbxwnnBWy6rX4a/N0xG/UD1LRqH243KogOTtcfcHi5EpIZm3eEx1QwICzRPS6MHY9ZQ
 HqiBPdF28dUiJIad10Uvm/7nkZLAAmvy7EXf8squtgodB7h30gCUV7qwtdrWwNS64CQr
 0WBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JjIS3F+K
Subject: [Buildroot] [PATCH 1/1] package/python-lxml: bump to version 5.3.0
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

Replace deprecated --xslt-config build option with --with-xslt-config.

Replace deprecated --xml2-config build option with --with-xml2-config.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-lxml/python-lxml.hash |  2 +-
 package/python-lxml/python-lxml.mk   | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index 3eb427a80d..059238ffab 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,5 +1,5 @@
 # From https://pypi.org/project/lxml/
-sha256  bb2dc4898180bea79863d5487e5f9c7c34297414bad54bcd0f0852aee9cfdb87  lxml-5.2.2.tar.gz
+sha256  4e109ca30d1edec1ac60cdbe341905dc3b8f55b16855e03a54aaf59e51ec8c6f  lxml-5.3.0.tar.gz
 # Locally computed
 sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
 sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 2a26c132a7..8604b5783a 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 5.2.2
-PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/63/f7/ffbb6d2eb67b80a45b8a0834baa5557a14a5ffce0979439e7cd7f0c4055b
+PYTHON_LXML_VERSION = 5.3.0
+PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/e7/6b/20c3a4b24751377aaa6307eb230b66701024012c29dd374999cc92983269
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
 
 # Not including the GPL, because it is used only for the test scripts.
@@ -29,12 +29,12 @@ HOST_PYTHON_LXML_DEPENDENCIES = host-libxml2 host-libxslt host-zlib
 # libxslt compiler and linker flags
 PYTHON_LXML_BUILD_OPTS = \
 	--skip-dependency-check \
-	-C--build-option=--xslt-config=$(STAGING_DIR)/usr/bin/xslt-config \
-	-C--build-option=--xml2-config=$(STAGING_DIR)/usr/bin/xml2-config
+	-C--build-option=--with-xslt-config=$(STAGING_DIR)/usr/bin/xslt-config \
+	-C--build-option=--with-xml2-config=$(STAGING_DIR)/usr/bin/xml2-config
 HOST_PYTHON_LXML_BUILD_OPTS = \
 	--skip-dependency-check \
-	-C--build-option=--xslt-config=$(HOST_DIR)/bin/xslt-config \
-	-C--build-option=--xml2-config=$(HOST_DIR)/bin/xml2-config
+	-C--build-option=--with-xslt-config=$(HOST_DIR)/bin/xslt-config \
+	-C--build-option=--with-xml2-config=$(HOST_DIR)/bin/xml2-config
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
