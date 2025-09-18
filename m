Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07047CAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1EB761069;
	Fri, 19 Sep 2025 12:48:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9DcDLwcMR2dy; Fri, 19 Sep 2025 12:48:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3A2D61046
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3A2D61046;
	Fri, 19 Sep 2025 12:48:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F95EE7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83DFC40B35
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJSyWLZoXPCB for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:48:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0D7340C14
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0D7340C14
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:48:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A30C485F2C; Fri, 19 Sep 2025 12:48:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 10:34:29 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: f7176c48c90e0eb5031ae7fb8c54b45c881f7873
X-Git-Newrev: fddb59b0d43ff1bb9e18a5cc7d61543775026016
X-Patchwork-Hint: ignore
Message-Id: <20250919124805.A30C485F2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/python-django:
 security bump to v5.2.6
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fddb59b0d43ff1bb9e18a5cc7d61543775026016
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

See the release notes:
- https://docs.djangoproject.com/en/5.2/releases/5.2.6/
- https://docs.djangoproject.com/en/5.2/releases/5.2.5/

This fixes the following vulnerability:
- CVE-2025-57833:
    An issue was discovered in Django 4.2 before 4.2.24, 5.1 before
    5.1.12, and 5.2 before 5.2.6. FilteredRelation is subject to SQL
    injection in column aliases, using a suitably crafted dictionary, with
    dictionary expansion, as the **kwargs passed QuerySet.annotate() or
    QuerySet.alias().
    https://www.cve.org/CVERecord?id=CVE-2025-57833

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a0797adf4078484c90c95ddfe216d4fc1b881b97)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 0dd687164e..3ff4eb4e36 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  0b2266b4a1aaed942e0a94ce8a18913d  django-5.2.3.tar.gz
-sha256  335213277666ab2c5cac44a792a6d2f3d58eb79a80c14b6b160cd4afc3b75684  django-5.2.3.tar.gz
+md5  1f0327293cc3768903ce8cd390ec3f47  django-5.2.6.tar.gz
+sha256  da5e00372763193d73cecbf71084a3848458cecf4cee36b9a1e8d318d114a87b  django-5.2.6.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 77e9a11839..e3959f4192 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.3
+PYTHON_DJANGO_VERSION = 5.2.6
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/c6/af/77b403926025dc6f7fd7b31256394d643469418965eb528eab45d0505358
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/4c/8c/2a21594337250a171d45dda926caa96309d5136becd1f48017247f9cdea0
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
