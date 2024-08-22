Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E39C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 10:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DFEB80DC3;
	Thu, 22 Aug 2024 10:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFJf--igYs4Q; Thu, 22 Aug 2024 10:00:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F61A80CB4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F61A80CB4;
	Thu, 22 Aug 2024 10:00:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 87AB71BF35A
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 09:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81F5840231
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 09:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yzQXAOIOE6QS for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 09:59:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B3DF3400EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3DF3400EA
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3DF3400EA
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 09:59:57 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 78C6C2C85C6D;
 Thu, 22 Aug 2024 11:59:54 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 11:59:52 +0200
Message-Id: <20240822095953.524686-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1724320794; bh=+5GQMN6KzNgiGZn/Um90mDGolp8wwVaMqyFmn8K/8c4=;
 h=From:To:Cc:Subject:Date;
 b=cizD5GJ3uc0ZvR9fBUjNKa6CP/2QDOnhm6c8anj8ZjzLmIaxsTxDKEKyPrZ7E/AYc
 9UZLTOGyl46nMjcYBW0ACVQRVGf3DF9oPCsyS4jgkiCGxusjgSgkBcI+HcgnybXeLN
 063/UtWh4P8DYhmwBAt/TffsBTGdLKIlBbsWJTYSU7AimYVgw07wBvCZLe+vPYqKdG
 WMmN7/wZRQQ7gwVGNxJA7LZrzjEP2YQ5lOiP/DUNhTWNSKOmOtUWl/i7RL0bfGmoW/
 9y9p/xSMafyt3hJJU8LEqPTpqcjOFD9qfL0+kV+8TAkFFA45e1s58UJU1NUyDSbFdO
 JoU/plWDrFzTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=cizD5GJ3
Subject: [Buildroot] [PATCH 1/2] package/python-can: bump to 4.4.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The tarball name prefix changed from python-can to python_can.

Changelog:
* https://github.com/hardbyte/python-can/blob/main/CHANGELOG.md#version-442

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-can/python-can.hash | 4 ++--
 package/python-can/python-can.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
index 4e706519be..479935b2f0 100644
--- a/package/python-can/python-can.hash
+++ b/package/python-can/python-can.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-can/json
-md5  a84ace55fdeca8efd50986deacfba584  python-can-4.3.1.tar.gz
-sha256  008bea1c12e31586e1aa76971126b831bf01056a900e91862a11360e011ab933  python-can-4.3.1.tar.gz
+md5  20133a1b73b58c976bba6b0af8581f32  python_can-4.4.2.tar.gz
+sha256  1c46c0935f39f7a9c3e76b03249af0580689ebf7a1844195e92f87257f009df5  python_can-4.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index c7100e3dda..b6547a4d3f 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CAN_VERSION = 4.3.1
-PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/02/fc/d5fd33ee93f17a4eb0dcd75aebf522396e3f511bf474058e99e86ae4e33f
+PYTHON_CAN_VERSION = 4.4.2
+PYTHON_CAN_SOURCE = python_can-$(PYTHON_CAN_VERSION).tar.gz
+PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/a3/17/57c38abbf00993ac5ec306de0c00271685d1372ef3d907b107eb63ab13a8
 PYTHON_CAN_SETUP_TYPE = setuptools
 PYTHON_CAN_LICENSE = LGPL-3.0
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
