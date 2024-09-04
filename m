Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9378CD4853
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 15:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68A3D6064A;
	Wed,  4 Sep 2024 15:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j73fT-50COlD; Wed,  4 Sep 2024 15:44:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D01560663
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D01560663;
	Wed,  4 Sep 2024 15:44:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE4541BF40B
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 15:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA1924042E
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 15:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iku4B8GcDgut for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 15:44:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1A709400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A709400B8
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A709400B8
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 15:44:25 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id E279C2C83885;
 Wed, 04 Sep 2024 17:44:22 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 17:44:16 +0200
Message-Id: <20240904154417.168646-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1725464663; bh=xJjoXWPt8cF4FKtdBFgXZ9H+yhlWOKl/rnXPu2k8YHQ=;
 h=From:To:Cc:Subject:Date;
 b=QopTmKocYNVVAy29q7nhIY3aZUHvxwP0f/99HaQ32urdOD44+/PKC4J1fWwPmV+R8
 TTISGh7rk2sQJegRictHaB/BYmYKHo1OsRzvviNHvx7bfproDekS92c3K5NKmNSj68
 DAsjsJLyOwrRNRQbmw05naBa0VW9evdRn64xShHhl1ClFpxtbp45cA1x56MJzCRUhE
 XNMYN3Q4Yi1AKpVwmEZAlx5qf95awv+6TTpAHakYrbqSVPS2hF3xiBoG3SMk9B/xU3
 R4eanmN3C6/a5qKUhWJ/Wf0vyzV2lQty0Q/X+IJpoVSz3jnOyGF414GmBDDatRCAgC
 joAqTfxBpfUwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=QopTmKoc
Subject: [Buildroot] [PATCH] package/python-django: security bump to 5.1.1
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
 Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
* CVE-2024-45230
* CVE-2024-45231

Further changes: https://docs.djangoproject.com/en/5.1/releases/5.1.1/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 8ddc221973..d39bf4d081 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  77f44885427c09458e1abd0b48e09517  Django-5.1.tar.gz
-sha256  848a5980e8efb76eea70872fb0e4bc5e371619c70fffbe48e3e1b50b2c09455d  Django-5.1.tar.gz
+md5  8024c23d7efe9e7acb04496ae22739c7  Django-5.1.1.tar.gz
+sha256  021ffb7fdab3d2d388bc8c7c2434eb9c1f6f4d09e6119010bbb1694dda286bc2  Django-5.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index de5d2a9d06..cfe23ab16b 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.1
+PYTHON_DJANGO_VERSION = 5.1.1
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/1e/0c/d854d25bb74a8a3b41e642bbd27fe6af12fadd0edfd07d487809cf0ef719
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/88/6f/8f57ed6dc88656edd4fcb35c50dd963f3cd79303bd711fb0160fc7fd6ab7
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
