Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D032ECD6D3
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 18:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 008F984091;
	Wed, 11 Feb 2026 18:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gWLjIid_1lnM; Wed, 11 Feb 2026 18:17:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF5948408F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770833865;
	bh=0sHFAkFwcmmnqZJFSXe6v9M+KKsKMl5ePCQ/sPs9ZMM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bMN4FLfg5gKC/C80SNQD0Wn5yNHnMr18qZDOz8M0bZ/oRHrZqiKRox1gwfCzaQCHp
	 k4/Da5/2vxErDJdU7lQ+VkYfuZqbV4blSrfrFpPxLVz1UxKyK5nSaMqbUO7skdzFzR
	 efn+EsnelXzMtsPeHernQoOvg0TEj2Ub0TyyVV+JOQMCpxNNISjGwCDkJ2Tt9qr/vU
	 I0pquBeURMW41yJAtWK0nqfFGqCE+Bhhf/aaglUC73A/yAspZQXie0/yiugNIe7SeU
	 dcbKUDElJ851X6Fs81jiiY3y22tiZHe5F9IOrj3FNejMmiBx2sscTcXOjjbbeBwmHy
	 s3tdHIRhG+Ykg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF5948408F;
	Wed, 11 Feb 2026 18:17:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C6F21F6
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 18:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31C2040A42
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 18:17:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bst4FTYyNrhC for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 18:17:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B90140984
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B90140984
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 18:17:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0988A86C67; Wed, 11 Feb 2026 18:17:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Feb 2026 19:08:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8e3c0513230c1ea7210b000f210bf9ac59c4a5f
X-Git-Newrev: f8e89786f92ac65e10c76b8ce3b0d833cfbaf48f
X-Patchwork-Hint: ignore
Message-Id: <20260211181742.0988A86C67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: security bump to
 6.0.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f8e89786f92ac65e10c76b8ce3b0d833cfbaf48f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following security issues:
- CVE-2025-13473 (low): Username enumeration through timing difference in mod_wsgi authentication handler
- CVE-2025-14550 (moderate): Potential denial-of-service vulnerability via repeated headers when using ASGI
- CVE-2026-1207 (high): Potential SQL injection via raster lookups on PostGIS
- CVE-2026-1285 (moderate): Potential denial-of-service vulnerability in django.utils.text.Truncator HTML methods
- CVE-2026-1287 (high): Potential SQL injection in column aliases via control characters
- CVE-2026-1312 (high): Potential SQL injection via QuerySet.order_by and FilteredRelation

See the release notes here:
https://docs.djangoproject.com/en/dev/releases/6.0.2/
Also includes the bugfixes from version 6.0.1:
https://docs.djangoproject.com/en/dev/releases/6.0.1/

Signed-off-by: Manuel Diener <manuel.diener@othermo.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 388b9df82c..f1ddcc7128 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  2f0e8520f6cf3cd6bbc81ec4226f11c7  django-6.0.tar.gz
-sha256  7b0c1f50c0759bbe6331c6a39c89ae022a84672674aeda908784617ef47d8e26  django-6.0.tar.gz
+md5  0836ceb8f1f4694f87f0a698c64bd00e  django-6.0.2.tar.gz
+sha256  3046a53b0e40d4b676c3b774c73411d7184ae2745fe8ce5e45c0f33d3ddb71a7  django-6.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  de642dff9b1019c2c7209032fb94ea92060084efb0bc4238d81a2219e21c7382  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index d6d9bba0eb..18871163d6 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 6.0
+PYTHON_DJANGO_VERSION = 6.0.2
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/15/75/19762bfc4ea556c303d9af8e36f0cd910ab17dff6c8774644314427a2120
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/26/3e/a1c4207c5dea4697b7a3387e26584919ba987d8f9320f59dc0b5c557a4eb
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js), CC-BY-4.0 (admin svg files)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
