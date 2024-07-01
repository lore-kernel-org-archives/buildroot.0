Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B762EC2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 16:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53E71403CD;
	Mon,  1 Jul 2024 16:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLx-VHZVEnxd; Mon,  1 Jul 2024 16:51:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D523403EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D523403EC;
	Mon,  1 Jul 2024 16:51:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8DC831BF34F
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 16:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B47E81456
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 16:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 83ertVISd7U6 for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 16:51:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 78CBE81447
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78CBE81447
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78CBE81447
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 16:51:18 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7f3d37d6bfdso94657939f.1
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 09:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719852677; x=1720457477;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XAWWPUSsjAkyI3G12x3lx4Qxookd7VPCsFWzN6R4YvM=;
 b=dSqB6d7VmQzoWAUCMS4AUGVohoOmOVNR8Ht7F6c+UeKwzS6fJjh1LvK9B1VTFyl/xu
 dnz/Qsn+Q/T/paxGZ4NEciWT+PTYMpnDix5Lbf5WPpCV1YGrIg2ivUTdPRiRRZ6q44ve
 KlaCjoVYRGJ8Wfj6y+s9DAjOU3aDbPGMYFeSqQbtG5LwJeDIXDTIeeYQSFQcXkNcFXHv
 Zx8THOvGtihJex1hm/OsY6KqqgOKUC8+9MmrQD4pjcZvFJ5uaiKJ4EC6nL1yoPf/orST
 +Ej+erL5UqbZYoojixnGyrR90mBuage/aexBap/Pe2OtdMiBYlHvQRBk9RotEHA1UKb4
 WFWQ==
X-Gm-Message-State: AOJu0Yx8U2nmSLi+JZr3u0NnpG7kB6UrR3LQaMoFWPLOm4k2mshWSChY
 vtEb4vNA3EgDmDAtYPtiuTYbIi/rAq2SKD3VHGfBqnCHdC2xon/FnCRo7Q==
X-Google-Smtp-Source: AGHT+IHhEzxOOva2lHY8MbCCCLJozPfctklU9Xj7WcltG7DETQkYzPqqTNe/sNrro3l5Ia1EDswGjA==
X-Received: by 2002:a05:6602:6613:b0:7f3:a415:c736 with SMTP id
 ca18e2360f4ac-7f61f533284mr462408939f.8.1719852677085; 
 Mon, 01 Jul 2024 09:51:17 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bb742b9974sm2206937173.137.2024.07.01.09.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 09:51:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 10:51:10 -0600
Message-Id: <20240701165110.1631129-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719852677; x=1720457477; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XAWWPUSsjAkyI3G12x3lx4Qxookd7VPCsFWzN6R4YvM=;
 b=hHWHt4vHbAkZmPn6Ltd3alTNvxjhDWoIUzZMOVuR+8kJEgRTgSBE8GhtUgF+WGmppb
 vETHiHHqGyhMRCYG5J15sOjXpJf/EMza54XPxS2jZCzSNZSBJs8iNtViW00Iga5cIeMR
 0ECcQpRe5Y2hxacXrspPIqzwJh0MlrbIYwSQccdx8T4X2L4UAw2iYBWdDvZ5OmwyNWjE
 Joh/uTn1E0DxUERK+FwK7XH5wL+Gi4IW+qQkDdVfd4mT4/qy3we+UbOxTf4iE+ZXVy4b
 Aaa33G92STN7TpoIlaRMrTzjaxaBBmU0VsMnDAhZ3LOo84r7aEYdpsSgd1szwnNzBz3s
 VcxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hHWHt4vH
Subject: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to version
 3.6.9
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
Cc: Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 4595246efc..37c44f6a06 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  809260ecaaef548c7ac327755d7d2d25  pymodbus-3.6.8.tar.gz
-sha256  abb214716b56fc62bc0d5d9d964e2249439341746287e918d175f0e3ee241407  pymodbus-3.6.8.tar.gz
+md5  5201e93420b9ac9dc5e3e64a656101cc  pymodbus-3.6.9.tar.gz
+sha256  f4223b72c20cd00a2cf25f6ddb31ecb2c0587309111a55283b2f4a1ac115e4cc  pymodbus-3.6.9.tar.gz
 # Locally computed sha256 checksums
 sha256  47f904249172e795a6b32de91f471073297befffd74e17cafc288d348a55972e  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index a96edecc54..cba94896bb 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.6.8
+PYTHON_PYMODBUS_VERSION = 3.6.9
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/62/c1/f18b090dcc45d34b6a0e3563acde71b407ef96a36fa965c508a84f755355
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/b4/a4/5322c8e3be3bb2db7ab3eb7c2160fd2ec325083d7e60a76cd9cc896dd7bd
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
