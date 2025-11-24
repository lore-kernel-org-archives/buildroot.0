Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BE0CFD318
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 17:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D35796108C;
	Mon, 24 Nov 2025 17:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4ChAdPJYLJQ; Mon, 24 Nov 2025 17:04:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C08156109D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C08156109D;
	Mon, 24 Nov 2025 17:04:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E80E34E
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 17:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07EA983CF4
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 17:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVQml567wEwb for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 17:04:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2FC1183CF3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FC1183CF3
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FC1183CF3
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 17:04:16 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 468192C80043;
 Mon, 24 Nov 2025 18:04:13 +0100 (CET)
From: Marcus Hoffmann <buildroot@bubu1.eu>
To: buildroot@buildroot.org
Date: Mon, 24 Nov 2025 18:04:11 +0100
Message-ID: <20251124170411.3128797-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1764003853; bh=yDj1ItQqgsJTi661zlZqJG48VElxnNTy8bHx0roQLjw=;
 h=From:To:Cc:Subject:Date;
 b=DzHPXMdwRBUIEx8VmqLbukerQO/sSFW4WoasiTiAsLwh8OCz9Rvn1ttnRc+e/yUTG
 d36oRw1aJGbqMRbZRCSUIY2LTRsfqtSHzNBubrUb0mUvs5W0udWQUZU8dmYLuudnaF
 04Y5Hh5kyb4qp2j2VKxmpD9p10Iso542Ak1pmbCi3lu2m6touk8wX3tJ5BWQgQ/Mze
 jIjkozTgAmL7/hz9woB49YU4linh8MYjFp5xjU2c4Ga05TQ2kAL6vfKiL3vphMTgxp
 6L9X0gh+KFiGk/lFEzK6IBEjjrKPFKd3fz0YvyiZBI6x5cf923SdMmR6PvIq9DGOiI
 UmqdTLJ80ipHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=DzHPXMdw
Subject: [Buildroot] [PATCH] package/python-asgiref: bump to 3.11.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/django/asgiref/blob/3.11.0/CHANGELOG.txt

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-asgiref/python-asgiref.hash | 4 ++--
 package/python-asgiref/python-asgiref.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asgiref/python-asgiref.hash b/package/python-asgiref/python-asgiref.hash
index 4605835abb..89495e0257 100644
--- a/package/python-asgiref/python-asgiref.hash
+++ b/package/python-asgiref/python-asgiref.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asgiref/json
-md5  6799fce19314e0aaeb789a6d0f6d45fa  asgiref-3.10.0.tar.gz
-sha256  d89f2d8cd8b56dada7d52fa7dc8075baa08fb836560710d38c292a7a3f78c04e  asgiref-3.10.0.tar.gz
+md5  554794453502d266a90d2254fcb1f7c3  asgiref-3.11.0.tar.gz
+sha256  13acff32519542a1736223fb79a715acdebe24286d98e8b164a73085f40da2c4  asgiref-3.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-asgiref/python-asgiref.mk b/package/python-asgiref/python-asgiref.mk
index 3bd9c8f937..e5885a66c6 100644
--- a/package/python-asgiref/python-asgiref.mk
+++ b/package/python-asgiref/python-asgiref.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASGIREF_VERSION = 3.10.0
+PYTHON_ASGIREF_VERSION = 3.11.0
 PYTHON_ASGIREF_SOURCE = asgiref-$(PYTHON_ASGIREF_VERSION).tar.gz
-PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/46/08/4dfec9b90758a59acc6be32ac82e98d1fbfc321cb5cfa410436dbacf821c
+PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/76/b9/4db2509eabd14b4a8c71d1b24c8d5734c52b8560a7b1e1a8b56c8d25568b
 PYTHON_ASGIREF_SETUP_TYPE = setuptools
 PYTHON_ASGIREF_LICENSE = BSD-3-Clause
 PYTHON_ASGIREF_LICENSE_FILES = LICENSE
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
