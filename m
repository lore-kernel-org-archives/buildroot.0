Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A97FCCA470
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 09:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F325D611ED;
	Thu,  9 Oct 2025 09:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6PILuhOtBgp; Thu,  9 Oct 2025 09:56:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E394612E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E394612E2;
	Thu,  9 Oct 2025 09:56:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 58092119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A9CF40F89
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qNyCXHnHErB for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 09:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E59540FAC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E59540FAC
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C56D86C36; Thu,  9 Oct 2025 09:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 08:41:37 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 7c75c6fb9441548dad4231197d885092aa78e2e5
X-Git-Newrev: a8624259acec372ee57c9625d78d6d1345e71c68
X-Patchwork-Hint: ignore
Message-Id: <20251009095540.3C56D86C36@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/python-django:
 security bump to v5.2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8624259acec372ee57c9625d78d6d1345e71c68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

For release note, see:
https://docs.djangoproject.com/en/5.2/releases/5.2.7/

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
[Julien: add link to release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7bbc66a39e6e18d5298564167b42e56b82c9360a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-django/python-django.hash | 6 +++---
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 3ff4eb4e36..1ec80dc1c2 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  1f0327293cc3768903ce8cd390ec3f47  django-5.2.6.tar.gz
-sha256  da5e00372763193d73cecbf71084a3848458cecf4cee36b9a1e8d318d114a87b  django-5.2.6.tar.gz
+md5  699a77ac347ca3484939762483dc4b08  django-5.2.7.tar.gz
+sha256  e0f6f12e2551b1716a95a63a1366ca91bbcd7be059862c1b18f989b1da356cdd  django-5.2.7.tar.gz
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
index e3959f4192..139a15b13a 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.6
+PYTHON_DJANGO_VERSION = 5.2.7
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/4c/8c/2a21594337250a171d45dda926caa96309d5136becd1f48017247f9cdea0
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/b1/96/bd84e2bb997994de8bcda47ae4560991084e86536541d7214393880f01a8
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
