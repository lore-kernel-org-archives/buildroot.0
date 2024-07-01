Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5FCC2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 18:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CEEA80FA7;
	Mon,  1 Jul 2024 18:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PbVx4wtZqWup; Mon,  1 Jul 2024 18:40:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C4C68104B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C4C68104B;
	Mon,  1 Jul 2024 18:40:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4AFB01BF33C
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 439468104B
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 18:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1kOfEga9PMt9 for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 18:40:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 57D3F80FA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57D3F80FA7
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57D3F80FA7
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 18:40:01 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3738690172eso16343375ab.1
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 11:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719859200; x=1720464000;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o6lk33/PrTxDsWhuFwV8iN4b0X/6qFTPWxI8ndf/IAE=;
 b=WRdufT1rFeaUufKbr6DnIRALt1Fr8X+L7wBept6ehBOlrAanR9s/68kn4ExxddG7oV
 O7IjtKuAykx1YJ+fc4sTqJQhhyc6hHQtaBUEOMHL4riYcabAMI9WueTbKNiLAdJ2mgxC
 da5hR3NdNCoRItRskxfBv10EDcnuPmRjgHxLNfHVUZyKyZcZFV5Xx0tdqThx61vXovL/
 8yYkFuX0+CSqLP2zcpynSCaNDxADSbc9MBhYv0R/Q5Ok2TK/YhbVz1u6N9cTtCG4Npyf
 g6Fjo482GLlbKm+YswBEA9rYJXvCUFF0pV9MX5nlXULIw9PYeoht93DjF0KhAIvDqpvI
 emOw==
X-Gm-Message-State: AOJu0YwsLrU+/LjgIRk8j+oNvVWH5iBsbgc1d2D3iRJbjBo0t26P5lhq
 zNaD39vGEcAbnh2EZLK1xkQr3TqbrK57qAEL87+NOPyEw0LdftHaZlVsdA==
X-Google-Smtp-Source: AGHT+IHEauIqqT3+0J1dj0BvJAzuzjQfcSd+Fou5BXtBA7AFkJghBb9cVey/Asxd9N2/4CByuh4SVg==
X-Received: by 2002:a05:6e02:12e9:b0:37a:82f3:7073 with SMTP id
 e9e14a558f8ab-37cd2af93f5mr97362395ab.26.1719859200041; 
 Mon, 01 Jul 2024 11:40:00 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-37acf2b7219sm19951045ab.0.2024.07.01.11.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 11:39:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 12:39:58 -0600
Message-Id: <20240701183958.1748687-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719859200; x=1720464000; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o6lk33/PrTxDsWhuFwV8iN4b0X/6qFTPWxI8ndf/IAE=;
 b=Ba++H/Ak5h2geS6KEtfHT99A5lSOFL0owjQKfZSyyhIQDkd6M4hpc98pCm2wQ/n6nh
 P1r8dTh9muMPt1mB+EeL+Qq56c1OqjMAN3LsNeDm35MClXuab4Yl0INokiscWlcFOpTv
 Nm0+XoqJGf5Tyu+rCdwZmWTY6e9C6D5opuJGya3bBAUDm8fqMIj07e/xZavozMOvcRVQ
 eecelpxj2XROWVoA5584FvhURYdSCJduW8z0jcEopDLFjXa7Z6xw2qSbfWylO1nMC5GG
 t38D4nv2MULyqACFpv5xIE3ifxAD6ztojHfMu0oli7eEl5KWcPrNO9gRoLP/mfwuDQkq
 fQ3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ba++H/Ak
Subject: [Buildroot] [PATCH 1/1] package/python-idna: bump to version 3.7
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
https://github.com/kjd/idna/commit/1d365e17e10d72d0b7876316fc7b9ca0eebdd38d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-idna/python-idna.hash | 6 +++---
 package/python-idna/python-idna.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
index 5e6ac716a2..7b22841d88 100644
--- a/package/python-idna/python-idna.hash
+++ b/package/python-idna/python-idna.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/idna/json
-md5  70f4beef4feb196ac64b75a93271f53c  idna-3.6.tar.gz
-sha256  9ecdbbd083b06798ae1e86adcbfe8ab1479cf864e4ee30fe4e46a003d12491ca  idna-3.6.tar.gz
+md5  31cc572cb7a6519159c927c998c64c79  idna-3.7.tar.gz
+sha256  028ff3aadf0609c1fd278d8ea3089299412a7a8b9bd005dd08b9f8285bcb5cfc  idna-3.7.tar.gz
 # Locally computed sha256 checksums
-sha256  cb2faf0ca18c6d387ec7cb66f321939fba6e67e9dac09d31477cb9d8d3fe6899  LICENSE.md
+sha256  a59f0b0ef3635874109a4461ca44ff7a70d50696e814767bfaf721d4c9b0db0f  LICENSE.md
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index eb92432bd3..b3c012ed0d 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IDNA_VERSION = 3.6
+PYTHON_IDNA_VERSION = 3.7
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
-PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/bf/3f/ea4b9117521a1e9c50344b909be7886dd00a519552724809bb1f486986c2
+PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/21/ed/f86a79a07470cb07819390452f178b3bef1d375f2ec021ecfc709fc7cf07
 PYTHON_IDNA_LICENSE = BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.md
 PYTHON_IDNA_SETUP_TYPE = flit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
