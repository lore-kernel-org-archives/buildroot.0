Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E01C48BC4
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 09:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA98040343;
	Wed, 14 Feb 2024 09:31:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wn5enfvmQE8q; Wed, 14 Feb 2024 09:31:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1651404DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1651404DE;
	Wed, 14 Feb 2024 09:31:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1E871BF398
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 09:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC489822D7
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 09:31:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k281dymi044W for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 09:31:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C1586822C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1586822C8
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1586822C8
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 09:31:45 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 390902C80C0F;
 Wed, 14 Feb 2024 10:31:43 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 14 Feb 2024 10:31:41 +0100
Message-Id: <20240214093142.3423721-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707903103; bh=SSvpSHajVNfNOEKs4dxoNVg0YVjBZeKonjU+PNGIU48=;
 h=From:To:Cc:Subject:Date;
 b=IJ6nZm2uJQU4zgsoQGAuE6JhBaVEiWhZ32dY/hjrPxvWazROEtMaD8Acuz0TXv81s
 8l8IMhd3Yg+hHhoxEUidV9lbCvTpQTWCfShm8hCd7KC8Bot6MZw0WUD6kByf52hGmN
 /DenOr5oiOuekSrDnBrZb1fxMt05c4sBu/ZKCwHE9C/1IPTMZ3oZLnQCWq4KPaj8r9
 JsJ1c1LwCGj7IbDfsvMkj/s2/dTYf+kWXw9nC7bGNaVmO43ZN3fzdIvDDQYhpptUY1
 DBh1i9KSKAEzn13/C6frwetnflvRT2Z509aNBNQ2pIuLzASubSAOmuDOcFc6EHm5Gb
 zAk2gCz6Ji0Cw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=IJ6nZm2u
Subject: [Buildroot] [PATCH] package/python-pytz: bump to 2024.1
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
 package/python-pytz/python-pytz.hash | 4 ++--
 package/python-pytz/python-pytz.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
index be6f0e976b..a8bfe67817 100644
--- a/package/python-pytz/python-pytz.hash
+++ b/package/python-pytz/python-pytz.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytz/json
-md5  84e6569fcc917b096cca1063819c4ab0  pytz-2023.3.post1.tar.gz
-sha256  7b4fddbeb94a1eba4b557da24f19fdf9db575192544270a9101d8509f9f43d7b  pytz-2023.3.post1.tar.gz
+md5  b26bb090d1fe96064019bf7068eeb801  pytz-2024.1.tar.gz
+sha256  2a29735ea9c18baf14b448846bde5a48030ed267578472d8955cd0e7443a9812  pytz-2024.1.tar.gz
 # Locally computed sha256 checksums
 sha256  be8b1a37ebe26c592a90f6c0eb33103a7f383ce2f4d7498c0af9a526990a07b8  LICENSE.txt
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index 182d8156fc..300e26befe 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTZ_VERSION = 2023.3.post1
+PYTHON_PYTZ_VERSION = 2024.1
 PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
-PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/69/4f/7bf883f12ad496ecc9514cd9e267b29a68b3e9629661a2bbc24f80eff168
+PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/90/26/9f1f00a5d021fff16dee3de13d43e5e978f3d58928e129c3a62cf7eb9738
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
