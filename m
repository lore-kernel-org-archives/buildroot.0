Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B05C3ABD9
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 09:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FE97837B9;
	Wed, 14 May 2025 09:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_ZEJhZJH0zI; Wed, 14 May 2025 09:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15D7783760
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15D7783760;
	Wed, 14 May 2025 09:46:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12D6417F
 for <buildroot@buildroot.org>; Wed, 14 May 2025 09:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB0374074A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 09:46:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I7Lt2bP_w9YC for <buildroot@buildroot.org>;
 Wed, 14 May 2025 09:46:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CDDCE4069A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDDCE4069A
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CDDCE4069A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 09:46:24 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 54C832C845CC;
 Wed, 14 May 2025 11:46:22 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 14 May 2025 11:46:15 +0200
Message-ID: <20250514094620.59162-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514094620.59162-1-buildroot@bubu1.eu>
References: <20250514094620.59162-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747215982; bh=ZIenRefStibrgNQxYg6vu0O5uwiep0Z3vtZeBqyBuk8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XOx2uCh5IZQnzvX5svCrWfXQARuhj8FOmYQPTonng+GiZQLL5JM40j1OjoLqlhdX/
 LTQmwyOTtMhZsAeXFWDeB0DgIwgyjIymAFUx3R9ZMJS+pRxaGT2na2mgvdZdWNcO4d
 joP6DyP05je8a2m5fovDmAIVQbd7uf3LJmNJ3jfVsGmjPhgiDmwgZnV/oW3404jRXn
 /4/oPrXKoCliAQ6MMDUVQaMtZ2EDhaVRuaKjtldyt6DBW1BOBD1foSXxIiyseihY8I
 +HZfcQ7izJ4Iq+T3d4ctMmmNuXYc87uaTzIVZ5DL9rONWpOLIrNTlXD9kCe1vzadu3
 vC5HTylANdb2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=XOx2uCh5
Subject: [Buildroot] [PATCH v2 2/2] package/python-django: bump to 5.2.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Django 5.2 release notes: https://docs.djangoproject.com/en/5.2/releases/5.2/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
v1 -> v2: split patch into 5.1.9 and 5.2.1 update
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 57b9e9fb0e..836307f6b8 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  da93c81fcaf2e0b4dab3cf44e7564c7c  django-5.1.9.tar.gz
-sha256  565881bdd0eb67da36442e9ac788bda90275386b549070d70aee86327781a4fc  django-5.1.9.tar.gz
+md5  317174c6e0593c40e58ec1bd428b1091  django-5.2.1.tar.gz
+sha256  57fe1f1b59462caed092c80b3dd324fd92161b620d59a9ba9181c34746c97284  django-5.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index fd8a4eb9e8..62c8a00313 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.1.9
+PYTHON_DJANGO_VERSION = 5.2.1
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/10/08/2e6f05494b3fc0a3c53736846034f882b82ee6351791a7815bbb45715d79
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/ac/10/0d546258772b8f31398e67c85e52c66ebc2b13a647193c3eef8ee433f1a8
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
