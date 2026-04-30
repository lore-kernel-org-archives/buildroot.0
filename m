Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F333CD3439
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 793DB41CB1;
	Mon,  4 May 2026 14:48:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQzsLKeY7opG; Mon,  4 May 2026 14:48:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8695341CB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906133;
	bh=oCH7IFQS2Zt7DW/gImsnxDlhXxRl4wi+I2oOBmfcjSs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VgbyuFmO8HIU5PBaG9UfdAau/UDLC0YLds1EvccBuEA9WEtIX+apUf/iKiFu/rzy6
	 YI4NfC3Ew+pQUa6QEd2V4ZOVk0xJzU9InWzpX19F0F8OVf5F3IeMXV4Mr96Fy9DMvU
	 3jWpeXlt+zP63PPVK7z//UAWox0vRyCCJKwfKkgqQIMSFxJKrgiS56U4GSscNtcR7b
	 k0YnmBDnPzjQy1Xiabl+LF697fzrWbJKHGEUEgWvVaUy4lI8aTo64rzY5vqm4wpo/x
	 cFUxQSCx/GigKfJP+nHFqXrLRJx5NwUMnP1jsgkvpKGU5XMxz0qOGNzP1s2Wxbz6FI
	 Kp81DKbW8dI0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8695341CB2;
	Mon,  4 May 2026 14:48:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B9815190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B74A740E08
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XsvXlTtn_MZH for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC0C84079C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC0C84079C
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF0238435A; Mon,  4 May 2026 14:48:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 14:06:29 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: a07b4bb16ae32559fb336be5c6454a101cebda76
X-Git-Newrev: d97a7101672921b8cf594c9d983fa47ecd84830f
X-Patchwork-Hint: ignore
Message-Id: <20260504144842.AF0238435A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/python-django:
 security bump to 6.0.4
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
Content-Type: multipart/mixed; boundary="===============0703278438782799194=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0703278438782799194==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d97a7101672921b8cf594c9d983fa47ecd84830f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Django 6.0.4 fixes one security issue with severity “moderate”, four
security issues with severity “low”, and several bugs in 6.0.3.

Security issues:
* CVE-2026-3902: ASGI header spoofing via underscore/hyphen conflation
    ASGIRequest normalizes header names following WSGI conventions, mapping
    hyphens to underscores. As a result, even in configurations where
    reverse proxies carefully strip security-sensitive headers named with
    hyphens, such a header could be spoofed by supplying a header named with
    underscores.

    Under WSGI, it is the responsibility of the server or proxy to avoid
    ambiguous mappings. (Django’s runserver was patched in CVE 2015-0219.)
    But under ASGI, there is not the same uniform expectation, even if many
    proxies protect against this under default configuration (including
    nginx via underscores_in_headers off;).

    Headers containing underscores are now ignored by ASGIRequest, matching
    the behavior of Daphne, the reference server for ASGI.

    This issue has severity “low” according to the Django security policy.

* CVE-2026-4277: Privilege abuse in GenericInlineModelAdmin¶

    Add permissions on inline model instances were not validated on
    submission of forged POST data in GenericInlineModelAdmin.

    This issue has severity “low” according to the Django security policy.

* CVE-2026-4292: Privilege abuse in ModelAdmin.list_editable¶

    Admin changelist forms using list_editable incorrectly allowed new
    instances to be created via forged POST data.

    This issue has severity “low” according to the Django security policy.

* CVE-2026-33033: Potential denial-of-service vulnerability in
    MultiPartParser via base64-encoded file upload¶

    When using django.http.multipartparser.MultiPartParser, multipart
    uploads with Content-Transfer-Encoding: base64 that include excessive
    whitespace may trigger repeated memory copying, potentially degrading
    performance.

    This issue has severity “moderate” according to the Django security policy.

* CVE-2026-33034: Potential denial-of-service vulnerability in
    ASGI requests via memory upload limit bypass¶

    ASGI requests with a missing or understated Content-Length header could
    bypass the DATA_UPLOAD_MAX_MEMORY_SIZE limit when reading
    HttpRequest.body, potentially loading an unbounded request body into
    memory and causing service degradation.

    This issue has severity “low” according to the Django security policy.

Bugfixes:
* Fixed a regression in Django 6.0 where alogin() and alogout() did not
  respectively set or clear request.user if it had already been
  materialized (e.g., by sync middleware) (#37017).
* Fixed a regression in Django 6.0 in admin forms where
  RelatedFieldWidgetWrapper incorrectly wrapped all widgets in a
  <fieldset> (#36949).
* Fixed a bug in Django 6.0 where the fields.E348 system check did not
  detect name clashes between model managers and related_names for
  non-self-referential relationships (#36973).

Release Notes:
https://docs.djangoproject.com/en/6.0/releases/6.0.4/

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 60ce218196281d76606849037986b275c4619ae9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index dca77f02e2..6c317cf6e0 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  0bb395b518e2f2f17e1a936deb7ba74c  django-6.0.3.tar.gz
-sha256  90be765ee756af8a6cbd6693e56452404b5ad15294f4d5e40c0a55a0f4870fe1  django-6.0.3.tar.gz
+md5  9d429cbef8c8357a480d0b920dd9a956  django-6.0.4.tar.gz
+sha256  8cfa2572b3f2768b2e84983cf3c4811877a01edb64e817986ec5d60751c113ac  django-6.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  be30dc0e3f7010af6c453d205feaece1f89494789b6e92f0c255ef597a1e6864  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 0cc68129ee..201eece164 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 6.0.3
+PYTHON_DJANGO_VERSION = 6.0.4
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/80/e1/894115c6bd70e2c8b66b0c40a3c367d83a5a48c034a4d904d31b62f7c53a
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/source/d/django
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js), CC-BY-4.0 (admin svg files)
 PYTHON_DJANGO_LICENSE_FILES = LICENSE \
 	django/contrib/gis/measure.py \

--===============0703278438782799194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0703278438782799194==--
