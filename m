Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAE1C4829B
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 09:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44C8A41479;
	Mon, 12 Feb 2024 09:58:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f3g0Nv3Uo7p4; Mon, 12 Feb 2024 09:58:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BAED40B61
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BAED40B61;
	Mon, 12 Feb 2024 09:58:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5519D1BF292
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 09:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C00640B61
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 09:58:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y1bh5Yb_avrV for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 09:58:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7C70340B1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C70340B1A
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7C70340B1A
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 09:58:07 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id E01C72C837B0;
 Mon, 12 Feb 2024 10:58:04 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 10:58:03 +0100
Message-Id: <20240212095804.12454-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707731885; bh=3lecBK6yxa1/9DMV25ibaO9NJAlwYiSNbF7ac5IyOAs=;
 h=From:To:Cc:Subject:Date;
 b=h/TfvPLMoC9KEy2+31hIftrfWKCxfb1yGaj0LiFbYexp5Vt0mPC2avIAXFaOnDhs+
 nz2EVJzh7PFuWIvD5KoHQVudwlLqVBZ8rDvFVlQiD/OTjZYCb0FBzJ2agBueFBB0CC
 r/XnWmvYDikKqD6wsGjVODE3AFvHFomV1jp1gJ7jOefvhKD0BAmubbfQSxT3XqTbLe
 x+jZOANi3/Umz8qX70LJmPcnSZO+6gQv4iYqJcEhHyGq9cD7cf14P0aXnWUtB8pmcn
 p481i+xFR28zDwK0wO2T0iAXKVefQYUmVH3Nu/tSrzJ2MGeBDbvNhwa9lwIPwEevOR
 oC1f7XBiXHUIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=h/TfvPLM
Subject: [Buildroot] [PATCH] package/uvicorn: bump to 0.27.1
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
https://github.com/encode/uvicorn/blob/master/CHANGELOG.md#0271---2024-02-10
---
 package/python-uvicorn/python-uvicorn.hash | 4 ++--
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index c7feaf3bfe..773995ab9d 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  a98f96c2578d9e6d454e271d0eae3ba3  uvicorn-0.27.0.post1.tar.gz
-sha256  54898fcd80c13ff1cd28bf77b04ec9dbd8ff60c5259b499b4b12bb0917f22907  uvicorn-0.27.0.post1.tar.gz
+md5  98f40515e34fb49e9d2842b6a147acec  uvicorn-0.27.1.tar.gz
+sha256  3d9a267296243532db80c83a959a3400502165ade2c1338dea4e67915fd4745a  uvicorn-0.27.1.tar.gz
 # Locally computed sha256 checksums
 sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index 502cc06ad8..899b9660f6 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.27.0.post1
+PYTHON_UVICORN_VERSION = 0.27.1
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/38/56/7bc5cf1d693d0c8e5d9dd66c29808691c17260b31346e4ddfbee26ba9bc2
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/09/d8/8aa69c76585035ca81851d99c3b00fd6be050aefd478a5376ff9fc5feb69
 PYTHON_UVICORN_SETUP_TYPE = pep517
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
