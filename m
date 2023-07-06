Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4393EEB64DC
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 11:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD1E2417D9;
	Thu,  6 Jul 2023 11:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD1E2417D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJcrHao5XZ45; Thu,  6 Jul 2023 11:34:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78AE941877;
	Thu,  6 Jul 2023 11:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78AE941877
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22D521BF97D
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A3F860BB6
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A3F860BB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rcNaF48NWaBK for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 11:34:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 219A760A91
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 11:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 219A760A91
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1178386896; Thu,  6 Jul 2023 11:34:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 13:30:22 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 115f51407e48d981a2d4ff7a51cc2d7d413e7739
X-Git-Newrev: 989da60ac49366c715fa1319aded0e1dea59236c
X-Patchwork-Hint: ignore
Message-Id: <20230706113428.1178386896@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-django:
 security bump to version 4.1.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=989da60ac49366c715fa1319aded0e1dea59236c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes the following security issues:

- CVE-2023-31047: Potential bypass of validation when uploading multiple
  files using one form field

https://www.djangoproject.com/weblog/2023/may/03/security-releases/

In addition, 4.1.8 fixed a bug related to secrets rotation:
https://docs.djangoproject.com/en/4.2/releases/4.1.8/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit fa1d011a05c526c06b27edd388378e255b2f055c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index cb03b33bfe..922f468a67 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  626f96c63ddfab24bab90d80c87a7aad  Django-4.1.7.tar.gz
-sha256  44f714b81c5f190d9d2ddad01a532fe502fa01c4cb8faf1d081f4264ed15dcd8  Django-4.1.7.tar.gz
+md5  1a6f4e5318e3272deaa9cfd61e252fab  Django-4.1.9.tar.gz
+sha256  e9f074a84930662104871bfcea55c3c180c50a0a47739db82435deae6cbaf032  Django-4.1.9.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index e8c91cf51f..fa58f65797 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.1.7
+PYTHON_DJANGO_VERSION = 4.1.9
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/9f/a7/07939866241b7e8f8d3bf164b7d6ad428163723e29dd472700f8ab0e5fd5
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/11/ea/8b514434c57c3bef89a475b75f74d768471d8e1bc61f4e5c79daeae9b5ef
 
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
