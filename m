Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E64C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 19:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A17E1606BB;
	Mon,  1 Jul 2024 19:26:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KsWBClXYuzI6; Mon,  1 Jul 2024 19:26:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A103060AA8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A103060AA8;
	Mon,  1 Jul 2024 19:26:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E63F1BF346
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 19:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87D12407C4
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 19:26:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PBaBZoCxYi8v for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 19:26:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 57ADB407A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57ADB407A9
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57ADB407A9
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 19:26:17 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-375858224adso16207205ab.0
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 12:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719861976; x=1720466776;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J0C92U4zwZJwO/fb/gAhAguDlSdQDJMxskCEP4OhATw=;
 b=sAt1fR3CnBlWQTX/3KnqC8GKcu36bUBovkP9BzKexru7yGiR1Za3o+QI1AxKoiUMF3
 5QCOt6QPYw6m0UGmAzCKSh39LwT1B9pt/+8GlKxb/+kukHFsSq3lL5sIkyF+AQ0wEpEU
 C8k8YF6JEPHFR7HcLy6YJoU8zKFkuI3XNUXuP1nxw22LlOcRbCIbNcZY6Emhf+5ny3Ss
 HqiaURQ8mYgOXIAvcRLUg+8fjdJCCmqboHDE2/WDb8DM04LZXNKXQ6Ylgi+/C1B0PfXT
 3JnSpcutUlQdLzDzJoAsVoJB9wa53Zlp6+eVDhaDcxHljr9UBsPgS/rVjpj8UuV68o5c
 L4aQ==
X-Gm-Message-State: AOJu0YxC4QDbvhmIZma6cp/ynOUFVpnTVQpNPObAee62QNrsThB0FyoV
 QoV9W5pUMX4ePANnXGp1tNUP6slxiTzlOytPHkgbyeZMombIFdynHxvmxA==
X-Google-Smtp-Source: AGHT+IGzN31Xg138l9RsIgn0a0SwSSBvF+RXuDdxfhqskyv/TigPSJ0dkH4MTGPTwuIvO1oeFvJcoQ==
X-Received: by 2002:a05:6e02:12ed:b0:377:14a7:fc7a with SMTP id
 e9e14a558f8ab-37cd0edf9d7mr91753315ab.12.1719861975766; 
 Mon, 01 Jul 2024 12:26:15 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bb73bbdaf2sm2418958173.18.2024.07.01.12.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 12:26:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 13:26:14 -0600
Message-Id: <20240701192614.1771654-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719861976; x=1720466776; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J0C92U4zwZJwO/fb/gAhAguDlSdQDJMxskCEP4OhATw=;
 b=SZDrZ2ZoIHF1DaRoUUFik8T1bjguOZU4K8D4EIBQD7+H6jLVCZNnPIsfUcn6xpBILR
 AWipkncV+Xjkh10zOH9qyv2FNulvkbd9RLuukLc3o3oePWu+YLH8R9ah3OUTIFjmoZzG
 ZSVas/yaSdcnKMUJNC+ct7kchNKoEmIbJPhYuk49iQK0ZgobLJzOVqxMckAOMJ8Ees8O
 RRVuZXUsrbNQL2su9HrimZhQHiX/D1UqlGtoTcwYUv/uDXjny0eGZZnzgsP5RC75zLvK
 2BB92pO5wnXT0gRaZUsP6Ka2M9Uhiwav/Zh5qRg+Hx8ozaf4Ummi0Yi5QZ5JfnBnBi5P
 Ns4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SZDrZ2Zo
Subject: [Buildroot] [PATCH 1/1] package/python-pycparser: bump to version
 2.22
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
https://github.com/eliben/pycparser/commit/0f6ef1efeee8c5fd5a7d1cde9117edeba2a08b82

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pycparser/python-pycparser.hash | 6 +++---
 package/python-pycparser/python-pycparser.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pycparser/python-pycparser.hash b/package/python-pycparser/python-pycparser.hash
index 34401a319a..3ec1862b75 100644
--- a/package/python-pycparser/python-pycparser.hash
+++ b/package/python-pycparser/python-pycparser.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycparser/json
-md5  48f7d743bf018f7bb2ffc5fb976d1492  pycparser-2.21.tar.gz
-sha256  e644fdec12f7872f86c58ff790da456218b10f863970249516d60a5eaca77206  pycparser-2.21.tar.gz
+md5  8922b0b1b53b419e3a38fba4aa43a348  pycparser-2.22.tar.gz
+sha256  491c8be9c040f5390f5bf44a5b07752bd07f56edf992381b05c701439eec10f6  pycparser-2.22.tar.gz
 # Locally computed sha256 checksums
-sha256  3e7df25b8dfb658c9a91501930d4d943b05087a8347c7e2b4325616af535047b  LICENSE
+sha256  0c846399369ea76ddd7b5c44fe6d16497415fcf015f5cbb508c24bf98b81c5b1  LICENSE
diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
index 1737c99a32..6d01844fb3 100644
--- a/package/python-pycparser/python-pycparser.mk
+++ b/package/python-pycparser/python-pycparser.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCPARSER_VERSION = 2.21
+PYTHON_PYCPARSER_VERSION = 2.22
 PYTHON_PYCPARSER_SOURCE = pycparser-$(PYTHON_PYCPARSER_VERSION).tar.gz
-PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/5e/0b/95d387f5f4433cb0f53ff7ad859bd2c6051051cebbb564f139a999ab46de
+PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/1d/b2/31537cf4b1ca988837256c910a668b553fceb8f069bedc4b1c826024b52c
 PYTHON_PYCPARSER_SETUP_TYPE = setuptools
 PYTHON_PYCPARSER_LICENSE = BSD-3-Clause
 PYTHON_PYCPARSER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
