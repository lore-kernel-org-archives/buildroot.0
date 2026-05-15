Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A24CD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 801678474A;
	Fri, 15 May 2026 17:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 43Tsf8cN60_C; Fri, 15 May 2026 17:47:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 847A58473B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867243;
	bh=CKzexw3MbXfNRiQE+tw2mULwuT0SjeVHlIjzoK0Wg98=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O9J9WvpesDoVJt+KMamyp9/hZF2cIdkKHRXJHDJp6iocAN+KEKWWVn44cPEq5dr8+
	 lSFitXS7CRMGDbWXnwjRttrsSgxRA8RfDTfAiLu17Ymi0HpEp1rZXyM/zjlpgl2X/5
	 xZYlChjW0tsYojxzFzLFExwjRWnR8rCra87FCMdu+vWPbjyGQkpRUIsd46ByhLdQa2
	 sN4/jIesG2N3N+c0+UPSwu60V2S86PsHmrA8l6cbQCIdKHgz4YgfbgJmtNeA33BZGc
	 opmL0ldI6m0oiCRquutQFA6kI2sy/ObVVhO1OEPNtvfn6wuQGOjRUn5rn6Hu7FoBXb
	 Kyp85MJFUNz0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 847A58473B;
	Fri, 15 May 2026 17:47:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 025F445B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A23741D9F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nyA-taE94y71 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D6BA41DA5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D6BA41DA5
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BAB8863DA; Fri, 15 May 2026 17:46:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:44:56 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 440738e2910d462b61594bbe7869482eb3613386
X-Git-Newrev: 742c874f67dd3681b9415a40d32b444cdbf5605e
X-Patchwork-Hint: ignore
Message-Id: <20260515174640.7BAB8863DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/python-django:
 security bump to 6.0.5
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2918384676290053508=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2918384676290053508==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/742c874f67dd3681b9415a40d32b444cdbf5605e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Django 6.0.5 fixes three security issues with severity “low” and several bugs in 6.0.4.

Security Fixes:
* CVE-2026-5766: Potential denial-of-service vulnerability in ASGI
    requests via file upload limit bypass ASGI requests with a missing
    or understated Content-Length header could bypass the
    FILE_UPLOAD_MAX_MEMORY_SIZE limit, potentially loading large files into
    memory and causing service degradation.

    As a reminder, Django expects a limit to be configured at the web server
    level rather than solely relying on FILE_UPLOAD_MAX_MEMORY_SIZE.

    This issue has severity “low” according to the Django security policy

* CVE-2026-35192: Session fixation via public cached pages and SESSION_SAVE_EVERY_REQUEST
    Response headers did not vary on cookies if a session was not modified,
    but SESSION_SAVE_EVERY_REQUEST was True. A remote attacker could steal a
    user’s session after that user visits a cached public page.

    This issue has severity “low” according to the Django security policy.

* CVE-2026-6907: Potential exposure of private data due to incorrect
    handling of Vary: * in UpdateCacheMiddleware

    Previously, UpdateCacheMiddleware would erroneously cache requests where
    the Vary header contained an asterisk ('*'). This could lead to private
    data being stored and served.

    This issue has severity “low” according to the Django security policy.

Bugfixes:
* Fixed a misplaced </div> in the
  django/contrib/admin/templates/admin/change_list.html template added
  in Django 6.0 that could be problematic when overriding the pagination
  block (#37029).
* Fixed a bug in Django 6.0 where deprecation warnings incorrectly
  skipped lines from third-party packages prefixed with “django”
  (#37067).

Release notes: https://docs.djangoproject.com/en/6.0/releases/6.0.5/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4fe009b6aa6f6dd74630656f55c8cc656611bd1b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 6c317cf6e0..5af043f2c2 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  9d429cbef8c8357a480d0b920dd9a956  django-6.0.4.tar.gz
-sha256  8cfa2572b3f2768b2e84983cf3c4811877a01edb64e817986ec5d60751c113ac  django-6.0.4.tar.gz
+md5  44c18a8f264c1326e6fe4f1053fea5fc  django-6.0.5.tar.gz
+sha256  bc6d6872e98a2864c836e42edd644b362db311147dd5aa8d5b82ba7a032f5269  django-6.0.5.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  be30dc0e3f7010af6c453d205feaece1f89494789b6e92f0c255ef597a1e6864  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 201eece164..fe88128e24 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 6.0.4
+PYTHON_DJANGO_VERSION = 6.0.5
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/source/d/django
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js), CC-BY-4.0 (admin svg files)

--===============2918384676290053508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2918384676290053508==--
