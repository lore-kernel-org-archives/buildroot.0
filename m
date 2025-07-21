Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEB1C83F1A
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 23:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E45C34290E;
	Mon, 21 Jul 2025 23:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v7TgkJI2Vba5; Mon, 21 Jul 2025 23:04:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6596428F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6596428F2;
	Mon, 21 Jul 2025 23:04:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CB41E0
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 23:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAD754037F
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 23:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xnd29gIB5jO for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 23:04:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98B5040105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98B5040105
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98B5040105
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 23:04:03 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 63C62B0055A;
 Tue, 22 Jul 2025 01:03:57 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 22 Jul 2025 01:03:53 +0200
Message-ID: <20250721230353.1404173-1-ju.o@free.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753139040;
 bh=77+zOH/SZhcv5RJyaiAl4geBmnQrsa42gOuFv0rCnAw=;
 h=From:To:Cc:Subject:Date:From;
 b=qxMU05zHJMeckwNXH5MK689P9VrSFwYr1U2k+BXpCpvJgTOos8weaLDTiIGVR2fJh
 mroHpR9DtTfFMt2SfBquzzpjNdStIlrcJDYe6WD/XNfs2PriuhRiqpsM2Mot2HLtCt
 bO3zltHTA0DHykCzb6ZWguWmq4UaRGdvx/hWy9FfY0myeRFEiimaW4Yh0Y2WG53OTo
 Y9Krx2Y1Lvfu2nvigF3H2e+YiXB8IaHsUzw8N5BF68HMqnvmiw56sn27fEXCPBAb2C
 PnqFf00aAePhEJQ4XCmml+BUI06eCP67P/QXUT38OObNKigYiz6XC+3wSYiNQ1xwcG
 MGI5iRom8oS4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qxMU05zH
Subject: [Buildroot] [PATCH 1/1] package/python-magic-wormhole: bump to
 version 0.19.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since version 0.17.0, see:
https://github.com/magic-wormhole/magic-wormhole/blob/0.19.2/NEWS.md

Note that, since v0.18.0, magic-wormhole is using python-qrcode. This
commit reflects that change by adding this new runtime dependency in
Config.in.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-magic-wormhole/Config.in                  | 1 +
 package/python-magic-wormhole/python-magic-wormhole.hash | 4 ++--
 package/python-magic-wormhole/python-magic-wormhole.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-magic-wormhole/Config.in b/package/python-magic-wormhole/Config.in
index bb1cbb546a..57db1bde78 100644
--- a/package/python-magic-wormhole/Config.in
+++ b/package/python-magic-wormhole/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_PYTHON_MAGIC_WORMHOLE
 	select BR2_PACKAGE_PYTHON_HUMANIZE # runtime
 	select BR2_PACKAGE_PYTHON_ITERABLE_IO # runtime
 	select BR2_PACKAGE_PYTHON_PYNACL # runtime
+	select BR2_PACKAGE_PYTHON_QRCODE # runtime
 	select BR2_PACKAGE_PYTHON_SPAKE2 # runtime
 	select BR2_PACKAGE_PYTHON_TQDM # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
diff --git a/package/python-magic-wormhole/python-magic-wormhole.hash b/package/python-magic-wormhole/python-magic-wormhole.hash
index 38ac016f0d..8ba2c04993 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.hash
+++ b/package/python-magic-wormhole/python-magic-wormhole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/magic-wormhole/json
-md5  61143e1480353de7b502d1b904837fb0  magic_wormhole-0.17.0.tar.gz
-sha256  142c7a271684b0b04470792601848f6b0ade0d8bf54fbcb30c6259d75edd9d06  magic_wormhole-0.17.0.tar.gz
+md5  37fdc279a6b55f52945098850a381708  magic_wormhole-0.19.2.tar.gz
+sha256  b2b4a78acf09ff4cfc503a238f674394a5e735fa08dcd54519243ffc67f97c71  magic_wormhole-0.19.2.tar.gz
 # Locally computed sha256 checksums
 sha256  4a9cc2415c52cef591b6822eee68fed36d7e6d80284b09638cff61d762d99060  LICENSE
diff --git a/package/python-magic-wormhole/python-magic-wormhole.mk b/package/python-magic-wormhole/python-magic-wormhole.mk
index 37fddf6c21..ce146181f7 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.mk
+++ b/package/python-magic-wormhole/python-magic-wormhole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAGIC_WORMHOLE_VERSION = 0.17.0
+PYTHON_MAGIC_WORMHOLE_VERSION = 0.19.2
 PYTHON_MAGIC_WORMHOLE_SOURCE = magic_wormhole-$(PYTHON_MAGIC_WORMHOLE_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/1b/a8/32a54e75643206665f569dac6ab19727aefb508b148882f1d05dff003667
+PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/e0/5b/4aff155b8e8ead4bc7c6aa3d1c19dc75aac2315e0c9b12f4e2f246b40141
 PYTHON_MAGIC_WORMHOLE_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_LICENSE_FILES = LICENSE
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
