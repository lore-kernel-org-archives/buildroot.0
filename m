Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C280CE67803
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 18:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7761860724;
	Mon, 22 Dec 2025 18:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mrVWWyjwfJDG; Mon, 22 Dec 2025 18:06:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74DD8608B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766426802;
	bh=jszu2Yme15fNSL6xFbojxEripkVua4v4XytXNq78RKg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZUtF2vRcpahNFdSewVH32gXM1ayGo/0JRh7+ZRpO3AaCPtTCKcTn5A1FDlKQ5iZ1n
	 zREb8pehi6GW1beDQU++/7RRf71pe5QOq8aXKPufIKNN1EdX8FJT83YxsP8t5Ydrer
	 g0ih+Qu9zoVnIKUD+gNxKnLIB5sUftoqsYC/e6tOL4GL1qJ+B5vafoChgVgTvDYSci
	 xzCDyCGCmoypYQW7JfSOZJGT6m4ZOfygOwfhxO4hXG3SbOqECIyBZ7ple3omosAAeL
	 YP0lpPk0+wp8x04yyBSBWbupftuTk65nnoc6Pi6KuTVDgwyj3Bp5qzzPIBnYBo6YUs
	 cEu7bG4yy6Rgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74DD8608B0;
	Mon, 22 Dec 2025 18:06:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A51921A6
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 18:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BE0C4060A
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 18:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LW8zwQxmb3Jy for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 18:06:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD662405E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD662405E7
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 18:06:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EBF1875DD; Mon, 22 Dec 2025 18:06:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Dec 2025 19:05:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2622f9ca25cdc179ed1be3d733fb9b963a7fc5b8
X-Git-Newrev: be2c536db91981a745897ffa97c88dc3e561c203
X-Patchwork-Hint: ignore
Message-Id: <20251222180639.9EBF1875DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: bump to 6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=be2c536db91981a745897ffa97c88dc3e561c203
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release Notes: https://docs.djangoproject.com/en/6.0/releases/6.0/

A few changes in the license files and an actual (sub)-license update:

* django/contrib/gis/measure.py -> formatting change
* django/contrib/admin/static/admin/img -> svg files got uupdated and
  the new ones are licensed under CC-BY-4.0; separate LICENSE file got
  removed, License is now mentioned in the readme
* django/utils/archive.py -> File got updated, license (which is only
  the header) did not change.

Remove the comment about django site having an inconvenient download
URL. We download pretty much all python package from pypi.org, so doing
that for django shouldn't need a separate comment.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-django/python-django.hash | 10 +++++-----
 package/python-django/python-django.mk   |  9 ++++-----
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index b5b2460d2d..388b9df82c 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,15 +1,15 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  e7d89ddfdca79542039dbab31e4bede8  django-5.2.9.tar.gz
-sha256  16b5ccfc5e8c27e6c0561af551d2ea32852d7352c67d452ae3e76b4f6b2ca495  django-5.2.9.tar.gz
+md5  2f0e8520f6cf3cd6bbc81ec4226f11c7  django-6.0.tar.gz
+sha256  7b0c1f50c0759bbe6331c6a39c89ae022a84672674aeda908784617ef47d8e26  django-6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
-sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
+sha256  de642dff9b1019c2c7209032fb94ea92060084efb0bc4238d81a2219e21c7382  django/contrib/gis/measure.py
 sha256  570a045a8372b6cd6a00e30ebafe8e3e8dfc0a7fe3d4ef2cc5f16d419eb63aeb  django/contrib/gis/gdal/LICENSE
 sha256  08bf24b7551238ae325295245425b1caeb9ad0f42f9e2d303c7b353502632045  django/contrib/gis/geos/LICENSE
 sha256  d48633adb736dac091477ec2206feebeee88e3e6e486aedb21c584e4b49be0ec  django/contrib/admin/static/admin/js/inlines.js
 sha256  d4db9ebe6f29f5168eac45ad713f055623ac5d0dcd5ba92da23d650ae012020d  django/contrib/admin/static/admin/js/vendor/jquery/LICENSE.txt
 sha256  4ee0cbc51370afde358652a0f977972053729ed578b6a42f5e2a037d114f0b39  django/contrib/admin/static/admin/js/vendor/select2/LICENSE.md
 sha256  73af2949bff9296cb0f816c3be19a4da4e95adc94c1f924796e8bad3f03f2f29  django/contrib/admin/static/admin/js/vendor/xregexp/LICENSE.txt
-sha256  d114faff3488c16c319b3235dc41f90239d3d63d9853733033d8f7535f5c0004  django/contrib/admin/static/admin/img/LICENSE
+sha256  6e3bedbbf4310061e026d1b0b99beb390b845bfd29732455c13dd320db1feca6  django/contrib/admin/static/admin/img/README.md
 sha256  54004c4b606964ebc163af16d04607c16e428f8a78a026fecb53f70c09f4a94f  django/dispatch/license.txt
-sha256  9f37277d682cf06369041e60fb6fda5a85dfcf118d9176489087a3d40293f015  django/utils/archive.py
+sha256  d1046875a3eff7419a4e55b254fbb68fd58dfdbc701626bc8f57da76a5120cc4  django/utils/archive.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 7aabce68ef..d6d9bba0eb 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.9
+PYTHON_DJANGO_VERSION = 6.0
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
-# The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/eb/1c/188ce85ee380f714b704283013434976df8d3a2df8e735221a02605b6794
-PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/15/75/19762bfc4ea556c303d9af8e36f0cd910ab17dff6c8774644314427a2120
+PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js), CC-BY-4.0 (admin svg files)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \
 	django/contrib/gis/gdal/LICENSE \
@@ -17,7 +16,7 @@ PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/admin/static/admin/js/vendor/jquery/LICENSE.txt \
 	django/contrib/admin/static/admin/js/vendor/select2/LICENSE.md \
 	django/contrib/admin/static/admin/js/vendor/xregexp/LICENSE.txt \
-	django/contrib/admin/static/admin/img/LICENSE \
+	django/contrib/admin/static/admin/img/README.md \
 	django/dispatch/license.txt \
 	django/utils/archive.py
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
