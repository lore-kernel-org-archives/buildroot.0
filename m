Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8671CCE7A8E
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 19:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A16D40361;
	Thu,  5 Sep 2024 19:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aqFG_LPGdTXD; Thu,  5 Sep 2024 19:44:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFECF4039D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFECF4039D;
	Thu,  5 Sep 2024 19:44:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE60E1BF423
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D95A160AED
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vs_JvMgUHvyq for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 19:44:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 073916062D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 073916062D
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 19:44:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E408F86DF6; Thu,  5 Sep 2024 19:44:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Sep 2024 21:44:12 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f35edfe7f1aa6f2a235ba597f37c5138b7fd65b4
X-Git-Newrev: c5f342af1e0e9fbad71a7a45cc17dfcdbc6eb16b
X-Patchwork-Hint: ignore
Message-Id: <20240905194423.E408F86DF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-django:
 security bump to 5.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c5f342af1e0e9fbad71a7a45cc17dfcdbc6eb16b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
* CVE-2024-45230
* CVE-2024-45231

Further changes: https://docs.djangoproject.com/en/5.1/releases/5.1.1/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 8ddc221973..d39bf4d081 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  77f44885427c09458e1abd0b48e09517  Django-5.1.tar.gz
-sha256  848a5980e8efb76eea70872fb0e4bc5e371619c70fffbe48e3e1b50b2c09455d  Django-5.1.tar.gz
+md5  8024c23d7efe9e7acb04496ae22739c7  Django-5.1.1.tar.gz
+sha256  021ffb7fdab3d2d388bc8c7c2434eb9c1f6f4d09e6119010bbb1694dda286bc2  Django-5.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index de5d2a9d06..cfe23ab16b 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.1
+PYTHON_DJANGO_VERSION = 5.1.1
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/1e/0c/d854d25bb74a8a3b41e642bbd27fe6af12fadd0edfd07d487809cf0ef719
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/88/6f/8f57ed6dc88656edd4fcb35c50dd963f3cd79303bd711fb0160fc7fd6ab7
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
