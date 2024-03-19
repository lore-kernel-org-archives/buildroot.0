Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E18FC6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 16:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B0B181F03;
	Tue, 19 Mar 2024 16:36:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VCnz7aHxrsbr; Tue, 19 Mar 2024 16:36:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 089BD81EE6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 089BD81EE6;
	Tue, 19 Mar 2024 16:36:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F3E051BF836
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 16:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDE09402D4
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 16:36:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d-LO2eaZzKyz for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 16:36:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1F9E403E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1F9E403E5
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 16:36:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8DE282D53; Tue, 19 Mar 2024 16:36:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 17:11:17 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: bc4f613e976fc74e24db1c30ef4940b3e4b4bc0c
X-Git-Newrev: 56de003fa31dc3e30e915c0d97d5af5becbdbc01
X-Patchwork-Hint: ignore
Message-Id: <20240319163621.B8DE282D53@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/python-django:
 security bump to version 4.2.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=56de003fa31dc3e30e915c0d97d5af5becbdbc01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fixes: CVE-2024-27351: Potential regular expression
denial-of-service in django.utils.text.Truncator.words()

https://www.djangoproject.com/weblog/2024/mar/04/security-releases/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index a0cca1f30e..ca678327c8 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  111a3d77ee7c7d95fd2187939d6e4deb  Django-4.2.10.tar.gz
-sha256  b1260ed381b10a11753c73444408e19869f3241fc45c985cd55a30177c789d13  Django-4.2.10.tar.gz
+md5  33dc961e25b6ed54e22b62726b334d4d  Django-4.2.11.tar.gz
+sha256  6e6ff3db2d8dd0c986b4eec8554c8e4f919b5c1ff62a5b4390c17aff2ed6e5c4  Django-4.2.11.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 6f082c679a..1647fc0593 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 4.2.10
+PYTHON_DJANGO_VERSION = 4.2.11
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/52/ae/84530c15c4df0830837a6417956f16ff1b410412915282db78a27a7fb03c
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/d2/e2/c0e7586dd4db1140be179b1386346d1b2e2570dfc7c0d1c0343bdf0d43b0
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
