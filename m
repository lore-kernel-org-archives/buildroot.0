Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDDCC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 21:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 114624193F;
	Thu, 14 Apr 2022 21:59:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dQ1T9l9jXCkS; Thu, 14 Apr 2022 21:59:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C956A41937;
	Thu, 14 Apr 2022 21:59:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1E1C1BF239
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 21:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAA23828F8
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 21:59:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LZPSCMqNtxLr for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 21:59:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65FF7828DE
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 21:59:20 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9A8CE200005;
 Thu, 14 Apr 2022 21:59:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nf7Ui-00CTuc-3M; Thu, 14 Apr 2022 23:59:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 23:59:14 +0200
Message-Id: <20220414215915.2974871-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-django: security bump to version
 4.0.4
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
Cc: Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

CVE-2022-28346: Potential SQL injection in QuerySet.annotate(), aggregate(), and extra()

QuerySet.annotate(), aggregate(), and extra() methods were subject to SQL
injection in column aliases, using a suitably crafted dictionary, with
dictionary expansion, as the **kwargs passed to these methods.

CVE-2022-28347: Potential SQL injection via QuerySet.explain(**options) on PostgreSQL

QuerySet.explain() method was subject to SQL injection in option names,
using a suitably crafted dictionary, with dictionary expansion, as the
**options argument.

For more details, see the advisory:
https://www.djangoproject.com/weblog/2022/apr/11/security-releases/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index f78df56c5f..8d9f0aafdb 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  a86339c0e87241597afa8744704d9965  Django-4.0.2.tar.gz
-sha256  110fb58fb12eca59e072ad59fc42d771cd642dd7a2f2416582aa9da7a8ef954a  Django-4.0.2.tar.gz
+md5  153fcb5dd7360b7ad219d65cb53e2d57  Django-4.0.4.tar.gz
+sha256  4e8177858524417563cc0430f29ea249946d831eacb0068a1455686587df40b5  Django-4.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 652ca477ce..b4d6ec21c9 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.0.2
+PYTHON_DJANGO_VERSION = 4.0.4
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/61/84/676c840e8f1188a6c836e3224b97aa8be4c2e6857c690d6c564eb23a4975
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/d2/95/93d1f75da95624bf89e373d079fa72debf77f9b10acc31998cc52a5ff3f9
 
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
