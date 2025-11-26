Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59C7CFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A626F61B4A;
	Thu, 27 Nov 2025 20:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iATBGbRKG-IT; Thu, 27 Nov 2025 20:08:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E793661B39
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E793661B39;
	Thu, 27 Nov 2025 20:08:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4921E2A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC74E84429
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RyYiEOkGh1me for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:07:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED5F884426
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED5F884426
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:07:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAEBD85FC4; Thu, 27 Nov 2025 20:07:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 09:38:41 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7fe0b46b98e13367ecebc5e035df90628f3cc790
X-Git-Newrev: 372e3779106e3b7437766208b2a3286b0363bf94
X-Patchwork-Hint: ignore
Message-Id: <20251127200756.EAEBD85FC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-django:
 security bump to version 5.1.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=372e3779106e3b7437766208b2a3286b0363bf94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixed the following security issues:

CVE-2025-64458: Potential denial-of-service vulnerability in
HttpResponseRedirect and HttpResponsePermanentRedirect on Windows

CVE-2025-64459: Potential SQL injection via _connector keyword argument

https://docs.djangoproject.com/en/5.1/releases/5.1.14/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 779827f765ebc721d8edbeb6579b7692129942ab)
[thomas: bump to 5.1.14 instead]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index a525410582..97e568ea14 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  dad76d0dbdbc86402061182fc708a442  django-5.1.13.tar.gz
-sha256  543ff21679f15e80edfc01fe7ea35f8291b6d4ea589433882913626a7c1cf929  django-5.1.13.tar.gz
+md5  b0c6556282e4ef15209b34b09604b9a1  django-5.1.14.tar.gz
+sha256  b98409fb31fdd6e8c3a6ba2eef3415cc5c0020057b43b21ba7af6eff5f014831  django-5.1.14.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index c2581f5f90..fc5494cd80 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.1.13
+PYTHON_DJANGO_VERSION = 5.1.14
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/bb/57/ad9905d03a2ee39064ee7ba69f8e2790db4a7ffaef9c54f95e7a8f2cb0a1
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/6e/f9/284077f0e61f633e5279518a9ac5924ade4bef12bc841174ca48c57f2438
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
