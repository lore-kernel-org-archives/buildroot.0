Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056066083603
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FcjQugqh
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D609760A44;
	Fri,  6 Nov 2026 16:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6a5eo6RdZqY7; Fri,  6 Nov 2026 16:08:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D68246090C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981335;
	b=krGZWEXbERWNsox6g5JNhK8icY9rND3QOkXYN9DxVbPlOtLav+Gxx3eGj8ku6JtItSWK
	 1Qmr7UeuXlwZlNdAHZ9wWoBLO8TbHUPChgVux6f2vbNbakRPgP60m7XaGhAxmvHm+85mk
	 lt3EMVFYORe+PV5OZwTA8G097LOOaOiiuG3XPGzN7sHEdTTTzGhItcTQStxg6qrZmtS80
	 IzGSPyURJxXyIph1pprXtRO3wOhXT+WbD3OymvVgz9S94bk4txocNEYufiRxNJV7Rmo/i
	 3gtxOyaIM/XQ2nm4ql5pl2jb2ZSxn5VwVpNOZtN1xKofhFpQc2a558gjXjG0HksvC0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981335;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=mljgJNhrypI3FU8YfPCiugdLEJhyZ08xlm6VRo7T2vM=;
	b=FhvjP//vTfbpGVuFVGXXWHwnLAj8ZMWgdwKxaLfBs/nmV8b7zPV1yCk25ELfh8vChE31
	 t3Hy7/e6q0bMP7meRtLkfdN8PvpsSuk/DMyyNRvNyr9BS300xyBgppZg35QCqY8QsbUwo
	 y6bZQubuLECJ9hFg7U1XFO9xHGmbNwzJhLtNzLVJ5u6xN+jeN6ZSHqoQM9FUxY4dEYwUL
	 RcnxrwGy67TH+oP49/K2qAtHk+aXwKDkSkC60z1133+rUJZSTN3TLMoM3THrjR9jmmsQk
	 5EJoaKmZSrpQoJrYNRmouD/3zhcBYtwFIipYQbJ2aUtyGx8y8zPBNC5QYrxeX8d2dtg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981334;
	bh=mljgJNhrypI3FU8YfPCiugdLEJhyZ08xlm6VRo7T2vM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FcjQugqhTim9l/hAMuFzKdFSqiONWmJj0luZODHKp0YIV8D7AbFnqcPpW7p/MpI/j
	 jMYW7c5W0dt1aGSJ6Wb8VTmxhBEUV7aRQjhUULxR2I9r0Ilz3YsVOf3d8/St51DpT8
	 cFybZr4JX5+bxFTjkFloeWEEsEfHb7PwRysS+j0TpnVQRkeicRH6YKvUNZTVwpspgu
	 Q7+fLya9dLiXSAlZyKxAvn8lJyUgnYh0YZRmeQU+NMBg9s3ObPNqx33rf01kceAM0u
	 YTXqbQ474jb9HIXjiCA7sAM0XyOzpn+yAMIkqWzlI0eQ4Oykl2hxfcwV7Do7+6QRap
	 tuCbS4B/lKy6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D68246090C;
	Fri,  6 Nov 2026 16:08:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2078A2E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10E1181331
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbscKDl1uSBr for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 26D7081215
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26D7081215
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51C769E0B0; Fri,  6 Nov 2026 16:06:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 15:30:58 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: a3e5e742025c537e1f7fef2a400a2b2eb9d0a688
X-Git-Newrev: 5fc943954b484f44056bb3a92227a670be68cbf9
X-Patchwork-Hint: ignore
Message-Id: <20261106160659.51C769E0B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/python-django:
 security bump to v6.0.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0536772614917007842=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0536772614917007842==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5fc943954b484f44056bb3a92227a670be68cbf9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

See the release notes:
https://docs.djangoproject.com/en/6.0/releases/6.0.7/
https://docs.djangoproject.com/en/6.0/releases/6.0.8/
https://docs.djangoproject.com/en/6.0/releases/6.0.9/

This fixes the following vulnerabilities:

6.0.7:
- CVE-2026-48588: Potential exposure of private data via cached
                  Set-Cookie response
- CVE-2026-53877: Heap buffer over-read in GDALRaster
- CVE-2026-53878: Header injection possibility since DomainNameValidator
                  accepted newlines in input

6.0.8:
- CVE-2026-15307: Server-side file-write and request forgery via spatial
                  lookups
- CVE-2026-15337: Potential denial-of-service vulnerability in
                  check_for_language()
- CVE-2026-15830: Potential denial-of-service vulnerability via nested
                  geometry collections
- CVE-2026-15920: Potential cross-site scripting via URLField values in
                  the admin

6.0.9:
- CVE-2026-77050: Potential denial-of-service vulnerability in
                  get_supported_language_variant()
- CVE-2026-84429: Potential denial-of-service vulnerability in HTTP header
                  parsing
- CVE-2026-87890: Potential request forgery via spatial lookup byte values
- CVE-2026-87975: Privilege abuse in model formsets with editable primary
                  keys

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(alternative to commit 3e1a371a47c5abbbdae8e633aac8130a37aa2688)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 993b7b0d68..509c8b3acd 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  b45e074d29f85e1417fb2d2ea97c2df3  django-6.0.6.tar.gz
-sha256  ad03916ba59523d781ae5c3f631960c23d69a9d9c43cecda52fc23b47e953713  django-6.0.6.tar.gz
+md5  9ad29872db08c9fcedd1a7d4cb2b11da  django-6.0.9.tar.gz
+sha256  8ce037c971f421cfb47d38c097ca233a8f6dd42d9e9501a37e02dd7d08c5cb3f  django-6.0.9.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  be30dc0e3f7010af6c453d205feaece1f89494789b6e92f0c255ef597a1e6864  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 764e72084c..ce4552a356 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 6.0.6
+PYTHON_DJANGO_VERSION = 6.0.9
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/source/d/django
 PYTHON_DJANGO_LICENSE = BSD-3-Clause, MIT (jquery, utils/archive.py), BSD-2-Clause (inlines.js), CC-BY-4.0 (admin svg files)

--===============0536772614917007842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0536772614917007842==--
