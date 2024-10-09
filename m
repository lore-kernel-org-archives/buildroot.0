Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B25CEDD87
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 11:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7149540128;
	Wed,  9 Oct 2024 11:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p8o4Z3rVJZFv; Wed,  9 Oct 2024 11:55:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32241404AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32241404AB;
	Wed,  9 Oct 2024 11:55:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD49B1BF215
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 11:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC88340128
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 11:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id waY6eLeyQccj for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 11:55:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 03EBD40603
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03EBD40603
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03EBD40603
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 11:55:33 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 8B9DD2C83C99;
 Wed, 09 Oct 2024 13:55:30 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 13:55:29 +0200
Message-Id: <20241009115529.921033-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1728474930; bh=YjsL3ozs1f5zmZy4LqR1skto0vrBoY19wI99wFaEkgI=;
 h=From:To:Cc:Subject:Date;
 b=kOJOGUPlsb/ji/L0pfbIDFX56qjPs+ScEljaC3ZijPTlLxdD3phTptW5Bo0n2QM5D
 0B5mZGeFIUmggDtftvsIj4W+/7Uy24R7pggHqeSAKZOi40QPoACeEplWvAdMx88Kgq
 5jEkc2k6n+GQbOEfjJMPZrlNVCfSiOiMRlKAg7BKEedYuoLgRNbYHxfpONKYjDJe1x
 T1TYrhOspCHhgz9hkpCE1qgQEPtTkn6rY8PlgExZhV/soZUiGAFedQizG3C+EcCqdb
 N7XbwzBHa/uH2PFhF+0I6QZjy2tN9RCQH2Qzg+QNE8DjtuG7M2Yp0DTAgmjFOB1Vqx
 eY+O6aEY1D7YQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=kOJOGUPl
Subject: [Buildroot] [PATCH] package/python-django: bump to 5.1.2
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

Release notes: https://docs.djangoproject.com/en/5.1/releases/5.1.2/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index d39bf4d081..2d0b0d46fd 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  8024c23d7efe9e7acb04496ae22739c7  Django-5.1.1.tar.gz
-sha256  021ffb7fdab3d2d388bc8c7c2434eb9c1f6f4d09e6119010bbb1694dda286bc2  Django-5.1.1.tar.gz
+md5  bdd601132b94080200e71137a20d0d6a  Django-5.1.2.tar.gz
+sha256  bd7376f90c99f96b643722eee676498706c9fd7dc759f55ebfaf2c08ebcdf4f0  Django-5.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index cfe23ab16b..8fc95c8417 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.1.1
+PYTHON_DJANGO_VERSION = 5.1.2
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/88/6f/8f57ed6dc88656edd4fcb35c50dd963f3cd79303bd711fb0160fc7fd6ab7
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/9c/e5/a06e20c963b280af4aa9432bc694fbdeb1c8df9e28c2ffd5fbb71c4b1bec
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
