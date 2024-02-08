Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F193AC48260
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 14:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FADE41DC3;
	Thu,  8 Feb 2024 14:08:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5AxoGGW8HIaZ; Thu,  8 Feb 2024 14:08:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C95641D8C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C95641D8C;
	Thu,  8 Feb 2024 14:08:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 226E11BF369
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 14:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FCCF6FAC6
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 14:08:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y12eLsQKfPpT for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 14:08:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5DAEF6FAB0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DAEF6FAB0
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DAEF6FAB0
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 14:08:06 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A6F172C8386B;
 Thu,  8 Feb 2024 15:08:03 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu,  8 Feb 2024 15:08:01 +0100
Message-Id: <20240208140802.984184-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707401283; bh=XXiyoRUu0K4eVyg2jLDdzkS/ZRmk5tdV0g99fjrdCNU=;
 h=From:To:Cc:Subject:Date;
 b=shXhr4NAbInHmT8pVhCuyhawHLK3gHbmr798W1YbrVqn3bCWoWp9jgGYUXKhJC7YJ
 fKhRtuLeX6UGb0w0RQCBg19yMb8ecHwj+kA8hqR3AsyVL8e9pzbmWaKS1kRXgG4bPw
 QkDz3yNL+oBjWLUO3oo2hWGr21cXhVVMyiEmA6AQwbic3XElZS0zOUTiNW5/d+HX3F
 nRGzjjMtbPSAb6jGR8Y7vF3/r3AXFqlpwEHPTH0chRt1+T4pGm1akiHu43tab/trOL
 kCplGW3SW7eUM2Lk//3I7e5O/rhQSfH9AjLi2SXlqA3z6JE+jMe5qTFh7W7M+WXvt+
 cpqasVZPHD9rQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=shXhr4NA
Subject: [Buildroot] [PATCH] package/python-uvicorn: bump to 0.27.0.post1
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

Changelog:

https://github.com/encode/uvicorn/blob/master/CHANGELOG.md#0270post1---2024-01-29

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-uvicorn/python-uvicorn.hash | 4 ++--
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index cfa999e210..c7feaf3bfe 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  a1af843e7e305d551030abfa09dd3b15  uvicorn-0.24.0.post1.tar.gz
-sha256  09c8e5a79dc466bdf28dead50093957db184de356fcdc48697bad3bde4c2588e  uvicorn-0.24.0.post1.tar.gz
+md5  a98f96c2578d9e6d454e271d0eae3ba3  uvicorn-0.27.0.post1.tar.gz
+sha256  54898fcd80c13ff1cd28bf77b04ec9dbd8ff60c5259b499b4b12bb0917f22907  uvicorn-0.27.0.post1.tar.gz
 # Locally computed sha256 checksums
 sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index 04e6dd66a7..502cc06ad8 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.24.0.post1
+PYTHON_UVICORN_VERSION = 0.27.0.post1
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/e5/84/d43ce8fe6b31a316ef0ed04ea0d58cab981bdf7f17f8423491fa8b4f50b6
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/38/56/7bc5cf1d693d0c8e5d9dd66c29808691c17260b31346e4ddfbee26ba9bc2
 PYTHON_UVICORN_SETUP_TYPE = pep517
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
