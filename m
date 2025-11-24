Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79E8CFD313
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 14:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7980B80DDD;
	Mon, 24 Nov 2025 14:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Pto6vk3sCPU; Mon, 24 Nov 2025 14:37:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CB8580DF8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CB8580DF8;
	Mon, 24 Nov 2025 14:37:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C84D7E4
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE10D607E3
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1hGNrZd_6GNh for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 14:37:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4EE68607D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EE68607D8
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EE68607D8
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:37:50 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id B5B242C80043;
 Mon, 24 Nov 2025 15:37:47 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 24 Nov 2025 15:37:48 +0100
Message-ID: <20251124143748.2843324-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1763995067; bh=AcnaxYUVAPJ0m7Ew3bP7VN0gsWutHmNvobUxH2DXzXk=;
 h=From:To:Cc:Subject:Date;
 b=sxiBPsbhxA31OlUBY0uqJM/3SPqNR+SvmfkVtJv4RYdSI9RBcYl6rJI5uZDWUFF8x
 leBW9xWtvFDPOhbjiYrPBWpdbkliKcXfYNmAibhzFeLJ8WyJDajwmCfxwCUhMGHwJ5
 uYc8+5uOVZZ8wwbtQjEVngSQfOKISTMVfI4kCBtXaBKWog4Kup14deJEKyu2yrzI2A
 Fj6J4GYA7I4TCBedS6S0boSejep23zaSgw1KiS+61QjzvgiOo6FMcBR0sEJwaamT+a
 s4EhUY4hbAY0cnMCkEGArOZtMCz2HJ17V8KqHFcDwM3JPTCUYDVb2RNfzYs8GiHZCW
 SLBE1P5B9pZMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=sxiBPsbh
Subject: [Buildroot] [PATCH] package/python-apscheduler: bump to 3.11.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/agronholm/apscheduler/releases/tag/3.11.1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-apscheduler/python-apscheduler.hash | 4 ++--
 package/python-apscheduler/python-apscheduler.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-apscheduler/python-apscheduler.hash b/package/python-apscheduler/python-apscheduler.hash
index 1f2ba1f82e..55026aec7b 100644
--- a/package/python-apscheduler/python-apscheduler.hash
+++ b/package/python-apscheduler/python-apscheduler.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/apscheduler/json
-md5  1705663d09aeb1b174f964780c57520a  apscheduler-3.11.0.tar.gz
-sha256  4c622d250b0955a65d5d0eb91c33e6d43fd879834bf541e0a18661ae60460133  apscheduler-3.11.0.tar.gz
+md5  ff8d1731e31d88e2e1fd0794099c920f  apscheduler-3.11.1.tar.gz
+sha256  0db77af6400c84d1747fe98a04b8b58f0080c77d11d338c4f507a9752880f221  apscheduler-3.11.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE.txt
diff --git a/package/python-apscheduler/python-apscheduler.mk b/package/python-apscheduler/python-apscheduler.mk
index c5d89c5c2d..b03022149f 100644
--- a/package/python-apscheduler/python-apscheduler.mk
+++ b/package/python-apscheduler/python-apscheduler.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_APSCHEDULER_VERSION = 3.11.0
+PYTHON_APSCHEDULER_VERSION = 3.11.1
 PYTHON_APSCHEDULER_SOURCE = apscheduler-$(PYTHON_APSCHEDULER_VERSION).tar.gz
-PYTHON_APSCHEDULER_SITE = https://files.pythonhosted.org/packages/4e/00/6d6814ddc19be2df62c8c898c4df6b5b1914f3bd024b780028caa392d186
+PYTHON_APSCHEDULER_SITE = https://files.pythonhosted.org/packages/d0/81/192db4f8471de5bc1f0d098783decffb1e6e69c4f8b4bc6711094691950b
 PYTHON_APSCHEDULER_SETUP_TYPE = setuptools
 PYTHON_APSCHEDULER_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_APSCHEDULER_LICENSE = MIT
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
