Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F3CECE579
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 13:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E80D401EF;
	Mon,  9 Sep 2024 13:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xWmaYMQJ3jDb; Mon,  9 Sep 2024 13:22:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 284F940386
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 284F940386;
	Mon,  9 Sep 2024 13:22:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D72A21BF375
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 13:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1BCB80E28
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 13:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lhAZFQ0TS391 for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 13:22:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 875FF80E25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 875FF80E25
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 875FF80E25
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 13:22:22 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 86A582C833BB;
 Mon, 09 Sep 2024 15:22:19 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon,  9 Sep 2024 15:22:18 +0200
Message-Id: <20240909132218.220515-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1725888139; bh=hLj1P09reqlYvTyH2lCPrl3h7KF6cd+EqJlXvpCCtTc=;
 h=From:To:Cc:Subject:Date;
 b=F6K0qX+kyjktpfLO/MMtcWQb4NSxeA1Kmb//0myFRiHaaXvbQZgSB6hUEgMk/uPDy
 wQOsQTodHk8+OUHmXahYWK4KSz/21WemNFDGdOIZKYjEZwEly5H5/g2SkHGRx0NTAo
 If7anbVSfR2LBiCbKeahTIhJZ491sJXkhYoubVWPvg4kyeVJxpIZ1qmpQ1LioTuIWD
 /fXNivD27Y48LZ8HUmu07hnP6MIA/rYHkKjp1fV9nKX6Fbf+VrinFeb8TF7tv9XJal
 I0fapj8lDo0BfMdt7ByBLgv6ZJDEl0wuMFOVwxQbL4jeOMN2O0W1TZ2+YJaG8BoUXT
 dXzxqWVXStaXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=F6K0qX+k
Subject: [Buildroot] [PATCH 2024.08.x] package/python-django: security bump
 to 5.0.9
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

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index a5a8c7426d..413745e133 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  fb167eef987a98421cad62036868a1ca  Django-5.0.8.tar.gz
-sha256  ebe859c9da6fead9c9ee6dbfa4943b04f41342f4cea2c4d8c978ef0d10694f2b  Django-5.0.8.tar.gz
+md5  8669004de8eb7f1a558400f9103c0001  Django-5.0.9.tar.gz
+sha256  6333870d342329b60174da3a60dbd302e533f3b0bb0971516750e974a99b5a39  Django-5.0.9.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 2c5c20ee4d..8232a90026 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.0.8
+PYTHON_DJANGO_VERSION = 5.0.9
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/79/1c/55733805bb735e26fee0430045efdb61df6fd704b6aebf2154875ef9e6a9
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/fa/7b/176ce335cba42342b8f20efbdd5eb27067a0b34ee2203e051b34bedca0d9
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
