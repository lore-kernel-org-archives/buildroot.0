Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CA3C3ABCD
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 13:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43925409DD;
	Mon, 12 May 2025 13:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HblA5FYrKw1A; Mon, 12 May 2025 13:21:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 277CB409B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 277CB409B1;
	Mon, 12 May 2025 13:21:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B50D150
 for <buildroot@buildroot.org>; Mon, 12 May 2025 13:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70B1A40B0D
 for <buildroot@buildroot.org>; Mon, 12 May 2025 13:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fm6lPh1Q9Sj for <buildroot@buildroot.org>;
 Mon, 12 May 2025 13:21:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 52F9940A11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52F9940A11
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52F9940A11
 for <buildroot@buildroot.org>; Mon, 12 May 2025 13:21:01 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id D5A672C84435;
 Mon, 12 May 2025 15:20:58 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 12 May 2025 15:20:56 +0200
Message-ID: <20250512132058.1249467-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747056059; bh=tocrUrBWHwv7yP2XUhgtaOpq+U1USseLKRko0C7qc0A=;
 h=From:To:Cc:Subject:Date;
 b=EeIzkDSHzNUafbnnmt5SZbqDzJi/QY01pmfYn21OqUWItOjheJ7DxmAY/QR2nnVvC
 ZJ9MlJ+cVAXTSylR/UBSeyiM0U+US961yVuoI20YB/9bC+hPwiR2ZgFVqUYWMHvboF
 S6bU9YpwFukNPAll5ql7SZjxmhqVBNw+BO+z/Uoy8h5UFEFV7AiHmwOeZtehovk1n9
 XNFdIFdKxRawX3YSwlWLSfAu7ZMMBJxu1pHcIc5YpdM0Av5kfhLFcftts1TYmKhTnb
 EN7P9erx8aezAbhHhXREo+VC8+FmTWlH3nLbKNi4XhCj45Hnfq3ikFLeF5xYqRt1UE
 nkTWO8pnzGxXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=EeIzkDSH
Subject: [Buildroot] [PATCH] package/python-click: bump to 8.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update package help text to reflect upstream project description.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-click/Config.in         | 3 +--
 package/python-click/python-click.hash | 4 ++--
 package/python-click/python-click.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-click/Config.in b/package/python-click/Config.in
index c026998677..0fd43d5fb1 100644
--- a/package/python-click/Config.in
+++ b/package/python-click/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_CLICK
 	bool "python-click"
 	help
-	  A simple wrapper around optparse for powerful command line
-	  utilities.
+	  Python composable command line interface toolkit.
 
 	  https://pypi.python.org/pypi/click
diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
index 3511954a5d..c1076cc858 100644
--- a/package/python-click/python-click.hash
+++ b/package/python-click/python-click.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/click/json
-md5  b52ee8e6c33d88a2b4626e6a6002245d  click-8.1.8.tar.gz
-sha256  ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a  click-8.1.8.tar.gz
+md5  b9d7fc7a25f30674c85da6f460628a17  click-8.2.0.tar.gz
+sha256  f5452aeddd9988eefa20f90f05ab66f17fce1ee2a36907fd30b05bbb5953814d  click-8.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.txt
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index 8597c65cec..e457b03b8b 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CLICK_VERSION = 8.1.8
+PYTHON_CLICK_VERSION = 8.2.0
 PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
-PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/b9/2e/0090cbf739cee7d23781ad4b89a9894a41538e4fcf4c31dcdd705b78eb8b
+PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/cd/0f/62ca20172d4f87d93cf89665fbaedcd560ac48b465bd1d92bfc7ea6b0a41
 PYTHON_CLICK_SETUP_TYPE = flit
 PYTHON_CLICK_LICENSE = BSD-3-Clause
 PYTHON_CLICK_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
