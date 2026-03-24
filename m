Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B63109C05D
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 20:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0A2F40B43;
	Wed, 25 Mar 2026 20:10:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id auhgk7tX2zyd; Wed, 25 Mar 2026 20:10:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AC6340B61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774469423;
	bh=2MG92dp9z0nDM0/DzvEsZJaoP3ThIvolmavLpcsPjRU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mk0BiRLZ0NQpffi8XwrHsvwWarQHHgtz0bDqUn7l9SjE+D3mO53bJZsc54Ck4NHDQ
	 RfUmUYckfQuAz8LupS0RaWfjpidHOlLcTo6ITnZErcfQKdivaraxX7aHYmkcy2P6p6
	 Rhkw8s1At7kk7Kzbmnrp9CSLDiDQi3NkPqGFPXaTGUwnOsqviwhteewLlaqAqTXeFR
	 ZDwaKC20nxPnTnOiaO7lIhBdR6P+UZp14uTPw+Sw7MpYSn2H3WN7X20PthWrUOtqNR
	 +s7YLjC7MbdWI2GniGDHI2hXVX77maesNBb8MuxDxaHtaCo2NdXuBvrqGHCovKHfJx
	 thdCilN0cxLJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AC6340B61;
	Wed, 25 Mar 2026 20:10:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 201BC1D3
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 20:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 055AA60727
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 20:10:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cka9P8X9e40V for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 20:10:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25A32606E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25A32606E5
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 20:10:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F24B2846B5; Tue, 24 Mar 2026 11:21:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 24 Mar 2026 12:11:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1332aaade40f30ef39022cc5da3b1e5b80e2844e
X-Git-Newrev: c8dd9e9a011f1a5755df62baceb865efc09862fe
X-Patchwork-Hint: ignore
Message-Id: <20260324112112.F24B2846B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: security bump to
 6.0.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c8dd9e9a011f1a5755df62baceb865efc09862fe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following security issues:

CVE-2026-25673 (moderate):
Potential denial-of-service vulnerability in URLField via Unicode
normalization on Windows
https://www.cve.org/CVERecord?id=CVE-2026-25673

CVE-2026-25674 (low): Potential incorrect permissions on newly
created file system objects
https://www.cve.org/CVERecord?id=CVE-2026-25674

See the release notes here:
https://docs.djangoproject.com/en/6.0/releases/6.0.3/

This commit also fixes the license hash file
django/contrib/gis/measure.py, after whitespace cleanup:
https://github.com/django/django/commit/090f1da56e663e9f840e307e73b5cf011cb7b061#diff-eb11d321d233226d88aeffc485fb6c318a06e807feb1574d80a92a7d6a1461a2

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
[Julien: fix license hash for django/contrib/gis/measure.py]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-django/python-django.hash | 6 +++---
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index f1ddcc7128..dca77f02e2 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,9 +1,9 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  0836ceb8f1f4694f87f0a698c64bd00e  django-6.0.2.tar.gz
-sha256  3046a53b0e40d4b676c3b774c73411d7184ae2745fe8ce5e45c0f33d3ddb71a7  django-6.0.2.tar.gz
+md5  0bb395b518e2f2f17e1a936deb7ba74c  django-6.0.3.tar.gz
+sha256  90be765ee756af8a6cbd6693e56452404b5ad15294f4d5e40c0a55a0f4870fe1  django-6.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
-sha256  de642dff9b1019c2c7209032fb94ea92060084efb0bc4238d81a2219e21c7382  django/contrib/gis/measure.py
+sha256  be30dc0e3f7010af6c453d205feaece1f89494789b6e92f0c255ef597a1e6864  django/contrib/gis/measure.py
 sha256  570a045a8372b6cd6a00e30ebafe8e3e8dfc0a7fe3d4ef2cc5f16d419eb63aeb  django/contrib/gis/gdal/LICENSE
 sha256  08bf24b7551238ae325295245425b1caeb9ad0f42f9e2d303c7b353502632045  django/contrib/gis/geos/LICENSE
 sha256  d48633adb736dac091477ec2206feebeee88e3e6e486aedb21c584e4b49be0ec  django/contrib/admin/static/admin/js/inlines.js
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 18871163d6..0cc68129ee 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 6.0.2
+PYTHON_DJANGO_VERSION = 6.0.3
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/26/3e/a1c4207c5dea4697b7a3387e26584919ba987d8f9320f59dc0b5c557a4eb
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/80/e1/894115c6bd70e2c8b66b0c40a3c367d83a5a48c034a4d904d31b62f7c53a
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js), CC-BY-4.0 (admin svg files)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
