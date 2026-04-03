Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAD1E7E363
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B178A61144;
	Fri,  3 Apr 2026 10:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QjUROvUzq7xE; Fri,  3 Apr 2026 10:28:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA63D61147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212125;
	bh=2TFZUzKdHHy0F7vWV99M9swThHiTW8QwjsztaiFbRPA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UiGnCsorNxAC0XQWWZ09WRiSo37/z82cYVQ3kJRT95nX6EtcgEs3+fE7xbA3TYbTy
	 jQdgplSKoA50QTa43BA1XiZNmQVR7V5UfLVOkzXLfZOlKLHkp2jJrETSpzcEHphP/l
	 gKy05z02bhPh8cDEjxyje5/EMaPhwZ1IbpnvSd6leFRNCbTzYOvPtclOIZHp8vGHJh
	 KkUf93UhWN/Hkac6lgoyxE+/oeyb4TSRFBvX2vJZl5q+EJ4t9Km6AmXwqGgUV1WGmn
	 1f4o/Bh066DiuyKYnOznlSMRrepY+Wf0qTfRD8YnAS4bB+/Hv9bK/mfx/MMzzQjhDu
	 KWFzd8RNjXnEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA63D61147;
	Fri,  3 Apr 2026 10:28:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A8D62CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7F7240E60
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-yLJma_7Oqw for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 021FF40E65
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 021FF40E65
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7376A7FFA9; Fri,  3 Apr 2026 10:28:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 11:52:59 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 8b6b54245ef496fe764f3fff57a8883d1ed44b3b
X-Git-Newrev: 17920c622e1b3742ba49114be05894d6c55e95b5
X-Patchwork-Hint: ignore
Message-Id: <20260403102836.7376A7FFA9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/python-django:
 security bump to 6.0.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/17920c622e1b3742ba49114be05894d6c55e95b5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
(cherry picked from commit c8dd9e9a011f1a5755df62baceb865efc09862fe)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
