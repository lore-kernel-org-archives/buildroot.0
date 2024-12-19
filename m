Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67718E77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 08:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EDAC612DA;
	Thu, 19 Dec 2024 08:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IxOjOxToavSb; Thu, 19 Dec 2024 08:45:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B58A613C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B58A613C9;
	Thu, 19 Dec 2024 08:45:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A5976C
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 08:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EED2C4171A
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 08:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UmrB9fYS9nca for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 08:45:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F366A415B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F366A415B0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 08:45:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA3758740F; Thu, 19 Dec 2024 08:45:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Dec 2024 09:44:32 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 460cce92473dfa4dbaad3a05f7286554f1d8cca7
X-Git-Newrev: 310d70cb08b5443934defb51fed05abf4b48ab42
X-Patchwork-Hint: ignore
Message-Id: <20241219084525.DA3758740F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/python-django:
 security bump to version 5.0.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=310d70cb08b5443934defb51fed05abf4b48ab42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes the following security issues:

CVE-2024-53907: Potential denial-of-service in
django.utils.html.strip_tags()

The strip_tags() method and striptags template filter are subject to a
potential denial-of-service attack via certain inputs containing large
sequences of nested incomplete HTML entities.

CVE-2024-53908: Potential SQL injection in HasKey(lhs, rhs) on Oracle

Direct usage of the django.db.models.fields.json.HasKey lookup on Oracle is
subject to SQL injection if untrusted data is used as a lhs value.
Applications that use the jsonfield.has_key lookup through the __ syntax are
unaffected.

https://www.djangoproject.com/weblog/2024/dec/04/security-releases/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 413745e133..463ca4d4f7 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  8669004de8eb7f1a558400f9103c0001  Django-5.0.9.tar.gz
-sha256  6333870d342329b60174da3a60dbd302e533f3b0bb0971516750e974a99b5a39  Django-5.0.9.tar.gz
+md5  9e539af55750660a1095775fac910d1a  Django-5.0.10.tar.gz
+sha256  0f6cbc56cc298b0451d20a5120c6a8731e9073330fb5d84295c23c151a1eb300  Django-5.0.10.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 8232a90026..7c64c65d00 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.0.9
+PYTHON_DJANGO_VERSION = 5.0.10
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/fa/7b/176ce335cba42342b8f20efbdd5eb27067a0b34ee2203e051b34bedca0d9
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/a8/52/06fedfe94a2610e2ea94ba3786c5475088e1e422b31c0ecd5b4c2ae6a561
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
