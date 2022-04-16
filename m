Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A59BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Apr 2022 13:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6D08409DD;
	Sat, 16 Apr 2022 13:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2tJH5Qv2-4ep; Sat, 16 Apr 2022 13:48:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABC40409FF;
	Sat, 16 Apr 2022 13:48:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C9F61BF589
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 13:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7ADC660D80
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 13:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eQfIA-P1GEO7 for <buildroot@lists.busybox.net>;
 Sat, 16 Apr 2022 13:47:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A4EB60B9C
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 13:47:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5E2FB83BB4; Sat, 16 Apr 2022 13:37:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Apr 2022 15:44:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 607162a09c5dcbc630895cb9a44b1dff83b02929
X-Git-Newrev: 87b8676fbfe57253696864cc3bf20e85852b9c8b
X-Patchwork-Hint: ignore
Message-Id: <20220416133759.5E2FB83BB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: security bump to
 version 4.0.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=87b8676fbfe57253696864cc3bf20e85852b9c8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
