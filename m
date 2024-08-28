Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20187C54FB3
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 13:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8415400D1;
	Wed, 28 Aug 2024 13:14:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3D8rNAyVG3G; Wed, 28 Aug 2024 13:14:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FC8A401FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FC8A401FB;
	Wed, 28 Aug 2024 13:14:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6BF311BF980
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 13:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64C3940709
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 13:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e7RuQ4EIT4Js for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 13:14:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A8529406EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8529406EA
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8529406EA
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 13:14:53 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A30CC2C83811;
 Wed, 28 Aug 2024 15:14:50 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 28 Aug 2024 15:14:49 +0200
Message-Id: <20240828131449.438553-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1724850890; bh=ZdoUYt74Ve8HKoiaWClgN/7guKialZw0dd8H56pJomg=;
 h=From:To:Cc:Subject:Date;
 b=d1SgsILRZz8v1YxtWPlaA40hutXwsNbFNQY8v/Nd+GWsEhm84FZYC1MfpXQAfe2mo
 OWkFeT2+5BqO8q+rOWrVAnZilQQFWa60+Re1hV7jxZMGKEIDBUg3zoYja5wwsgROpu
 0aQW6bznav0cz1auEHaEMzVWd6UMarEfRVw2Sah1MQMgX6cDY2a9dnReywz/SKSV0J
 yvI9GuWptVgQmOHUuD3E0XVO9ZUpS203hC2XxzF3hKuRuWdUQVTGlvYQxDpFGGnNqV
 Obw6H/6inF1f+gqqZx9iv/uGH2mqWpRKJgdkLovAUpFYAAfVgE5YZHLlblRETI4qOc
 gz7jWuB2sK9Dw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=d1SgsILR
Subject: [Buildroot] [PATCH] package/python-pymodbus: bump to 3.7.2
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

Changelog:
* https://github.com/pymodbus-dev/pymodbus/releases/tag/v3.7.1
* https://github.com/pymodbus-dev/pymodbus/releases/tag/v3.7.2

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index 7c8f352de4..6727fbc571 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  3bdc2a574cbfd10ec6dddf38c3f26598  pymodbus-3.7.0.tar.gz
-sha256  5c772babaa61a65ff908293faa668aedcd9d9e10f4bcf5c77a8fe51a6fd9ed47  pymodbus-3.7.0.tar.gz
+md5  1e1cc27f4a7911a8554190156a441089  pymodbus-3.7.2.tar.gz
+sha256  6cc63a14c8cca83f5b6d9dae3319565061bd49503ee7282df681201c16357eef  pymodbus-3.7.2.tar.gz
 # Locally computed sha256 checksums
 sha256  47f904249172e795a6b32de91f471073297befffd74e17cafc288d348a55972e  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 6a7c384cf6..ab8f72fb8c 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.7.0
+PYTHON_PYMODBUS_VERSION = 3.7.2
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/cc/83/de0c3596f17ac4833f591e96cafee7ae6109d846d607387b48f88d66759a
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/a2/f1/10be9b46fa9389271eeec8cb022680ff701ef97bcdd47d0e4a1fa464c057
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
