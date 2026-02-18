Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8F2E9A055
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA37A81340;
	Thu, 19 Feb 2026 17:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bM7E6nj_4bm; Thu, 19 Feb 2026 17:25:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C29F838D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521950;
	bh=aP7iOepAE32gIPkn9zcbczhypMnWq2tBojlj+DF6iac=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lrrAnXjxphimIwUga7Jhw79CBlkGhNuWw/rPjBAXD8/gmnqsHlQ8TVZsFl34qTklZ
	 fpbC1GZoVW3ksEU0UvBui0V8A0sWyxLWcm3Z8EwfxShkaTBfIvOSpNSPYYCw0GVLsN
	 vt5gBeokM3OjBju+0s85EEA8G27Qa451eXROQZpzpBoTVug6DB8gCYbDQWm/2QVIn7
	 HXvYtX2g0R+ElhtrjweFpZHh6zZaw2rIuKrwvQMtYntKAYZma8c85VJCQxcivLH7oj
	 1QwaYwkKbnS9NhTQi2ocgvq+DsOffV0ky3EVTJhQls4/NeyQp3km26mCQUKdF7Cpi6
	 Jl84pRDbF2toA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C29F838D7;
	Thu, 19 Feb 2026 17:25:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 07E191CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92D1C610F4
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rA9VrcTCRpeC for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:25:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 991B960F2D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 991B960F2D
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95E03870D9; Thu, 19 Feb 2026 17:25:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 19:20:54 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4f157b57e75492020a9269ce9acf488b3ca51174
X-Git-Newrev: ff04f0eda2e6831c6f868c977c01b14a89b729be
X-Patchwork-Hint: ignore
Message-Id: <20260219172537.95E03870D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-django:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ff04f0eda2e6831c6f868c977c01b14a89b729be
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
 package/python-django/python-django.hash | 6 +++---
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 1c2b9bcd29..1cd2959b69 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,12 +1,12 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  98e667c17123f7bbd2d7d1db32f9ccdd  django-5.2.10.tar.gz
-sha256  74df100784c288c50a2b5cad59631d71214f40f72051d5af3fdf220c20bdbbbe  django-5.2.10.tar.gz
+md5  051357d45eb71a115a64e6d2a79c7c51  django-5.2.11.tar.gz
+sha256  7f2d292ad8b9ee35e405d965fbbad293758b858c34bbf7f3df551aeeac6f02d3  django-5.2.11.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
 sha256  570a045a8372b6cd6a00e30ebafe8e3e8dfc0a7fe3d4ef2cc5f16d419eb63aeb  django/contrib/gis/gdal/LICENSE
 sha256  08bf24b7551238ae325295245425b1caeb9ad0f42f9e2d303c7b353502632045  django/contrib/gis/geos/LICENSE
-sha256  c9607e292c3f699995669222b4a75eee29b28006b7e8b05daa805f07b953bc94  django/contrib/admin/static/admin/js/inlines.js
+sha256  d48633adb736dac091477ec2206feebeee88e3e6e486aedb21c584e4b49be0ec  django/contrib/admin/static/admin/js/inlines.js
 sha256  d4db9ebe6f29f5168eac45ad713f055623ac5d0dcd5ba92da23d650ae012020d  django/contrib/admin/static/admin/js/vendor/jquery/LICENSE.txt
 sha256  4ee0cbc51370afde358652a0f977972053729ed578b6a42f5e2a037d114f0b39  django/contrib/admin/static/admin/js/vendor/select2/LICENSE.md
 sha256  73af2949bff9296cb0f816c3be19a4da4e95adc94c1f924796e8bad3f03f2f29  django/contrib/admin/static/admin/js/vendor/xregexp/LICENSE.txt
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 184f91bfa1..4b840701f4 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.10
+PYTHON_DJANGO_VERSION = 5.2.11
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/e6/e5/2671df24bf0ded831768ef79532e5a7922485411a5696f6d979568591a37
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/17/f2/3e57ef696b95067e05ae206171e47a8e53b9c84eec56198671ef9eaa51a6
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
