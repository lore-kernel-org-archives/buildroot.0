Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBB4C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 15:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E12C415C0;
	Sat, 23 Jul 2022 15:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E12C415C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CmWGa4Z9tCMB; Sat, 23 Jul 2022 15:03:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28157410B4;
	Sat, 23 Jul 2022 15:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28157410B4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F26F61BF859
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCAF782FE4
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCAF782FE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZsWz-IipyvGO for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 15:03:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14C4881CA7
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 15:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14C4881CA7
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0252F84624; Sat, 23 Jul 2022 14:49:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 17:00:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0dcc62c4ba00aaeaa836af7bc788c183fdd6828
X-Git-Newrev: 3e4f6e1b205a8e3ebb3c82ac704627618a8400a3
X-Patchwork-Hint: ignore
Message-Id: <20220723144951.0252F84624@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: security bump to
 version 4.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e4f6e1b205a8e3ebb3c82ac704627618a8400a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2022-34265: An issue was discovered in Django 3.2 before 3.2.14
and 4.0 before 4.0.6. The Trunc() and Extract() database functions are
subject to SQL injection if untrusted data is used as a kind/lookup_name
value. Applications that constrain the lookup name and kind choice to a
known safe list are unaffected.

https://www.djangoproject.com/weblog/2022/jul/04/security-releases

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 8d9f0aafdb..bfc9219c7e 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  153fcb5dd7360b7ad219d65cb53e2d57  Django-4.0.4.tar.gz
-sha256  4e8177858524417563cc0430f29ea249946d831eacb0068a1455686587df40b5  Django-4.0.4.tar.gz
+md5  ad4e850c7110a45a6c7778d5bd01b85e  Django-4.0.6.tar.gz
+sha256  a67a793ff6827fd373555537dca0da293a63a316fe34cb7f367f898ccca3c3ae  Django-4.0.6.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index b4d6ec21c9..d49c845d54 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.0.4
+PYTHON_DJANGO_VERSION = 4.0.6
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/d2/95/93d1f75da95624bf89e373d079fa72debf77f9b10acc31998cc52a5ff3f9
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/a4/17/b10aa26d7a566a3c19e9d29fac39c8643cbceb6cd7649a378d676839b5db
 
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
