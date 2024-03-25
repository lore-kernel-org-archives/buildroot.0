Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17CDC54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 12:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B81781E39;
	Mon, 25 Mar 2024 12:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcnEgDwov4T2; Mon, 25 Mar 2024 12:17:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A25181E0C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A25181E0C;
	Mon, 25 Mar 2024 12:17:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B62B1BF955
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 12:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 286AD606E9
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 12:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rm6RjsaLk-7v for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 12:17:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 113F360838
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 113F360838
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 113F360838
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 12:17:06 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id ADEA92C839A1;
 Mon, 25 Mar 2024 13:17:04 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 13:16:59 +0100
Message-Id: <20240325121700.145815-3-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325121700.145815-1-buildroot@bubu1.eu>
References: <20240325121700.145815-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1711369024; bh=GLKQF1dNQFEVWVkUz7IEtN/W+Dv10bi9mCOGXL7PEOA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=TlOtFd+HEABiGNSTZd7mogRvAgHQ8l34KQuG72BCAhhy9c2DklopGg2AzVwnu5jzc
 AmH9vBPzomcq678IwATPFENdrE1ZWDM6KFhMvwShx6of2AjyWyQjVjtfukRJ7CbbV6
 g1Na5jBJlSLcc7MEZBcjtsvXjNTdEL3D4irHwnVJ+r/NL4EthNCZEK+y/QtVcnR2fz
 G/Or/8qPoHdUuesONs1PlACtwqKH3UxWt1WUkBniOw7nExvNOw6VlNA0XBykHMh86U
 O5WKp8KtOtzVNg0+luxRKFcioEFliUHUnwrU6hZ8mVVc/ZUXQu/WAvR8MABoUCZfut
 r2OyO91k48/Zg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=TlOtFd+H
Subject: [Buildroot] [PATCH 3/3] package/python-pluggy: bump to version 1.4.0
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/pytest-dev/pluggy/blob/main/CHANGELOG.rst#pluggy-140-2024-01-24

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-pluggy/python-pluggy.hash | 4 ++--
 package/python-pluggy/python-pluggy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pluggy/python-pluggy.hash b/package/python-pluggy/python-pluggy.hash
index 74790a51a0..338b08d0b1 100644
--- a/package/python-pluggy/python-pluggy.hash
+++ b/package/python-pluggy/python-pluggy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pluggy/json
-md5  f31aad77be2f5af8ed3864159b7fd743  pluggy-1.3.0.tar.gz
-sha256  cf61ae8f126ac6f7c451172cf30e3e43d3ca77615509771b3a984a0730651e12  pluggy-1.3.0.tar.gz
+md5  ffb69741271eaeefab3f2ef2435e2d5f  pluggy-1.4.0.tar.gz
+sha256  8c85c2876142a764e5b7548e7d9a0e0ddb46f5185161049a79b7e974454223be  pluggy-1.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d6b65e6c213a5d0b577911d34d6e5949b9f59d76c238c5071a2f3fc16cfb2606  LICENSE
diff --git a/package/python-pluggy/python-pluggy.mk b/package/python-pluggy/python-pluggy.mk
index 2b7ac04f02..a703a93b9c 100644
--- a/package/python-pluggy/python-pluggy.mk
+++ b/package/python-pluggy/python-pluggy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLUGGY_VERSION = 1.3.0
+PYTHON_PLUGGY_VERSION = 1.4.0
 PYTHON_PLUGGY_SOURCE = pluggy-$(PYTHON_PLUGGY_VERSION).tar.gz
-PYTHON_PLUGGY_SITE = https://files.pythonhosted.org/packages/36/51/04defc761583568cae5fd533abda3d40164cbdcf22dee5b7126ffef68a40
+PYTHON_PLUGGY_SITE = https://files.pythonhosted.org/packages/54/c6/43f9d44d92aed815e781ca25ba8c174257e27253a94630d21be8725a2b59
 PYTHON_PLUGGY_SETUP_TYPE = setuptools
 PYTHON_PLUGGY_LICENSE = MIT
 PYTHON_PLUGGY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
