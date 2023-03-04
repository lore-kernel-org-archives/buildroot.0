Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56745C678D5
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 19:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFB12416DC;
	Sat,  4 Mar 2023 19:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFB12416DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v4hCmytCPK1k; Sat,  4 Mar 2023 19:52:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2DB1416D5;
	Sat,  4 Mar 2023 19:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2DB1416D5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 431601BF337
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 19:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D2B960C2D
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 19:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D2B960C2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jLymwJWr86Fv for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 19:51:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21B9860C1D
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 19:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21B9860C1D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1195C86162; Sat,  4 Mar 2023 19:51:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Mar 2023 20:51:20 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: e99acbda3c525ca657e0b1a3876028c4b33bfe49
X-Git-Newrev: fd0e9ac8e83ec0ce552f9fa3409b56cd8571635b
X-Patchwork-Hint: ignore
Message-Id: <20230304195133.1195C86162@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/python-django:
 security bump to version 4.0.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd0e9ac8e83ec0ce552f9fa3409b56cd8571635b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fix CVE-2023-23969 and CVE-2023-24580

https://docs.djangoproject.com/en/dev/releases/4.0.9
https://docs.djangoproject.com/en/dev/releases/4.0.10

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 72adc30bb1..99730d2d66 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  75ec07b3e00c79fd6e67fbee53786b7a  Django-4.0.8.tar.gz
-sha256  07e6433f263c3839939cfabeb6d7557841e0419e47759a7b7d37f6d44d40adcb  Django-4.0.8.tar.gz
+md5  1ff999292535f0c9fd729e60e3365c49  Django-4.0.10.tar.gz
+sha256  2c2f73c16b11cb272c6d5e3b063f0d1be06f378d8dc6005fbe8542565db659cc  Django-4.0.10.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 567d590f77..4bce93a9cf 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.0.8
+PYTHON_DJANGO_VERSION = 4.0.10
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/1a/de/08d8a349ed0e3e1999eb86ae0347cc9eaf634cd65f1eb80b9387ac1dbe3c
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/44/92/b0ceee230f9252460abf8c0a3bcc003a914af85ad63006596c3fb3669fbf
 
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
