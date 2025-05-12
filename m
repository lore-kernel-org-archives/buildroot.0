Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A520C3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 19:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3897860D6C;
	Mon, 12 May 2025 19:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VVr3h-IqTbii; Mon, 12 May 2025 19:12:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 611E060E25
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 611E060E25;
	Mon, 12 May 2025 19:12:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D0FE0150
 for <buildroot@buildroot.org>; Mon, 12 May 2025 19:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C255F81007
 for <buildroot@buildroot.org>; Mon, 12 May 2025 19:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ydzwlH6FSH0T for <buildroot@buildroot.org>;
 Mon, 12 May 2025 19:12:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 564F1810E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 564F1810E3
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 564F1810E3
 for <buildroot@buildroot.org>; Mon, 12 May 2025 19:12:20 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 71CB52C84448;
 Mon, 12 May 2025 21:12:17 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 12 May 2025 21:12:15 +0200
Message-ID: <20250512191216.234165-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747077137; bh=/e9NeYZXwCHhB8oooNqee8iSaDaQfIzrEwY9r3NCLvs=;
 h=From:To:Cc:Subject:Date;
 b=WkGLESOcsZFUof4Ai/7s7T8urGnTYNN6Lb2ZN2kJIh2I4Ku/FBKA5JoHuF1KXxfad
 g1JZp96WCfu+FA6uh0Kio2wC1Bhaf5TU98tHkLpXw2IrRpFmRgMAJa1vXPgVmFm0JX
 Ek6SBCeILRgpUp0jhrXLXm5leD3/5wMj9mpkzjwrElKLG9CAf4YsOqOhCwlYn/89YW
 GSvm2wTwWfTVprfUC5rsqvvV6haIM9tvTmVtWo4AGgjamMh52m1IVLlLI6EPq3XpmI
 nJ+lXsecIvF/6auJDpiQaBArLCj+QVdGxR/K/cONunIrZLrT6v54JEHQUZ119Mc9U3
 uxJy9C8biqjcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=WkGLESOc
Subject: [Buildroot] [PATCH] package/python-django: security bump to 5.2.1
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

Fixes CVE-2025-32873 [1].

Django 5.2.1. also updates setuptools[2], so we can remove the --skip-dependency-check
flag and need to update the package archive capitalization accordingly.

[1] https://www.djangoproject.com/weblog/2025/may/07/security-releases/
[2] https://github.com/django/django/commit/3ae049b26b995c650c41ef918d5f60beed52b4ba

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 1e197004d0..836307f6b8 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  80247a8b48cdac55e5ad3fb682ab71a3  Django-5.1.8.tar.gz
-sha256  42e92a1dd2810072bcc40a39a212b693f94406d0ba0749e68eb642f31dc770b4  Django-5.1.8.tar.gz
+md5  317174c6e0593c40e58ec1bd428b1091  django-5.2.1.tar.gz
+sha256  57fe1f1b59462caed092c80b3dd324fd92161b620d59a9ba9181c34746c97284  django-5.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index b64d8e4cd1..62c8a00313 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,15 +4,14 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.1.8
-PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
+PYTHON_DJANGO_VERSION = 5.2.1
+PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/00/40/45adc1b93435d1b418654a734b68351bb6ce0a0e5e37b2f0e9aeb1a2e233
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/ac/10/0d546258772b8f31398e67c85e52c66ebc2b13a647193c3eef8ee433f1a8
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
 PYTHON_DJANGO_CPE_ID_PRODUCT = django
 PYTHON_DJANGO_SETUP_TYPE = setuptools
-PYTHON_DJANGO_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
