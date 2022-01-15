Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2A0C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 15:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0042181B14;
	Sat, 15 Jan 2022 15:38:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uY25NzX_WWs2; Sat, 15 Jan 2022 15:38:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34819818C4;
	Sat, 15 Jan 2022 15:38:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A4F21BF4E7
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 15:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7515860A87
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 15:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8NeqXjBsWlFB for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 15:37:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3419960B31
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 15:37:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E72CE82B52; Sat, 15 Jan 2022 15:30:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 16:37:07 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 773d3bf98e7c0420ab45319355c460f62a72d8f5
X-Git-Newrev: 0896f414e6417b5491496d8793d407c6b19919ae
X-Patchwork-Hint: ignore
Message-Id: <20220115153049.E72CE82B52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/python-django:
 security bump to version 3.2.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=0896f414e6417b5491496d8793d407c6b19919ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Fixes the following security issues:

- CVE-2021-44420: Potential bypass of an upstream access control based on
  URL paths

  HTTP requests for URLs with trailing newlines could bypass an upstream
  access control based on URL paths.

  This issue has low severity, according to the Django security policy.

  https://www.djangoproject.com/weblog/2021/dec/07/security-releases/

In addition, 3.2.8 / 3.2.9 fixes a number of bugs.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 086d357dfb177ef28d7831716707d2424a2ea4bd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index ab89f0341c..3eea17e70f 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  2ade1eecca77640abbde6c4589da27dd  Django-3.2.7.tar.gz
-sha256  95b318319d6997bac3595517101ad9cc83fe5672ac498ba48d1a410f47afecd2  Django-3.2.7.tar.gz
+md5  eaf0c3b4ac6b22cae9068360e6fd2d1b  Django-3.2.10.tar.gz
+sha256  074e8818b4b40acdc2369e67dcd6555d558329785408dcd25340ee98f1f1d5c4  Django-3.2.10.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 0850aa1358..4f80208f0e 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 3.2.7
+PYTHON_DJANGO_VERSION = 3.2.10
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/59/45/c6fbb3a206df0b7dc3e6e8fae738e042c63d4ddf828c6e1ba10d7417a1d9
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/a5/8e/c6dfc718d572e4b33b56824b9e71e5ab9be8072e6747fc6184d206c3fdb3
+
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
