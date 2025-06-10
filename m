Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52843C5B543
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 14:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F16FF41EFC;
	Tue, 10 Jun 2025 14:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KjaeyQI_3Aha; Tue, 10 Jun 2025 14:48:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDE2941D91
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDE2941D91;
	Tue, 10 Jun 2025 14:48:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE29C183
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 14:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F6FD810A5
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 14:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eK9LyIgsljPT for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 14:47:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3F3BE81069
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F3BE81069
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F3BE81069
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 14:47:57 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 2846F2C838EE;
 Tue, 10 Jun 2025 16:47:55 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 10 Jun 2025 16:47:52 +0200
Message-ID: <20250610144753.92545-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1749566875; bh=5tHfTsUFQZ/9Sc09VyamMKgIS+rxhWEVMC5MpiLrR30=;
 h=From:To:Cc:Subject:Date;
 b=o2utHHWonOMZZU53HtZB1NjzDYrimtSs55VnXzqCLIKOCnHR7ZlcAjiYSwj1+4SU9
 NM6CHZ33eQgJES1K+NaMlWS7s6MiZiby9rCsxmT43UOWVDpJ9Q79L2h0F8GIlGOxPm
 DtL9Nz0tDtWWvTq4CNfHgfSD/GXqeZCs0sksivvkMpUvCiCfxqCeMUzdTi8tslnpU5
 R19eQX//xrc3NcWkHagbQQhQ3w5HVM5zBHNyPOY8pjoJ/n7XLpKNxNT+Vs0MxWvZp0
 zuwXyMy0iSxh6nn3zopTO/kkbG1quDO/qQXv7F7pvLRQ+FEACbQVRmS2WUTzw7R/fh
 6odThHvEoJokQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=o2utHHWo
Subject: [Buildroot] [PATCH] package/python-django: security bump to 5.2.3
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

Followup release to 5.2.2 that completes the mitigations for
CVE-2025-48432[1].

Full changelog: https://docs.djangoproject.com/en/5.2/releases/5.2.3/

[1] https://www.djangoproject.com/weblog/2025/jun/10/bugfix-releases/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 14ed13fd6c..0dd687164e 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  782577f532efab32f8119a7071f55d04  django-5.2.2.tar.gz
-sha256  85852e517f84435e9b13421379cd6c43ef5b48a9c8b391d29a26f7900967e952  django-5.2.2.tar.gz
+md5  0b2266b4a1aaed942e0a94ce8a18913d  django-5.2.3.tar.gz
+sha256  335213277666ab2c5cac44a792a6d2f3d58eb79a80c14b6b160cd4afc3b75684  django-5.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index e36ab5385d..77e9a11839 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.2
+PYTHON_DJANGO_VERSION = 5.2.3
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/39/17/4567ee12bb84114c544d5c4a792e7226db517ac78f552111e9dc62d1de14
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/c6/af/77b403926025dc6f7fd7b31256394d643469418965eb528eab45d0505358
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
