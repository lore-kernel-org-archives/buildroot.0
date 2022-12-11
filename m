Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CCEC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 08:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 389B260A91;
	Sun, 11 Dec 2022 08:57:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 389B260A91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zdfKSh6rRNR5; Sun, 11 Dec 2022 08:57:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7809A606DC;
	Sun, 11 Dec 2022 08:57:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7809A606DC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D0901BF3EA
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB5E1404DD
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB5E1404DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 89WtlC-EoRys for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:55:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EBBA404CF
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EBBA404CF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CF0E85FA6; Sun, 11 Dec 2022 08:55:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:28:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9eb2d23a260af9594ce80caace01bfa2deac3ff7
X-Git-Newrev: 045e99044223cfc707f5969791d7db2be8c5aa9b
X-Patchwork-Hint: ignore
Message-Id: <20221211085515.0CF0E85FA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: bump to version
 4.1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=045e99044223cfc707f5969791d7db2be8c5aa9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required pytz and setuptools runtime dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-django/Config.in          | 3 ---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/python-django/Config.in b/package/python-django/Config.in
index 8ffceb7275..5830cadc93 100644
--- a/package/python-django/Config.in
+++ b/package/python-django/Config.in
@@ -3,10 +3,7 @@ config BR2_PACKAGE_PYTHON_DJANGO
 	select BR2_PACKAGE_PYTHON3_UNICODEDATA
 	select BR2_PACKAGE_PYTHON3_PYEXPAT
 	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
-	select BR2_PACKAGE_PYTHON_PYTZ # runtime
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_SQLPARSE # runtime
-
 	help
 	  Django is a high-level Python Web framework that encourages
 	  rapid development and clean, pragmatic design. It takes your
diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index b9ae8a1da1..40526bc0ff 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  60c54c37ecf9e5e635ee6bb07a13a9fa  Django-4.1.3.tar.gz
-sha256  678bbfc8604eb246ed54e2063f0765f13b321a50526bdc8cb1f943eda7fa31f1  Django-4.1.3.tar.gz
+md5  02e2222d064d800f37c6a0ba78ce87f3  Django-4.1.4.tar.gz
+sha256  d38a4e108d2386cb9637da66a82dc8d0733caede4c83c4afdbda78af4214211b  Django-4.1.4.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index c90caa9635..96ec53f82c 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.1.3
+PYTHON_DJANGO_VERSION = 4.1.4
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/d0/ab/33f9c2bd4cf7ff2d319131eca7231247f962f781ebc8a012ebe02582244a
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/de/7d/ca5d224f7d345b0defd0a57c6deb0c6115fbe5304e4d9571f728b617f1a3
 
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
