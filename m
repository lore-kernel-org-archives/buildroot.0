Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEC5E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A17F84910;
	Fri,  6 Sep 2024 20:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5h5M72UIFMPL; Fri,  6 Sep 2024 20:04:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DA4284912
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DA4284912;
	Fri,  6 Sep 2024 20:04:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58CFB1BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D429A40BF3
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eDXqRnxsem9B for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBC4F40908
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBC4F40908
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B720986C5A; Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 19:28:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ff3768333f224f81a6afa4802755de9b125ca84
X-Git-Newrev: 26905d3d5802c8126b50ddff93a9bc73b3d30656
X-Patchwork-Hint: ignore
Message-Id: <20240906195856.B720986C5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: bump to 5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=26905d3d5802c8126b50ddff93a9bc73b3d30656
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://docs.djangoproject.com/en/5.1/releases/5.1/

We need to add --skip-dependency-check to build options as django
currently pins setuptools <69.3 [1] and buildroot uses a newer version.

The Django pin is likely to not be affected by PEP-625 [2] handling,
which was added to setuptools 69.3 [3][4]. We don't really care about
the sdist name changing for django though, so we can use a newer version
of setuptools as well.

Django has been confirmed to still install and work correctly by running
the runtime test.

[1] https://github.com/django/django/commit/4686541691dbe986f58ac87630c3b7a04db4ff93
[2] https://peps.python.org/pep-0625/
[3] https://github.com/pypa/setuptools/issues/3593
[4] https://github.com/pypa/setuptools/blob/main/NEWS.rst#v6930

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index a5a8c7426d..8ddc221973 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  fb167eef987a98421cad62036868a1ca  Django-5.0.8.tar.gz
-sha256  ebe859c9da6fead9c9ee6dbfa4943b04f41342f4cea2c4d8c978ef0d10694f2b  Django-5.0.8.tar.gz
+md5  77f44885427c09458e1abd0b48e09517  Django-5.1.tar.gz
+sha256  848a5980e8efb76eea70872fb0e4bc5e371619c70fffbe48e3e1b50b2c09455d  Django-5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 2c5c20ee4d..de5d2a9d06 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.0.8
+PYTHON_DJANGO_VERSION = 5.1
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/79/1c/55733805bb735e26fee0430045efdb61df6fd704b6aebf2154875ef9e6a9
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/1e/0c/d854d25bb74a8a3b41e642bbd27fe6af12fadd0edfd07d487809cf0ef719
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
 PYTHON_DJANGO_CPE_ID_PRODUCT = django
 PYTHON_DJANGO_SETUP_TYPE = setuptools
+PYTHON_DJANGO_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
