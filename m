Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F89CCA470
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 10:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1A89613A5;
	Thu,  9 Oct 2025 10:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOnRcdFIHshm; Thu,  9 Oct 2025 10:16:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D703613B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D703613B3;
	Thu,  9 Oct 2025 10:16:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D27221B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D4D183C25
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:16:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RTT0BZcHIVUx for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 10:16:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73D1183C38
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73D1183C38
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:16:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71ED4866FA; Thu,  9 Oct 2025 10:16:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 08:42:49 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f5de63a03ce11e6794d1b0b76706a2d1a550b58c
X-Git-Newrev: cbb64ac48de3a19acbaa75f1211d13e0bae0e165
X-Patchwork-Hint: ignore
Message-Id: <20251009101600.71ED4866FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-django:
 security bump to v5.1.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=cbb64ac48de3a19acbaa75f1211d13e0bae0e165
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This fixes the following vulnerabilities:
- CVE-2025-59681:
    An issue was discovered in Django 4.2 before 4.2.25, 5.1 before
    5.1.13, and 5.2 before 5.2.7. QuerySet.annotate(), QuerySet.alias(),
    QuerySet.aggregate(), and QuerySet.extra() are subject to SQL
    injection in column aliases, when using a suitably crafted dictionary,
    with dictionary expansion, as the **kwargs passed to these methods (on
    MySQL and MariaDB).
    https://www.cve.org/CVERecord?id=CVE-2025-59681

- CVE-2025-59682:
    An issue was discovered in Django 4.2 before 4.2.25, 5.1 before
    5.1.13, and 5.2 before 5.2.7. The django.utils.archive.extract()
    function, used by the "startapp --template" and "startproject
    --template" commands, allows partial directory traversal via an
    archive with file paths sharing a common prefix with the target
    directory.
    https://www.cve.org/CVERecord?id=CVE-2025-59682

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(cherry picked from commit 7bbc66a39e6e18d5298564167b42e56b82c9360a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-django/python-django.hash | 6 +++---
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 155e3af8ef..a525410582 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  7f7a03e4f19ad7813d96f9fbbad65a5c  django-5.1.12.tar.gz
-sha256  8a8991b1ec052ef6a44fefd1ef336ab8daa221287bcb91a4a17d5e1abec5bbcc  django-5.1.12.tar.gz
+md5  dad76d0dbdbc86402061182fc708a442  django-5.1.13.tar.gz
+sha256  543ff21679f15e80edfc01fe7ea35f8291b6d4ea589433882913626a7c1cf929  django-5.1.13.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
@@ -12,4 +12,4 @@ sha256  4ee0cbc51370afde358652a0f977972053729ed578b6a42f5e2a037d114f0b39  django
 sha256  73af2949bff9296cb0f816c3be19a4da4e95adc94c1f924796e8bad3f03f2f29  django/contrib/admin/static/admin/js/vendor/xregexp/LICENSE.txt
 sha256  d114faff3488c16c319b3235dc41f90239d3d63d9853733033d8f7535f5c0004  django/contrib/admin/static/admin/img/LICENSE
 sha256  54004c4b606964ebc163af16d04607c16e428f8a78a026fecb53f70c09f4a94f  django/dispatch/license.txt
-sha256  1ce0483ad554cf135efec70ad2097e82ed72790194f17e1591821dc82c2416e0  django/utils/archive.py
+sha256  9f37277d682cf06369041e60fb6fda5a85dfcf118d9176489087a3d40293f015  django/utils/archive.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 3026c304be..c2581f5f90 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.1.12
+PYTHON_DJANGO_VERSION = 5.1.13
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/f0/99/a951d93a27a5bc59fb96edbcdbc03fb9bfac51177f1bc0110888de85af3f
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/bb/57/ad9905d03a2ee39064ee7ba69f8e2790db4a7ffaef9c54f95e7a8f2cb0a1
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
