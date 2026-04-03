Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3BEE7E368
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 572A781A58;
	Fri,  3 Apr 2026 10:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JLOqHc-0RHnP; Fri,  3 Apr 2026 10:27:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D552817AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212026;
	bh=9xZq4SkQxaul0s7r1uAT6zN+fn5oSLYh2laDazoOmwA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=klFSJZbGMWwVx2h6RizRCXA/fOmCqdGGwIrEhwJjo0bRTvWx/7EPdT56wgdbRpqRQ
	 dYf90kiHk7IyZIF6cmzJlvF7ZUdOjp8RXFWHAbSaCdJpu7NCn0y1/ofkTYUolJm8tm
	 lGFQ6/SA+leayhlrPtagetz9mEtQAbBOvP1qPBpumOYjVGMjMUBVMJdKiOwE5wE5Ud
	 KkTKRVslTDB21ljoKy26pA0nET+uVfpojE1B5W+BRNqq7gX0vFgNhTSqHzmc4GLQvo
	 NWtIC2UXL8cUaqvVu2jLGKCuFahTf0dApdPIOKGC47MdM6woqV6Iv3fLqNboqySXXr
	 twUVQE8VMMaBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D552817AE;
	Fri,  3 Apr 2026 10:27:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AEF72D3
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7751A40E7C
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgLlY0HH_6v6 for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:26:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EDF040E55
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EDF040E55
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:26:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFAB47FFF9; Fri,  3 Apr 2026 10:26:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 12:21:35 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6b208dd1d21e9b2d3a2663c1bb1b2c9c62408073
X-Git-Newrev: 36bf173d217ce827777f5e21a2d252f21ba33f5d
X-Patchwork-Hint: ignore
Message-Id: <20260403102656.CFAB47FFF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-django:
 security bump to v5.2.12
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/36bf173d217ce827777f5e21a2d252f21ba33f5d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See the release notes:
https://docs.djangoproject.com/en/5.2/releases/5.2.12/

This fixes the following vulnerabilities:

- CVE-2026-25673:
    An issue was discovered in 6.0 before 6.0.3, 5.2 before 5.2.12, and
    4.2 before 4.2.29. `URLField.to_python()` in Django calls
    `urllib.parse.urlsplit()`, which performs NFKC normalization on
    Windows that is disproportionately slow for certain Unicode
    characters, allowing a remote attacker to cause denial of service via
    large URL inputs containing these characters. Earlier, unsupported
    Django series (such as 5.0.x, 4.1.x, and 3.2.x) were not evaluated and
    may also be affected. Django would like to thank Seokchan Yoon for
    reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2026-25673

- CVE-2026-25674:
    An issue was discovered in 6.0 before 6.0.3, 5.2 before 5.2.12, and
    4.2 before 4.2.29. Race condition in file-system storage and file-
    based cache backends in Django allows an attacker to cause file system
    objects to be created with incorrect permissions via concurrent
    requests, where one thread's temporary `umask` change affects other
    threads in multi-threaded environments. Earlier, unsupported Django
    series (such as 5.0.x, 4.1.x, and 3.2.x) were not evaluated and may
    also be affected. Django would like to thank Tarek Nakkouch for
    reporting this issue.
    https://www.cve.org/CVERecord?id=CVE-2026-25674

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(cherry picked from commit c8dd9e9a011f1a5755df62baceb865efc09862fe)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 1cd2959b69..b1859b0647 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  051357d45eb71a115a64e6d2a79c7c51  django-5.2.11.tar.gz
-sha256  7f2d292ad8b9ee35e405d965fbbad293758b858c34bbf7f3df551aeeac6f02d3  django-5.2.11.tar.gz
+md5  9b60bb1145abcc97d276694f3f82a3b8  django-5.2.12.tar.gz
+sha256  6b809af7165c73eff5ce1c87fdae75d4da6520d6667f86401ecf55b681eb1eeb  django-5.2.12.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 4b840701f4..52d0a2b740 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.11
+PYTHON_DJANGO_VERSION = 5.2.12
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/17/f2/3e57ef696b95067e05ae206171e47a8e53b9c84eec56198671ef9eaa51a6
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/bd/55/b9445fc0695b03746f355c05b2eecc54c34e05198c686f4fc4406b722b52
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
