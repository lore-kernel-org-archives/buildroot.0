Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245BACF07BF
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 08:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C502981570;
	Thu, 10 Oct 2024 08:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NnTF8dym8wPT; Thu, 10 Oct 2024 08:23:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D060981585
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D060981585;
	Thu, 10 Oct 2024 08:23:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A7B61BF3CD
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 08:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 473E540967
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 08:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qaco4OrFi5sL for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 08:23:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2F86A4095E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F86A4095E
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F86A4095E
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 08:23:04 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 9D5752C836C7;
 Thu, 10 Oct 2024 10:23:02 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 10:23:01 +0200
Message-Id: <20241010082301.1058555-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1728548582; bh=UiQVxBFZdEvn6xHXcOiRR8w/Txt3KsVUUI9p7a9185k=;
 h=From:To:Cc:Subject:Date;
 b=n7fSAmSg7vgGW9CftvLupLLOuzqT4R2srwmT3weGP752k+tDwOnYAVWSRv3o7yEZu
 UibmD2vem/GkUca9guq2DL7uTFktoADL3j4TOMcUAnf3im7RQz5mczdCSGm56jxT4A
 /zfZ99SiwZFKcDEQgyPYzSXFgAzNrpe2X6uh940kVHRWef0MXsuf5xq30148MKeFzE
 xBT1ZXcPKrbIlSUorinir1afOvg5yjgNuxhM1/8yw3w8Gg6to+w7HrqxLOkOfGAtmc
 WU35ldX1AfUKpFRYHm1ZOC+ruu2TYC+vOyD85vBHsd78bF19X1vy/rYfq8XLapPOIG
 cQTbFYpPZKLQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=n7fSAmSg
Subject: [Buildroot] [PATCH] package/python-uvicorn: bump to 0.31.1
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

* https://github.com/encode/uvicorn/releases/tag/0.31.0
* https://github.com/encode/uvicorn/releases/tag/0.31.1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-uvicorn/python-uvicorn.hash | 4 ++--
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index 57839debd2..2be7edd1dd 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  d75153180f8c19a1bf8299818d3acdb2  uvicorn-0.30.6.tar.gz
-sha256  4b15decdda1e72be08209e860a1e10e92439ad5b97cf44cc945fcbee66fc5788  uvicorn-0.30.6.tar.gz
+md5  db3a0ebc67364f41561c284e5f4b3461  uvicorn-0.31.1.tar.gz
+sha256  f5167919867b161b7bcaf32646c6a94cdbd4c3aa2eb5c17d36bb9aa5cfd8c493  uvicorn-0.31.1.tar.gz
 # Locally computed sha256 checksums
 sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index e9676d3765..23eb79623b 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.30.6
+PYTHON_UVICORN_VERSION = 0.31.1
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/5a/01/5e637e7aa9dd031be5376b9fb749ec20b86f5a5b6a49b87fabd374d5fa9f
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/76/87/a886eda9ed495a3a4506d5a125cd07c54524280718c4969bde88f075fe98
 PYTHON_UVICORN_SETUP_TYPE = pep517
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
