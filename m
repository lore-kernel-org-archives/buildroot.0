Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA32C54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 12:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8AC581A39;
	Mon, 25 Mar 2024 12:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9WgBsMqXtoJG; Mon, 25 Mar 2024 12:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF66681ADE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF66681ADE;
	Mon, 25 Mar 2024 12:17:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 234C31BF393
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 12:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1037781DF5
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 12:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nf33W0rk5B64 for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 12:17:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 03A2C81A39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03A2C81A39
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03A2C81A39
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 12:17:04 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 155762C80C87;
 Mon, 25 Mar 2024 13:17:01 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 13:16:57 +0100
Message-Id: <20240325121700.145815-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1711369021; bh=VtY7U83hGCIOzoFDkZS2nGu29/ZYYBMU3n1n7+bbGHM=;
 h=From:To:Cc:Subject:Date;
 b=qc1ZAK6vxsW3il0d1dZLMm0K9ViOLx8sDffbcyqC1BvtE0Rea57yLVmkSG2WPm8iI
 FMtdlpP+gdmT/ckyl8BVUYT9SlvgYXZopQUaf57lYrZq3e8cWXM5QikFGTPBsBp9kH
 Y7fceGLKmj2KNJlAuTsfBakRiJCQ5NRQ8T3+LYS1ECH9KrURf5Fm8hrVxfWSWOA2GY
 uMeVbASfYxUKPIyibF9vnGvzGLThdLe1FaJQS4jmTgEZ7FXWDzvhYqaLbM0jtnzR58
 hiVo4PJKLFPTmEkcSK+nYyoap0wfBWOHXxKLK7sKsjByJDnkfuLW4wZMaHVJYZDcSa
 QQjshTfFhRYwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=qc1ZAK6v
Subject: [Buildroot] [PATCH 1/3] package/python-trove-classifiers: bump to
 version 2024.3.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 .../python-trove-classifiers/python-trove-classifiers.hash    | 4 ++--
 package/python-trove-classifiers/python-trove-classifiers.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trove-classifiers/python-trove-classifiers.hash b/package/python-trove-classifiers/python-trove-classifiers.hash
index 26b813eded..2aac714a37 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.hash
+++ b/package/python-trove-classifiers/python-trove-classifiers.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/trove-classifiers/json
-md5  2afa6925489403b8025a1b66d990e760  trove-classifiers-2023.10.18.tar.gz
-sha256  2cdfcc7f31f7ffdd57666a9957296089ac72daad4d11ab5005060e5cd7e29939  trove-classifiers-2023.10.18.tar.gz
+md5  1e574abaf8803bab35289ab54d6bb251  trove-classifiers-2024.3.3.tar.gz
+sha256  df7edff9c67ff86b733628998330b180e81d125b1e096536d83ac0fd79673fdc  trove-classifiers-2024.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-trove-classifiers/python-trove-classifiers.mk b/package/python-trove-classifiers/python-trove-classifiers.mk
index d0d79d297c..5bfd045c38 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.mk
+++ b/package/python-trove-classifiers/python-trove-classifiers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TROVE_CLASSIFIERS_VERSION = 2023.10.18
+PYTHON_TROVE_CLASSIFIERS_VERSION = 2024.3.3
 PYTHON_TROVE_CLASSIFIERS_SOURCE = trove-classifiers-$(PYTHON_TROVE_CLASSIFIERS_VERSION).tar.gz
-PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/5b/fa/49b6a09e4f389d4d9406d2947a685de1462ffb676ea6e61c50905e27b0f4
+PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/13/11/e13906315b498cb8f5ce5a7ff39fc35941e8291e914158157937fd1c095d
 PYTHON_TROVE_CLASSIFIERS_SETUP_TYPE = setuptools
 PYTHON_TROVE_CLASSIFIERS_LICENSE = Apache-2.0
 PYTHON_TROVE_CLASSIFIERS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
