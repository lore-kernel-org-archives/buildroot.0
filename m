Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F700C3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 21:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8096581F60;
	Mon, 12 May 2025 21:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-DjYInui5mZ; Mon, 12 May 2025 21:14:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8D5581F45
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8D5581F45;
	Mon, 12 May 2025 21:14:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F1C92154
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D516781F09
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TFOShDlSrEIZ for <buildroot@buildroot.org>;
 Mon, 12 May 2025 21:13:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3AA8881EAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AA8881EAE
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AA8881EAE
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:13:54 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 1E7B42C84448;
 Mon, 12 May 2025 23:13:52 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 12 May 2025 23:13:38 +0200
Message-ID: <20250512211344.721883-7-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512211344.721883-1-buildroot@bubu1.eu>
References: <20250512211344.721883-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747084432; bh=ZszEtBzvUcrOhKBVLF0MkO3LU8r1lzreFqNFm7JWxCU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=CxJoe/3cH2MAJA3V5laxMO5+Cw17sj3R55jdEIT3VofzNfy98c6AYjcSKucwD70b5
 9fbPzeckf6tojHMbRknP9qoatNYBzI1gMduTwQOmEXBNNc0Apf7SiCpirs5IjrOWni
 7FGIhPMozhw9SrY1MbAeuswKSgHIY5ddCsC91I0K3Ry7TFl8sitXKAPt6FwOjf9bPX
 QqIB3HAvfvJNWN6qwnK9ZU1nz2y1xY8FhyVT+RK6sfiywThYEb/fBiec9TYINbj3Tz
 ifn5y6Fk8yChHWNGTeKQu8TedN0zCS7cmHX+3OBJkHrj4bqSm/bMc+8n7EhgRJDsxY
 WsdCfawVmWKoA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=CxJoe/3c
Subject: [Buildroot] [PATCH 7/7] package/python-dotenv: bump to 1.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-dotenv/python-dotenv.hash | 4 ++--
 package/python-dotenv/python-dotenv.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-dotenv/python-dotenv.hash b/package/python-dotenv/python-dotenv.hash
index 710922fba3..c591dcf9b9 100644
--- a/package/python-dotenv/python-dotenv.hash
+++ b/package/python-dotenv/python-dotenv.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-dotenv/json
-md5  68abb78e05460ce558ca255de550e1ea  python-dotenv-1.0.1.tar.gz
-sha256  e324ee90a023d808f1959c46bcbc04446a10ced277783dc6ee09987c37ec10ca  python-dotenv-1.0.1.tar.gz
+md5  9bdf50416b1c59832d2f77ad6afdf0d8  python_dotenv-1.1.0.tar.gz
+sha256  41f90bc6f5f177fb41f53e87666db362025010eb28f60a01c9143bfa33a2b2d5  python_dotenv-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  80619b7049f08c81683ad0e01f08f257a840652dd71ee83146d36658c7d2c2b9  LICENSE
diff --git a/package/python-dotenv/python-dotenv.mk b/package/python-dotenv/python-dotenv.mk
index 324eea239e..c565a3e681 100644
--- a/package/python-dotenv/python-dotenv.mk
+++ b/package/python-dotenv/python-dotenv.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOTENV_VERSION = 1.0.1
-PYTHON_DOTENV_SITE = https://files.pythonhosted.org/packages/bc/57/e84d88dfe0aec03b7a2d4327012c1627ab5f03652216c63d49846d7a6c58
+PYTHON_DOTENV_VERSION = 1.1.0
+PYTHON_DOTENV_SOURCE = python_dotenv-$(PYTHON_DOTENV_VERSION).tar.gz
+PYTHON_DOTENV_SITE = https://files.pythonhosted.org/packages/88/2c/7bb1416c5620485aa793f2de31d3df393d3686aa8a8506d11e10e13c5baf
 PYTHON_DOTENV_SETUP_TYPE = setuptools
 PYTHON_DOTENV_LICENSE = BSD-3-Clause
 PYTHON_DOTENV_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
