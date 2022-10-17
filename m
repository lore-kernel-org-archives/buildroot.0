Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7068C4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 20:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CCD1403FF;
	Mon, 17 Oct 2022 20:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CCD1403FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bR_7Fz3_G4wO; Mon, 17 Oct 2022 20:37:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C47B400DD;
	Mon, 17 Oct 2022 20:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C47B400DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 68FF61BF313
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 20:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4479560F88
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 20:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4479560F88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id exN6iO4objmP for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 20:37:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00C3860F86
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 20:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00C3860F86
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1B6586E92; Mon, 17 Oct 2022 20:37:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 17 Oct 2022 22:37:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 291c6c27adaf75ffd1d84b920e1ed79c3f84cc13
X-Git-Newrev: 5b5d3befef9c92a7485c1c68989d95749882ee2a
X-Patchwork-Hint: ignore
Message-Id: <20221017203747.E1B6586E92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: security bump to
 version 4.0.8
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5b5d3befef9c92a7485c1c68989d95749882ee2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2022-36359: Potential reflected file download vulnerability in
  FileResponse (4.0.7)
  https://www.djangoproject.com/weblog/2022/aug/03/security-releases/

- CVE-2022-41323: Potential denial-of-service vulnerability in
  internationalized URLs (4.0.8)
  https://www.djangoproject.com/weblog/2022/oct/04/security-releases/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index bfc9219c7e..72adc30bb1 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  ad4e850c7110a45a6c7778d5bd01b85e  Django-4.0.6.tar.gz
-sha256  a67a793ff6827fd373555537dca0da293a63a316fe34cb7f367f898ccca3c3ae  Django-4.0.6.tar.gz
+md5  75ec07b3e00c79fd6e67fbee53786b7a  Django-4.0.8.tar.gz
+sha256  07e6433f263c3839939cfabeb6d7557841e0419e47759a7b7d37f6d44d40adcb  Django-4.0.8.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index d49c845d54..567d590f77 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.0.6
+PYTHON_DJANGO_VERSION = 4.0.8
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/a4/17/b10aa26d7a566a3c19e9d29fac39c8643cbceb6cd7649a378d676839b5db
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/1a/de/08d8a349ed0e3e1999eb86ae0347cc9eaf634cd65f1eb80b9387ac1dbe3c
 
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
