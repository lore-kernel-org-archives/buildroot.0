Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B712DC369A2
	for <buildroot@archiver.kernel.org>; Thu, 10 Apr 2025 20:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33E6840BCE;
	Thu, 10 Apr 2025 20:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rlDDo1i92W7v; Thu, 10 Apr 2025 20:34:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB8E0412E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB8E0412E7;
	Thu, 10 Apr 2025 20:34:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A0B3108
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 20:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FC37403BF
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 20:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0NQAZqNuqtmy for <buildroot@buildroot.org>;
 Thu, 10 Apr 2025 20:33:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B22C140B26
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B22C140B26
 for <buildroot@buildroot.org>; Thu, 10 Apr 2025 20:33:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B57E283CE7; Thu, 10 Apr 2025 20:33:59 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 10 Apr 2025 22:24:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e863acaa1aa64e52ae313cc51a46eb910c92c0bf
X-Git-Newrev: f2b14baf2576b54cca43e6f2aebbb4a19fae3bd9
X-Patchwork-Hint: ignore
Message-Id: <20250410203359.B57E283CE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-django: security bump to
 version 5.1.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2b14baf2576b54cca43e6f2aebbb4a19fae3bd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2025-26699: Potential denial-of-service vulnerability in
    django.utils.text.wrap()

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-26699
  - https://github.com/django/django/commit/8dbb44d34271637099258391dfc79df33951b841

- CVE-2025-27556: Potential denial-of-service vulnerability in
    LoginView, LogoutView, and set_language() on Windows

This CVE isn't related to buildroot has it is only applicable on
Windows but this package version bump fix it.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-27556
  - https://github.com/django/django/commit/edc2716d01a6fdd84b173c02031695231bcee1f8

For more details on the version bump, see the release notes:
  - https://docs.djangoproject.com/en/5.1/releases/5.1.8/
  - https://docs.djangoproject.com/en/5.1/releases/5.1.7/
  - https://docs.djangoproject.com/en/5.1/releases/5.1.6/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 6632246af8..1e197004d0 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  272e951dbc4ccb7854c5a69aa5650749  Django-5.1.5.tar.gz
-sha256  19bbca786df50b9eca23cee79d495facf55c8f5c54c529d9bf1fe7b5ea086af3  Django-5.1.5.tar.gz
+md5  80247a8b48cdac55e5ad3fb682ab71a3  Django-5.1.8.tar.gz
+sha256  42e92a1dd2810072bcc40a39a212b693f94406d0ba0749e68eb642f31dc770b4  Django-5.1.8.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 81d526ca35..b64d8e4cd1 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.1.5
+PYTHON_DJANGO_VERSION = 5.1.8
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/e4/17/834e3e08d590dcc27d4cc3c5cd4e2fb757b7a92bab9de8ee402455732952
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/00/40/45adc1b93435d1b418654a734b68351bb6ce0a0e5e37b2f0e9aeb1a2e233
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
