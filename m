Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798F4C5475B
	for <buildroot@archiver.kernel.org>; Fri,  8 Mar 2024 14:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 363F240A6B;
	Fri,  8 Mar 2024 14:41:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cr5h_CjoWZGp; Fri,  8 Mar 2024 14:41:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EBB140AE0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EBB140AE0;
	Fri,  8 Mar 2024 14:41:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 97C9A1BF279
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 14:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 833546176A
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 14:41:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PrsMfIp2zPDn for <buildroot@lists.busybox.net>;
 Fri,  8 Mar 2024 14:41:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4BAF6176C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4BAF6176C
 for <buildroot@buildroot.org>; Fri,  8 Mar 2024 14:41:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B09DC881D1; Fri,  8 Mar 2024 14:41:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 8 Mar 2024 15:17:15 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: ca5b2057015ab0b7b640a8ef8b663be74c622ae3
X-Git-Newrev: 65878ea1a963ab059ef6a5dcbcd1d2f1fb698d5d
X-Patchwork-Hint: ignore
Message-Id: <20240308144106.B09DC881D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/python-django:
 security bump to version 4.2.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=65878ea1a963ab059ef6a5dcbcd1d2f1fb698d5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fixes the following security issue:

- CVE-2024-24680: Potential denial-of-service in intcomma template filter

  The intcomma template filter was subject to a potential denial-of-service
  attack when used with very long strings.

https://www.djangoproject.com/weblog/2024/feb/06/security-releases/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 98c338f9d4..a0cca1f30e 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  d7afe6a68b631725a1dac116a7832b10  Django-4.2.7.tar.gz
-sha256  8e0f1c2c2786b5c0e39fe1afce24c926040fad47c8ea8ad30aaf1188df29fc41  Django-4.2.7.tar.gz
+md5  111a3d77ee7c7d95fd2187939d6e4deb  Django-4.2.10.tar.gz
+sha256  b1260ed381b10a11753c73444408e19869f3241fc45c985cd55a30177c789d13  Django-4.2.10.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 9b710412fa..6f082c679a 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.2.7
+PYTHON_DJANGO_VERSION = 4.2.10
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/5c/62/0c6ab2f3ac9a242b4562b6be1c418685fa7d1ccb8ca302cdb97e0b23cf4b
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/52/ae/84530c15c4df0830837a6417956f16ff1b410412915282db78a27a7fb03c
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
