Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1E0CD37AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11AEA607A7;
	Tue,  3 Sep 2024 19:34:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCkFUeW2qdQl; Tue,  3 Sep 2024 19:34:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A660960809
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A660960809;
	Tue,  3 Sep 2024 19:34:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E6061BF95C
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BDB940A22
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hg0hNQCDrGBJ for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:34:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42F2A40A20
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42F2A40A20
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:34:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 373AE86B86; Tue,  3 Sep 2024 19:34:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 21:31:34 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 056fe139e4a007d439af883f75a76f3c6c1c0712
X-Git-Newrev: f69dcc46b8343ae50eafaa4b801a084365fee3d4
X-Patchwork-Hint: ignore
Message-Id: <20240903193408.373AE86B86@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/python-django:
 security bump to version 5.0.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=f69dcc46b8343ae50eafaa4b801a084365fee3d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Django 5.0.7 fixes the following CVEs:

* CVE-2024-38875: Potential denial-of-service vulnerability in django.utils.html.urlize()
* CVE-2024-39329: Username enumeration through timing difference for users with unusable passwords
* CVE-2024-39330: Potential directory-traversal via Storage.save()
* CVE-2024-39614: Potential denial-of-service vulnerability in get_supported_language_variant()

Django 5.0.8 fixes the following CVEs:

* CVE-2024-41989: Memory exhaustion in django.utils.numberformat.floatformat()
* CVE-2024-41990: Potential denial-of-service vulnerability in django.utils.html.urlize()
* CVE-2024-41991: Potential denial-of-service vulnerability in django.utils.html.urlize() and AdminURLFieldWidget
* CVE-2024-42005: Potential SQL injection in QuerySet.values() and values_list()

Further release Notes: https://docs.djangoproject.com/en/5.0/releases/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f777ce1fd6b9e0537593a70940dc23f4ca177054)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index d5684a083c..a5a8c7426d 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  1009c48d70060cadb40000cc15a8058a  Django-5.0.3.tar.gz
-sha256  5fb37580dcf4a262f9258c1f4373819aacca906431f505e4688e37f3a99195df  Django-5.0.3.tar.gz
+md5  fb167eef987a98421cad62036868a1ca  Django-5.0.8.tar.gz
+sha256  ebe859c9da6fead9c9ee6dbfa4943b04f41342f4cea2c4d8c978ef0d10694f2b  Django-5.0.8.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 258ff9e0c1..2c5c20ee4d 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.0.3
+PYTHON_DJANGO_VERSION = 5.0.8
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/e1/b1/ac6a16aaf0049637b50afbcf06b8ec2fa5c6ce42d4ae6ba66bbaf4c3609a
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/79/1c/55733805bb735e26fee0430045efdb61df6fd704b6aebf2154875ef9e6a9
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
