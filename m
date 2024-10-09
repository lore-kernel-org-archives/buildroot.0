Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68163CEDD87
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 11:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2326740128;
	Wed,  9 Oct 2024 11:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aKwpvbVGlzqj; Wed,  9 Oct 2024 11:59:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C904140C3E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C904140C3E;
	Wed,  9 Oct 2024 11:59:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62DDE1BF215
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 11:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 506E640C3E
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 11:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JhZNJ3dbdWl6 for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 11:59:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 25AFA40C53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25AFA40C53
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25AFA40C53
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 11:59:18 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A07152C83C99;
 Wed, 09 Oct 2024 13:59:15 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 13:59:14 +0200
Message-Id: <20241009115915.922298-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1728475155; bh=hRxO1CDo88p49m2wNvBTN45wIdBIrr7Qix+YfVGm8vw=;
 h=From:To:Cc:Subject:Date;
 b=NnBu1pYiYh3bPUIvNdra3xAK5KrfUBid+vLa3K91LaKFw+FFdfErHEXnEfz+Z91Ga
 gHf+x4MpV5eSkaJeNQ3Nff4vXCtV4wyRS67uVMzUqtrCC3WxVALOhhKVapPauVN8NA
 mxs0hrT6SiBhWI2IaV6jX1AxsKEg8rQTdUX76vCR2MB6ZDBMU+EcSWVS0QD8dRjI3r
 nXJyT2r76fXY/9GNx7HX9JUUuDv+fiCqy8Z3w8Amc4uHF3ZbX5yyZZL7XaJnhRjuJ8
 8csC5ETIzOhlBTf4NFEFv5bsXF77NTlcBBIfe6w936GqdoBWSSGT/qj+ByVZLYEPD7
 /WK0SVVSW/rnA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=NnBu1pYi
Subject: [Buildroot] [PATCH] package/puython-pymodbus: bump to version 3.7.3
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes: https://github.com/pymodbus-dev/pymodbus/blob/dev/CHANGELOG.rst#version-373

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 6727fbc571..72b5b82019 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  1e1cc27f4a7911a8554190156a441089  pymodbus-3.7.2.tar.gz
-sha256  6cc63a14c8cca83f5b6d9dae3319565061bd49503ee7282df681201c16357eef  pymodbus-3.7.2.tar.gz
+md5  c7879e21035bb4fc5d22b473e097b353  pymodbus-3.7.3.tar.gz
+sha256  603490162382fe34258992e3b8fe8d2da573a08aa49257ee7ab7b5b1d1a6653c  pymodbus-3.7.3.tar.gz
 # Locally computed sha256 checksums
 sha256  47f904249172e795a6b32de91f471073297befffd74e17cafc288d348a55972e  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index ab8f72fb8c..6833e8d58b 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.7.2
+PYTHON_PYMODBUS_VERSION = 3.7.3
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/a2/f1/10be9b46fa9389271eeec8cb022680ff701ef97bcdd47d0e4a1fa464c057
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/af/33/3ccba09863981b2a3977933aa583b66ab65084bcb94aae4ec94ac23c9e39
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
