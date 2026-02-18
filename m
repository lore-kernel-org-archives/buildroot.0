Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABED2E9A053
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8285B80758;
	Thu, 19 Feb 2026 17:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uVNR3q6YApYA; Thu, 19 Feb 2026 17:24:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7892D811C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521874;
	bh=a8W8/6ufspWLUcpngYyt1aJq/Wt1oSozeHJwJRmvF9M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Go0cndFpYW3SVkSzK2YSlMAYLvz0YGIlstu6bkdQwRHi0fN0NIP7p+ltN9yAeshHP
	 xYClz69U3qGCuQhdPuXUCd/wp08tzfFjMJ63kGrvlWTZyDHsHyF8mFKmzrmN5ciPPw
	 PbHxsJM3QL+A+o9CVZsMbdflRKPGaNPOYFpX+WnQ1J3t0qgGqegphP7iCvSlZTHG9i
	 dyGCF50hzfVIGqUSStVqkN4a7w0AdhYnvBcsoN7TYb47J48D0RMCwTPpzNnjF5aNCL
	 P5Llwmo7OieKwlQCaD/josbdjwGxzPdMKY8ba7/fxDJqD5rGrqRFSBJC0fvir/jsS0
	 DxJB141+dI6dA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7892D811C3;
	Thu, 19 Feb 2026 17:24:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EAC3D1CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8661840CE7
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mAWRIXHN8dA8 for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:24:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B961040CC5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B961040CC5
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B73C887043; Thu, 19 Feb 2026 17:24:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 19:20:02 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: d393c0feb451d0a4fefa14d913c6d204005c6008
X-Git-Newrev: 3a5bb6080bd08dc64d79f9ecaf5573a129bf3a13
X-Patchwork-Hint: ignore
Message-Id: <20260219172413.B73C887043@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python-django:
 security bump to v5.2.11
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3a5bb6080bd08dc64d79f9ecaf5573a129bf3a13
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

See the release notes:
https://docs.djangoproject.com/en/5.2/releases/5.2.11/

This is a security release on Django's LTS branch,
fixing the following vulnerabilties:

- CVE-2025-13473:
    An issue was discovered in 6.0 before 6.0.2, 5.2 before 5.2.11, and
    4.2 before 4.2.28. The
    `django.contrib.auth.handlers.modwsgi.check_password()` function for
    authentication via `mod_wsgi` allows remote attackers to enumerate
    users via a timing attack. Earlier, unsupported Django series (such as
    5.0.x, 4.1.x, and 3.2.x) were not evaluated and may also be affected.
    Django would like to thank Stackered for reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2025-13473

- CVE-2025-14550:
    An issue was discovered in 6.0 before 6.0.2, 5.2 before 5.2.11, and
    4.2 before 4.2.28. `ASGIRequest` allows a remote attacker to cause a
    potential denial-of-service via a crafted request with multiple
    duplicate headers. Earlier, unsupported Django series (such as 5.0.x,
    4.1.x, and 3.2.x) were not evaluated and may also be affected. Django
    would like to thank Jiyong Yang for reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2025-14550

- CVE-2026-1207:
    An issue was discovered in 6.0 before 6.0.2, 5.2 before 5.2.11, and
    4.2 before 4.2.28. Raster lookups on ``RasterField`` (only implemented
    on PostGIS) allows remote attackers to inject SQL via the band index
    parameter. Earlier, unsupported Django series (such as 5.0.x, 4.1.x,
    and 3.2.x) were not evaluated and may also be affected. Django would
    like to thank Tarek Nakkouch for reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2026-1207

- CVE-2026-1285:
    An issue was discovered in 6.0 before 6.0.2, 5.2 before 5.2.11, and
    4.2 before 4.2.28. `django.utils.text.Truncator.chars()` and
    `Truncator.words()` methods (with `html=True`) and the
    `truncatechars_html` and `truncatewords_html` template filters allow a
    remote attacker to cause a potential denial-of-service via crafted
    inputs containing a large number of unmatched HTML end tags. Earlier,
    unsupported Django series (such as 5.0.x, 4.1.x, and 3.2.x) were not
    evaluated and may also be affected. Django would like to thank
    Seokchan Yoon for reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2026-1285

- CVE-2026-1287:
    An issue was discovered in 6.0 before 6.0.2, 5.2 before 5.2.11, and
    4.2 before 4.2.28. `FilteredRelation` is subject to SQL injection in
    column aliases via control characters, using a suitably crafted
    dictionary, with dictionary expansion, as the `**kwargs` passed to
    `QuerySet` methods `annotate()`, `aggregate()`, `extra()`, `values()`,
    `values_list()`, and `alias()`. Earlier, unsupported Django series
    (such as 5.0.x, 4.1.x, and 3.2.x) were not evaluated and may also be
    affected. Django would like to thank Solomon Kebede for reporting this
    issue.
    https://www.cve.org/CVERecord?id=CVE-2026-1287

- CVE-2026-1312:
    An issue was discovered in 6.0 before 6.0.2, 5.2 before 5.2.11, and
    4.2 before 4.2.28. `.QuerySet.order_by()` is subject to SQL injection
    in column aliases containing periods when the same alias is, using a
    suitably crafted dictionary, with dictionary expansion, used in
    `FilteredRelation`. Earlier, unsupported Django series (such as 5.0.x,
    4.1.x, and 3.2.x) were not evaluated and may also be affected. Django
    would like to thank Solomon Kebede for reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2026-1312

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[thomas: update hash for inlines.js]
(cherry picked from commit f8e89786f92ac65e10c76b8ce3b0d833cfbaf48f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index b5b2460d2d..1cd2959b69 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  e7d89ddfdca79542039dbab31e4bede8  django-5.2.9.tar.gz
-sha256  16b5ccfc5e8c27e6c0561af551d2ea32852d7352c67d452ae3e76b4f6b2ca495  django-5.2.9.tar.gz
+md5  051357d45eb71a115a64e6d2a79c7c51  django-5.2.11.tar.gz
+sha256  7f2d292ad8b9ee35e405d965fbbad293758b858c34bbf7f3df551aeeac6f02d3  django-5.2.11.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 7aabce68ef..4b840701f4 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.9
+PYTHON_DJANGO_VERSION = 5.2.11
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/eb/1c/188ce85ee380f714b704283013434976df8d3a2df8e735221a02605b6794
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/17/f2/3e57ef696b95067e05ae206171e47a8e53b9c84eec56198671ef9eaa51a6
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
