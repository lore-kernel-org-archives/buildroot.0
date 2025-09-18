Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAF8CAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0B20822E5;
	Fri, 19 Sep 2025 12:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAC10nrWa7c3; Fri, 19 Sep 2025 12:54:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2E60822BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2E60822BC;
	Fri, 19 Sep 2025 12:54:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39AE8E7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26A1A40A6F
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lujmHU1uceFk for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4035740AF5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4035740AF5
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3133885FDA; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 10:34:45 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 5ebf95bfa3c3d5d05dfa5e31545fcd0609041277
X-Git-Newrev: ee07983cc2f0af99ecbd51dd3d988c58e3c9ed8c
X-Patchwork-Hint: ignore
Message-Id: <20250919125411.3133885FDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/python-django:
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee07983cc2f0af99ecbd51dd3d988c58e3c9ed8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

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
index 25200ef783..3ff4eb4e36 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  6ecc4875e8cdc08706faea1cc4740fdf  django-5.2.4.tar.gz
-sha256  a1228c384f8fa13eebc015196db7b3e08722c5058d4758d20cb287503a540d8f  django-5.2.4.tar.gz
+md5  1f0327293cc3768903ce8cd390ec3f47  django-5.2.6.tar.gz
+sha256  da5e00372763193d73cecbf71084a3848458cecf4cee36b9a1e8d318d114a87b  django-5.2.6.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index ca258bbea5..e3959f4192 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.4
+PYTHON_DJANGO_VERSION = 5.2.6
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/9c/7e/034f0f9fb10c029a02daaf44d364d6bf2eced8c73f0d38c69da359d26b01
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/4c/8c/2a21594337250a171d45dda926caa96309d5136becd1f48017247f9cdea0
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
