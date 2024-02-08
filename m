Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E80CC4828F
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 13:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9EC8484E0;
	Thu,  8 Feb 2024 13:08:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y6IeclvrQdTX; Thu,  8 Feb 2024 13:08:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF180487EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF180487EC;
	Thu,  8 Feb 2024 13:08:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F2A8D1BF422
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 13:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA93941DBD
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 13:08:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9qaSlXxD1H3V for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 13:08:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7992E41DAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7992E41DAD
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7992E41DAD
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 13:08:44 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 7B4752C8386B;
 Thu,  8 Feb 2024 14:08:42 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu,  8 Feb 2024 14:08:37 +0100
Message-Id: <20240208130838.196406-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707397722; bh=L+jng98BA3VvVmxe8DWizQWLl4pH5ITFkkihDUvAnPQ=;
 h=From:To:Cc:Subject:Date;
 b=oVV8MIH1cTawIgaGERX7CYMWFth5rESvowuehYiaNKqLDaL+sKd83awUUoHLen7/H
 BVB9yiSesvZfc2qoDLq4m/FkgC0QkVBUdzN5Ta1kvDp6xGANkONxVu7iVDLXELgvay
 CLnzMveNF2MyIRCk2WC0csUXbE0UcUVCeUX0MttYwWrnnCPmzJXqqrMNWTwxvTKJHS
 SDpAvwBsNCRyDmEejG9fTHhfc7T4GxFUGFYADCbTLOF44gxxJcRwC2lYKeoiIy7MQY
 Xq/7rqJNajWBLmRRq7spk60metRWTUrTi8Nvsr4kaCCo+AFdKuJBAAJ5JB1GGKCjYd
 Jh9B64e+v/3hg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=oVV8MIH1
Subject: [Buildroot] [PATCH] package/python-django: security bump to 5.0.2
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

Minor 5.0 bugfix release [1] fixing one "moderate" severity CVE.

Fixes: CVE-2024-24680

[1] https://docs.djangoproject.com/en/5.0/releases/5.0.2/#django-5-0-2-release-notes

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 39fd9afdae..20b66a4106 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  5ff3c69d7e6b4f5ed378ec5713af8df7  Django-5.0.1.tar.gz
-sha256  8c8659665bc6e3a44fefe1ab0a291e5a3fb3979f9a8230be29de975e57e8f854  Django-5.0.1.tar.gz
+md5  5d0df847e1b751a4a5d2bde1563c75fc  Django-5.0.2.tar.gz
+sha256  b5bb1d11b2518a5f91372a282f24662f58f66749666b0a286ab057029f728080  Django-5.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index ed4f4bcdf1..231de0b833 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.0.1
+PYTHON_DJANGO_VERSION = 5.0.2
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/53/82/c8e8ed137da1c72fa110e3be9ab0f26bcfcf6f3d2994601d164dfac86269
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/50/98/499a2d11eb0b22fdd55ce5895e0f5ce6d7d4957a785f237a89317cb478fa
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
