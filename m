Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46996C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:46:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 042A76103B
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 042A76103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A03466071B;
	Sun, 26 Sep 2021 21:46:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pEY1oICCSIYA; Sun, 26 Sep 2021 21:46:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB5B66071C;
	Sun, 26 Sep 2021 21:46:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 625C11BF95D
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A5A8403B4
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:44:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k14FeaU-Ojx4 for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:44:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30005403C1
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:44:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8BC688D30A; Sun, 26 Sep 2021 21:42:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 23:37:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7feecad61771bda1497a56a613ae03f2b51b682
X-Git-Newrev: f71e240229894acee49ed556b2d939a875939dc6
X-Patchwork-Hint: ignore
Message-Id: <20210926214229.8BC688D30A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: bump to version
 3.2.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f71e240229894acee49ed556b2d939a875939dc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release, fixing a number of regressions:

- Fixed a regression in Django 3.2 that caused a crash validating "NaN"
  input with a forms.DecimalField when additional constraints, e.g.
  max_value, were specified (#32949).

- Fixed a bug in Django 3.2 where a system check would crash on a model with
  a reverse many-to-many relation inherited from a parent class (#32947).

- Fixed a regression in Django 3.2 that caused the incorrect offset
  extraction from fixed offset timezones (#32992).

https://docs.djangoproject.com/en/3.2/releases/3.2.6/
https://docs.djangoproject.com/en/3.2/releases/3.2.7/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 2f5f96a501..ab89f0341c 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  46e306a5a775cace03a03d5a158ff767  Django-3.2.5.tar.gz
-sha256  3da05fea54fdec2315b54a563d5b59f3b4e2b1e69c3a5841dda35019c01855cd  Django-3.2.5.tar.gz
+md5  2ade1eecca77640abbde6c4589da27dd  Django-3.2.7.tar.gz
+sha256  95b318319d6997bac3595517101ad9cc83fe5672ac498ba48d1a410f47afecd2  Django-3.2.7.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 1603063beb..0850aa1358 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 3.2.5
+PYTHON_DJANGO_VERSION = 3.2.7
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/95/3b/468fa33908feefac03c0a773bd73bb8a1ab1fb4ee06e9dd62d24981f4603
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/59/45/c6fbb3a206df0b7dc3e6e8fae738e042c63d4ddf828c6e1ba10d7417a1d9
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
