Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4465C52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 08:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B62C80ECC;
	Wed,  7 Aug 2024 08:22:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YMNzlzjGYbjJ; Wed,  7 Aug 2024 08:22:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E0AE81230
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E0AE81230;
	Wed,  7 Aug 2024 08:22:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BDBA31BF391
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 08:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABAC76066C
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 08:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bRVbq5j7Ab5y for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 08:22:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5D536605EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D536605EA
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D536605EA
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 08:22:54 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id DEAC32C8021C;
 Wed, 07 Aug 2024 10:22:51 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 10:22:50 +0200
Message-Id: <20240807082251.59331-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1723018972; bh=9W5evnk+gpVLToahiqt2JVHepfJYldKeTSQzLAay/J0=;
 h=From:To:Cc:Subject:Date;
 b=P315yMTuBvZOhhdAJzaa9dNgTkl0HsfzZTbiQCwqKZKwPtDcwxuIAtj2Xq3qwybKq
 hs8KN1qp71ZAr04xXNmNj/xye1v6pnB5a6yIx8Yf5gLyodtNGGZyYXjKNKmmeqlBXB
 CoYrR8O0Mq4tt8nmyzihjIn7PO5zjAN07sO4jKyo9PXX8CBrEOaQGQUuspt18TAK73
 ARr4AYqz7mGSSskA0S1ri2mHU+Or8Q5YCl387lwGCBVUPc03sL5HUN9NBeRwp8Z4tJ
 fq1HXd2o+5cKholWxSF7dapZuc8CCUtkwhPdl/jZtpqxEhoKeRozJhzdJ26NPaK2m/
 Qx44PgU5dk8Vg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=P315yMTu
Subject: [Buildroot] [PATCH] package/python-django: security bump to version
 5.0.8
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

Django 5.0.7 fixes the following CVEs:

* CVE-2024-38875: Potential denial-of-service vulnerability in django.utils.html.urlize()
* CVE-2024-39329: Username enumeration through timing difference for users with unusable passwords
* CVE-2024-39330: Potential directory-traversal via Storage.save()
* CVE-2024-39614: Potential denial-of-service vulnerability in get_supported_language_variant()

Django 5.0.8 fixes the following CVEs:

* CVE-2024-41989: Memory exhaustion in django.utils.numberformat.floatformat()
* CVE-2024-41990: Potential denial-of-service vulnerability in django.utils.html.urlize()
* CVE-2024-41991: Potential denial-of-service vulnerability in django.utils.html.urlize() and AdminURLFieldWidget
* CVE-2024-42005: Potential SQL injection in QuerySet.values() and values_list()

Further release Notes: https://docs.djangoproject.com/en/5.0/releases/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index d5684a083c..a5a8c7426d 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  1009c48d70060cadb40000cc15a8058a  Django-5.0.3.tar.gz
-sha256  5fb37580dcf4a262f9258c1f4373819aacca906431f505e4688e37f3a99195df  Django-5.0.3.tar.gz
+md5  fb167eef987a98421cad62036868a1ca  Django-5.0.8.tar.gz
+sha256  ebe859c9da6fead9c9ee6dbfa4943b04f41342f4cea2c4d8c978ef0d10694f2b  Django-5.0.8.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 258ff9e0c1..2c5c20ee4d 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.0.3
+PYTHON_DJANGO_VERSION = 5.0.8
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/e1/b1/ac6a16aaf0049637b50afbcf06b8ec2fa5c6ce42d4ae6ba66bbaf4c3609a
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/79/1c/55733805bb735e26fee0430045efdb61df6fd704b6aebf2154875ef9e6a9
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
