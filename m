Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3BDC83030
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 11:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C51E883ABC;
	Thu,  3 Jul 2025 11:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rt4mmCx8uUdW; Thu,  3 Jul 2025 11:30:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E10E883AB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E10E883AB3;
	Thu,  3 Jul 2025 11:30:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D8DAE193
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 11:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF6ED4017B
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 11:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mDdkQCwmrG3W for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 11:30:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9313340112
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9313340112
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9313340112
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 11:30:35 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id DBD892C849A5;
 Thu, 03 Jul 2025 13:30:32 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu,  3 Jul 2025 13:30:30 +0200
Message-ID: <20250703113032.819800-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1751542233; bh=h5hsnBmSST1a5V3AGU7RpAyqR0EkTic8UnQ/cDgmHT4=;
 h=From:To:Cc:Subject:Date;
 b=M8RSwUP5jYnBYfzFer1ScORqCAHUz5on2xA9dNnwQ395s1aMxOwDNWl9cPvVQL0z+
 d9KaxpGEYg24pw2RuUL3xhqePyUAC8OUWWx31J1UnnmKaDy1VMtZWY+O7ljqH8SGNt
 AP3CuS3SBi6IywQp3Marqg5LS1gfTempA2b/212vpB4URojYVGhKxIiLeuiClEFjIc
 M7Uv7vU95waIi/UwxSLEQOm8+KBVaAAehbVP+eIubVCK5FYAi0z9Nud+POGXMC7KBl
 opxS2BT32ttYVD9ORRkdzd5PdO4N06dIhvT4JElvudArPKRBfqOyLwkvb8gRVm7ol7
 dRGBxhR5M6btQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=M8RSwUP5
Subject: [Buildroot] [PATCH] package/python-django: bump to 5.2.4
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
 Oli Vogt <oli.vogt.pub01@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release Notes:
  https://www.djangoproject.com/weblog/2025/jul/02/bugfix-releases/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 0dd687164e..25200ef783 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  0b2266b4a1aaed942e0a94ce8a18913d  django-5.2.3.tar.gz
-sha256  335213277666ab2c5cac44a792a6d2f3d58eb79a80c14b6b160cd4afc3b75684  django-5.2.3.tar.gz
+md5  6ecc4875e8cdc08706faea1cc4740fdf  django-5.2.4.tar.gz
+sha256  a1228c384f8fa13eebc015196db7b3e08722c5058d4758d20cb287503a540d8f  django-5.2.4.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 77e9a11839..ca258bbea5 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.3
+PYTHON_DJANGO_VERSION = 5.2.4
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/c6/af/77b403926025dc6f7fd7b31256394d643469418965eb528eab45d0505358
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/9c/7e/034f0f9fb10c029a02daaf44d364d6bf2eced8c73f0d38c69da359d26b01
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
