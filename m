Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC34AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 20:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DD08403C4;
	Wed, 16 Feb 2022 20:55:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q6c1bbLgBHQY; Wed, 16 Feb 2022 20:55:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7ABFA40191;
	Wed, 16 Feb 2022 20:55:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C03911BF425
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD94C40191
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hI5BI379Hngg for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 20:55:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4E8640164
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 20:55:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E59F38360A; Wed, 16 Feb 2022 20:47:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 21:54:00 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 5f24db1f9681f13343bc9c8d6fbfc434838480c8
X-Git-Newrev: 2fbfb5271e3e7b93fa57ef13de14e54e265e9136
X-Patchwork-Hint: ignore
Message-Id: <20220216204754.E59F38360A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/python-django:
 security bump to version 3.2.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=2fbfb5271e3e7b93fa57ef13de14e54e265e9136
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Fixes the following security issues:

- CVE-2022-22818: Possible XSS via {% debug %} template tag

  The {% debug %} template tag didn't properly encode the current context,
  posing an XSS attack vector.

  In order to avoid this vulnerability, {% debug %} no longer outputs
  information when the DEBUG setting is False, and it ensures all context
  variables are correctly escaped when the DEBUG setting is True.

- CVE-2022-23833: Denial-of-service possibility in file uploads

  Passing certain inputs to multipart forms could result in an infinite loop
  when parsing files.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 89bc5ffb19..a54c22a101 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  6c4a53d2ccb464bc3dd772c6f2f07df9  Django-3.2.11.tar.gz
-sha256  69c94abe5d6b1b088bf475e09b7b74403f943e34da107e798465d2045da27e75  Django-3.2.11.tar.gz
+md5  1847b2f286930a9d84e820a757e3a7ec  Django-3.2.12.tar.gz
+sha256  9772e6935703e59e993960832d66a614cf0233a1c5123bc6224ecc6ad69e41e2  Django-3.2.12.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 25a645823b..676aa780c3 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 3.2.11
+PYTHON_DJANGO_VERSION = 3.2.12
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/20/86/e4348aac45bc83fc8e9dda2cfd81004b007c65b68c1499a4233acabdaa3b
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/83/d9/7f28811ff78ce1903dc9a32ac439e4e6c98298cd2e99cb01f528e51dd796
 
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
