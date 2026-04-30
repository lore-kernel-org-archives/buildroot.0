Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150CFFF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCBE6844A9;
	Mon,  4 May 2026 14:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hoClJQ596ETq; Mon,  4 May 2026 14:47:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBA1284611
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906031;
	bh=V3WQWKEtLTJ8oQDa1CYEArS3hgkFxClE7q598Rj4lNQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G4ENH6cCDPfVcn8BTEeL+sEiO/5QHeVJCO+q11j/BBYkEE8hurxuytJBjrgq2uw29
	 AZXrkC6lRY3eMkz/jlUjYXx3gccjqVLeGTX09mzgbZNiNcFHEREf43398kk1Q/6cOq
	 HisEsY+NhajohpuJIz+UNBTAD79ECb/zmKMKGsULhGxJGzSva3gZ7qXPs64m44JGcf
	 pHEbrWEVo5RQ5w5cN2sccIlFyDYgx/kFRDzo/2HmpwiZ2pjerBdUnZGhywXE0O1DhT
	 JwxoGzvs120FOBW6vao8jDlGeiHFGEuMganA+QcC2p42iqA12vQ7P5r4+jg8VIN3vm
	 0zkcZBi6yh7DA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBA1284611;
	Mon,  4 May 2026 14:47:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04BBC190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCDA4410B3
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zC7vknByyFQS for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9B41410D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9B41410D0
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD3628423F; Mon,  4 May 2026 14:46:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 14:06:43 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ae34d39c8d4057581a84b91426de059badb54263
X-Git-Newrev: 63ae2c9f7585b4fb20c2ac8702051c4657a763e7
X-Patchwork-Hint: ignore
Message-Id: <20260504144643.AD3628423F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-django:
 security bump to v5.2.13
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/63ae2c9f7585b4fb20c2ac8702051c4657a763e7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See the release notes:
https://docs.djangoproject.com/en/5.2/releases/5.2.13/

In addition, update the pypi url to a stable one, which shouldn't change
in each and every release (similar to the url change in commit
https://gitlab.com/buildroot.org/buildroot/-/commit/60ce218196281d76606849037986b275c4619ae9)

Finally, one hash file has changed because of upstream commit
https://github.com/django/django/commit/0ee44c674cf61efbca2056c40f3e4f2335aaeee6

Django 5.2.13 fixes one security issue with severity "moderate",
and four security issues with severity "low":
- CVE-2026-3902:
    An issue was discovered in 6.0 before 6.0.4, 5.2 before 5.2.13, and
    4.2 before 4.2.30. `ASGIRequest` allows a remote attacker to spoof
    headers by exploiting an ambiguous mapping of two header variants
    (with hyphens or with underscores) to a single version with
    underscores. Earlier, unsupported Django series (such as 5.0.x, 4.1.x,
    and 3.2.x) were not evaluated and may also be affected. Django would
    like to thank Tarek Nakkouch for reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2026-3902

- CVE-2026-4277:
    An issue was discovered in 6.0 before 6.0.4, 5.2 before 5.2.13, and
    4.2 before 4.2.30. Add permissions on inline model instances were not
    validated on submission of  forged `POST` data in
    `GenericInlineModelAdmin`. Earlier, unsupported Django series (such as
    5.0.x, 4.1.x, and 3.2.x) were not evaluated and may also be affected.
    Django would like to thank N05ec@LZU-DSLab for reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2026-4277

- CVE-2026-4292:
    An issue was discovered in 6.0 before 6.0.4, 5.2 before 5.2.13, and
    4.2 before 4.2.30. Admin changelist forms using
    `ModelAdmin.list_editable` incorrectly allowed new  instances to be
    created via forged `POST` data. Earlier, unsupported Django series
    (such as 5.0.x, 4.1.x, and 3.2.x) were not evaluated and may also be
    affected. Django would like to thank Cantina for reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2026-4292

- CVE-2026-33033:
    An issue was discovered in 6.0 before 6.0.4, 5.2 before 5.2.13, and
    4.2 before 4.2.30. `MultiPartParser` allows remote attackers to
    degrade performance by submitting multipart uploads with `Content-
    Transfer-Encoding: base64` including excessive whitespace. Earlier,
    unsupported Django series (such as 5.0.x, 4.1.x, and 3.2.x) were not
    evaluated and may also be affected. Django would like to thank
    Seokchan Yoon for reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2026-33033

- CVE-2026-33034:
    An issue was discovered in 6.0 before 6.0.4, 5.2 before 5.2.13, and
    4.2 before 4.2.30. ASGI requests with a missing or understated
    `Content-Length` header could  bypass the
    `DATA_UPLOAD_MAX_MEMORY_SIZE` limit when reading  `HttpRequest.body`,
    allowing remote attackers to load an unbounded request body into
    memory. Earlier, unsupported Django series (such as 5.0.x, 4.1.x, and
    3.2.x) were not evaluated and may also be affected. Django would like
    to thank Superior for reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2026-33034

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-django/python-django.hash | 6 +++---
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index b1859b0647..a7bf2aed8b 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,9 +1,9 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  9b60bb1145abcc97d276694f3f82a3b8  django-5.2.12.tar.gz
-sha256  6b809af7165c73eff5ce1c87fdae75d4da6520d6667f86401ecf55b681eb1eeb  django-5.2.12.tar.gz
+md5  4af55cc09a3d1a828259ad0c05330e6b  django-5.2.13.tar.gz
+sha256  a31589db5188d074c63f0945c3888fad104627dfcc236fb2b97f71f89da33bc4  django-5.2.13.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
-sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
+sha256  a6fa72074c31928128aaa18162204507938b7a9a8b819bd833fa82467441800d  django/contrib/gis/measure.py
 sha256  570a045a8372b6cd6a00e30ebafe8e3e8dfc0a7fe3d4ef2cc5f16d419eb63aeb  django/contrib/gis/gdal/LICENSE
 sha256  08bf24b7551238ae325295245425b1caeb9ad0f42f9e2d303c7b353502632045  django/contrib/gis/geos/LICENSE
 sha256  d48633adb736dac091477ec2206feebeee88e3e6e486aedb21c584e4b49be0ec  django/contrib/admin/static/admin/js/inlines.js
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 52d0a2b740..a478c95f95 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.12
+PYTHON_DJANGO_VERSION = 5.2.13
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/bd/55/b9445fc0695b03746f355c05b2eecc54c34e05198c686f4fc4406b722b52
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/source/d/django
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
