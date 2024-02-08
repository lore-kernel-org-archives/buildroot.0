Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB32FC4828F
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 14:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE36641DEC;
	Thu,  8 Feb 2024 14:30:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0aOUbvFhNSJJ; Thu,  8 Feb 2024 14:30:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EDE341DE0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EDE341DE0;
	Thu,  8 Feb 2024 14:30:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3DA21BF369
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 14:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1A476F7A0
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 14:30:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xyVmg8pbk9I7 for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 14:30:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC55160BB0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC55160BB0
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 14:30:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D348E87598; Thu,  8 Feb 2024 14:30:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 8 Feb 2024 15:29:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de3684f57df79c19eba34dac98418ceeaccd03db
X-Git-Newrev: 034c57b2e24acaa236ac5f6a23e6e42b0522b221
X-Patchwork-Hint: ignore
Message-Id: <20240208143011.D348E87598@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: security bump to
 5.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=034c57b2e24acaa236ac5f6a23e6e42b0522b221
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Minor 5.0 bugfix release [1] fixing one "moderate" severity CVE.

Fixes: CVE-2024-24680

[1] https://docs.djangoproject.com/en/5.0/releases/5.0.2/#django-5-0-2-release-notes

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 39fd9afdae..20b66a4106 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  5ff3c69d7e6b4f5ed378ec5713af8df7  Django-5.0.1.tar.gz
-sha256  8c8659665bc6e3a44fefe1ab0a291e5a3fb3979f9a8230be29de975e57e8f854  Django-5.0.1.tar.gz
+md5  5d0df847e1b751a4a5d2bde1563c75fc  Django-5.0.2.tar.gz
+sha256  b5bb1d11b2518a5f91372a282f24662f58f66749666b0a286ab057029f728080  Django-5.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index ed4f4bcdf1..231de0b833 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.0.1
+PYTHON_DJANGO_VERSION = 5.0.2
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/53/82/c8e8ed137da1c72fa110e3be9ab0f26bcfcf6f3d2994601d164dfac86269
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/50/98/499a2d11eb0b22fdd55ce5895e0f5ce6d7d4957a785f237a89317cb478fa
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
