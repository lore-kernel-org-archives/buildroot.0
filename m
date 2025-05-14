Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C49C3ABD8
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 13:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45B5A813F3;
	Wed, 14 May 2025 13:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3gmv9mo9M-Ll; Wed, 14 May 2025 13:07:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F24E81377
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F24E81377;
	Wed, 14 May 2025 13:07:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C471912A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B574540FD0
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:07:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oe-D5k-JqPnG for <buildroot@buildroot.org>;
 Wed, 14 May 2025 13:07:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06ACB40F2B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06ACB40F2B
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:07:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E19EA86079; Wed, 14 May 2025 13:07:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 May 2025 14:57:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38494a0a613d77169fb3178be287315ebc1b8ade
X-Git-Newrev: 09299c5b0cf4841e20ee8f8196a4122890e6530f
X-Patchwork-Hint: ignore
Message-Id: <20250514130732.E19EA86079@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: security bump to
 5.1.9
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=09299c5b0cf4841e20ee8f8196a4122890e6530f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2025-32873 [1].
Django also updates setuptools[2], so we can remove the --skip-dependency-check
flag and need to update the package archive capitalization accordingly.

[1] https://www.djangoproject.com/weblog/2025/may/07/security-releases/
[2] https://github.com/django/django/commit/bbf376bbc8cdfca817b54e7df99539633d10b06e

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 1e197004d0..57b9e9fb0e 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  80247a8b48cdac55e5ad3fb682ab71a3  Django-5.1.8.tar.gz
-sha256  42e92a1dd2810072bcc40a39a212b693f94406d0ba0749e68eb642f31dc770b4  Django-5.1.8.tar.gz
+md5  da93c81fcaf2e0b4dab3cf44e7564c7c  django-5.1.9.tar.gz
+sha256  565881bdd0eb67da36442e9ac788bda90275386b549070d70aee86327781a4fc  django-5.1.9.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index b64d8e4cd1..fd8a4eb9e8 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,15 +4,14 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.1.8
-PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
+PYTHON_DJANGO_VERSION = 5.1.9
+PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/00/40/45adc1b93435d1b418654a734b68351bb6ce0a0e5e37b2f0e9aeb1a2e233
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/10/08/2e6f05494b3fc0a3c53736846034f882b82ee6351791a7815bbb45715d79
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
 PYTHON_DJANGO_CPE_ID_PRODUCT = django
 PYTHON_DJANGO_SETUP_TYPE = setuptools
-PYTHON_DJANGO_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
