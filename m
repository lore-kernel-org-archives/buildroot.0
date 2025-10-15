Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FB7CCD193
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 12:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9656614AB;
	Wed, 15 Oct 2025 12:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymzqtq7jLqfu; Wed, 15 Oct 2025 12:02:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DAF7614C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DAF7614C5;
	Wed, 15 Oct 2025 12:02:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF0181C9
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 12:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C533A40AF5
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 12:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PHx_1GRCRY3g for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 12:02:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E7A14409EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7A14409EB
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7A14409EB
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 12:02:41 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id BD7D82C80CE5;
 Wed, 15 Oct 2025 14:02:39 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 15 Oct 2025 14:02:39 +0200
Message-ID: <20251015120240.2793382-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1760529759; bh=TNuROR1aETPm1AOkf+P8AvWUKuJsUj2E89ScVKC9Xgg=;
 h=From:To:Cc:Subject:Date;
 b=qezEl32N3eEuKjXYyQYpojeLA6B4TGYneO/jwo2MNYR5r9AnCH3SrK/IXyCDfJBNz
 nK1m9NUjsweHJh7maB66lXPsCCPgxhDY8C921+Q/2vmxV4I2vqUzzoNnjvsYiORyiA
 mjKtK4UqHD+T7CZ08QjMx1sUzlQ3sezON64qZHYl/CGDAQ+JmeNM4/k8I22KXcCTVt
 y2vhpNpmUGU2q6WQhdMVeTBeeTbEFvpMuvSQKLYT0luh9EnCUaOvbNo0lV3MRe3PFh
 URL39zNv+tx5iP++MzWFsMmuBkiPLW51sAX6lGoHIdrAm75BygcOdJGWbpjWHjOupo
 dsT2rvb9PU5Gg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=qezEl32N
Subject: [Buildroot] [PATCH] package/python-asgiref: bump to 3.10.0
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

CHANGELOG: https://github.com/django/asgiref/blob/2138f0317d79cedd065571447ae0a7571989550e/CHANGELOG.txt#L1-L13

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-asgiref/python-asgiref.hash | 4 ++--
 package/python-asgiref/python-asgiref.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asgiref/python-asgiref.hash b/package/python-asgiref/python-asgiref.hash
index e7cda89f4d..4605835abb 100644
--- a/package/python-asgiref/python-asgiref.hash
+++ b/package/python-asgiref/python-asgiref.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asgiref/json
-md5  f4151a69f1fc33dd69c237515bbf9c92  asgiref-3.9.1.tar.gz
-sha256  a5ab6582236218e5ef1648f242fd9f10626cfd4de8dc377db215d5d5098e3142  asgiref-3.9.1.tar.gz
+md5  6799fce19314e0aaeb789a6d0f6d45fa  asgiref-3.10.0.tar.gz
+sha256  d89f2d8cd8b56dada7d52fa7dc8075baa08fb836560710d38c292a7a3f78c04e  asgiref-3.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-asgiref/python-asgiref.mk b/package/python-asgiref/python-asgiref.mk
index 22cb1077db..3bd9c8f937 100644
--- a/package/python-asgiref/python-asgiref.mk
+++ b/package/python-asgiref/python-asgiref.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASGIREF_VERSION = 3.9.1
+PYTHON_ASGIREF_VERSION = 3.10.0
 PYTHON_ASGIREF_SOURCE = asgiref-$(PYTHON_ASGIREF_VERSION).tar.gz
-PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/90/61/0aa957eec22ff70b830b22ff91f825e70e1ef732c06666a805730f28b36b
+PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/46/08/4dfec9b90758a59acc6be32ac82e98d1fbfc321cb5cfa410436dbacf821c
 PYTHON_ASGIREF_SETUP_TYPE = setuptools
 PYTHON_ASGIREF_LICENSE = BSD-3-Clause
 PYTHON_ASGIREF_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
