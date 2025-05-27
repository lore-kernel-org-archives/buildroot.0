Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5A0C71131
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE09740D00;
	Wed,  4 Jun 2025 18:28:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ZZxlfxD_Hv9; Wed,  4 Jun 2025 18:28:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBB1B4110B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBB1B4110B;
	Wed,  4 Jun 2025 18:28:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 51B7FDA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 236ED40086
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrSASzcTzmxs for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC45B402A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC45B402A4
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA925876CD; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:46:53 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1a8ed1e8554406bf6fb0ba5f3679ee8a19176052
X-Git-Newrev: 69209476e6cdab45a856c194bd36df04ece2e82b
X-Patchwork-Hint: ignore
Message-Id: <20250604182758.DA925876CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-django:
 clarify licensing
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

commit: https://git.buildroot.net/buildroot/commit/?id=69209476e6cdab45a856c194bd36df04ece2e82b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Django includes code from a couple of other projects, add their
respective license files and licenses to the django package.

./utils/scanpypi finds most of these. Additionally this was
cross-checked against debian's license list [1], not including some
things that no longer exist or no longer indicate separate licensing
upstream:
* django/contrib/admin/static/admin/fonts/
* django/utils/baseconv.py
* django/utils/ipv6.py
* django/utils/autoreload.py

Also not included are separate licensing for docs, which buildroot
doesn't package:
* docs/_theme/djangodocs/static/reset-fonts-grids.css
* docs/_theme/djangodocs/static/fontawesome/LICENSE.txt

[1] https://metadata.ftp-master.debian.org/changelogs//main/p/python-django/python-django_5.2-1_copyright

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[Peter: Indent with single tab]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 15fdc8b0caead41dcb9ce3ff81b5cb24cfce5f14)
[Thomas: Changed the hash of
  django/contrib/admin/static/admin/js/inlines.js to match 5.1.9
]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-django/python-django.hash | 10 ++++++++++
 package/python-django/python-django.mk   | 14 ++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 57b9e9fb0e..b5614fa8b7 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -3,3 +3,13 @@ md5  da93c81fcaf2e0b4dab3cf44e7564c7c  django-5.1.9.tar.gz
 sha256  565881bdd0eb67da36442e9ac788bda90275386b549070d70aee86327781a4fc  django-5.1.9.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
+sha256  dcac1c86cb7ab491702bdb4c41be680fafde51536748cc8aaee3840eec53ed17  django/contrib/gis/measure.py
+sha256  570a045a8372b6cd6a00e30ebafe8e3e8dfc0a7fe3d4ef2cc5f16d419eb63aeb  django/contrib/gis/gdal/LICENSE
+sha256  08bf24b7551238ae325295245425b1caeb9ad0f42f9e2d303c7b353502632045  django/contrib/gis/geos/LICENSE
+sha256  c9607e292c3f699995669222b4a75eee29b28006b7e8b05daa805f07b953bc94  django/contrib/admin/static/admin/js/inlines.js
+sha256  d4db9ebe6f29f5168eac45ad713f055623ac5d0dcd5ba92da23d650ae012020d  django/contrib/admin/static/admin/js/vendor/jquery/LICENSE.txt
+sha256  4ee0cbc51370afde358652a0f977972053729ed578b6a42f5e2a037d114f0b39  django/contrib/admin/static/admin/js/vendor/select2/LICENSE.md
+sha256  73af2949bff9296cb0f816c3be19a4da4e95adc94c1f924796e8bad3f03f2f29  django/contrib/admin/static/admin/js/vendor/xregexp/LICENSE.txt
+sha256  d114faff3488c16c319b3235dc41f90239d3d63d9853733033d8f7535f5c0004  django/contrib/admin/static/admin/img/LICENSE
+sha256  54004c4b606964ebc163af16d04607c16e428f8a78a026fecb53f70c09f4a94f  django/dispatch/license.txt
+sha256  1ce0483ad554cf135efec70ad2097e82ed72790194f17e1591821dc82c2416e0  django/utils/archive.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index fd8a4eb9e8..2a2b6f08bc 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -8,8 +8,18 @@ PYTHON_DJANGO_VERSION = 5.1.9
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
 PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/10/08/2e6f05494b3fc0a3c53736846034f882b82ee6351791a7815bbb45715d79
-PYTHON_DJANGO_LICENSE = BSD-3-Clause
-PYTHON_DJANGO_LICENSE_FILES = LICENSE
+PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js)
+PYTHON_DJANGO_LICENSE_FILES = LICENSE \
+	django/contrib/gis/measure.py \
+	django/contrib/gis/gdal/LICENSE \
+	django/contrib/gis/geos/LICENSE \
+	django/contrib/admin/static/admin/js/inlines.js \
+	django/contrib/admin/static/admin/js/vendor/jquery/LICENSE.txt \
+	django/contrib/admin/static/admin/js/vendor/select2/LICENSE.md \
+	django/contrib/admin/static/admin/js/vendor/xregexp/LICENSE.txt \
+	django/contrib/admin/static/admin/img/LICENSE \
+	django/dispatch/license.txt \
+	django/utils/archive.py
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
 PYTHON_DJANGO_CPE_ID_PRODUCT = django
 PYTHON_DJANGO_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
