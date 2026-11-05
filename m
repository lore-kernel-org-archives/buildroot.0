Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02F1606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lQeQJSFf
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BC71812CB;
	Fri,  6 Nov 2026 15:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q475TwiDuzox; Fri,  6 Nov 2026 15:59:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B16E7812C8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980752;
	b=p9p5uc5xfvi+27wBk9/2gsLCX9NPCc8uhfPiZ762A212feAMD8fkrVYgoZLmiYqgVPB2
	 phTPYr+H0IedROh3N58+4q9X4bwdRQcxBZpmcPpRXGL9ULFIhxVcuiv5O53efisMJvDf+
	 WhCLW4VLXAA1Mvk7W4UPjO2iYAOOrXYzI4eGkKfkPVGRj4gom0kWpYnf9eKgiJtF57vG+
	 SPFcr//dpVHlbDeHCg1yQsUMXcYiPcr9WaM4xekMLYO0s8suFXM3sq4v4I5yEIooH9l/Z
	 Oh1p+Ix/lFoKn4rCrSAp42TVUt1GyKDVWQ3Bhx4PyvNjAq90REagjCDBtbRbokM7VgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980752;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=o0BP8pN/vy/4fclfoidYJYBl53H7n6HXQpAJUf3OWYo=;
	b=bYa3+gDv3nHJeb73HzEdJRZlzxd82Rn66nAnqUfFHfx5inmfK6FkQnyvwOZnts+ZBrzG
	 LOtMtQqPrcgbP1kgDK8IeIODOWRCV8t/Y2qUdPEYB5eBzdZspA0B5phb3nY9azzGVUhBg
	 /+HVp9t+RuzibqLoixqNhKGbrFus+Y+wOPd07Cz3ZWzLyAdtTYBcH3oZMJqlbyrfNcArA
	 V2LiBeHiRciO1OB409e91ZcJVkok4aD3AsxYNnVZ0WgyFM3+w4fJDuLfMJCby1MHxMw4Z
	 E8Lkfl9bka374HSqdQJENF18fWePXagx290C+BotzAmEYxRh7fsH9st7kDPTNxcdlkA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980752;
	bh=o0BP8pN/vy/4fclfoidYJYBl53H7n6HXQpAJUf3OWYo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lQeQJSFf7Q4ttBrTGIhdcBYdG5TL5uXHJhHa359ft2qHx3ZafIDPpLv/v4Zq5DCok
	 eeu6igU0TzDXti1A1Z2fvJzDF6GoGaSBf/1fXh137FWQn+NEbCPqs/+/Q2stP49I48
	 U7zmD9sGNpqafZOmNltW36R7DfC2f2Who8d1Z44xPymFQtPE3WmcOAy0znXWe+VoJo
	 n+8DSHZlVvW4SFeQq8LIhv0BDFN0BhHm4+eja1I7NnYFJoeIJVwYu95TqeMnhUjCda
	 XhoGONRuORS/yVin0bRFOgGrrt5g6VJ49jGCybg2Ln5AVG0x59ckenN+kZPmEq/eF1
	 MMYtgDDDgX95A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B16E7812C8;
	Fri,  6 Nov 2026 15:59:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DEE934D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73E374091B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qv3GwQ1pCu_G for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 76DFA40913
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76DFA40913
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE9649E0A8; Fri,  6 Nov 2026 15:56:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 13:27:52 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f0f660e43b766676f09e815e311eb5d8e26825cb
X-Git-Newrev: 8c1e897d568391f8082354f47ddc78c430615a7e
X-Patchwork-Hint: ignore
Message-Id: <20261106155656.AE9649E0A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-django:
 security bump to v5.2.18
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
Content-Type: multipart/mixed; boundary="===============9151130530594803542=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============9151130530594803542==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8c1e897d568391f8082354f47ddc78c430615a7e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See the release notes:
- https://docs.djangoproject.com/en/5.2/releases/5.2.16/
- https://docs.djangoproject.com/en/5.2/releases/5.2.17/
- https://docs.djangoproject.com/en/5.2/releases/5.2.18/

This fixes the following vulnerabilities:
- CVE-2026-48588: Potential exposure of private data via cached Set-Cookie
                  response
- CVE-2026-53877: Heap buffer over-read in GDALRaster
- CVE-2026-53878: Header injection possibility since DomainNameValidator
                  accepted newlines in input
- CVE-2026-15307: Server-side file-write and request forgery via spatial
                  lookups
- CVE-2026-15337: Potential denial-of-service vulnerability in
                  check_for_language()
- CVE-2026-15830: Potential denial-of-service vulnerability via nested
                  geometry collections
- CVE-2026-15920: Potential cross-site scripting via URLField values in
                  the admin
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
index 8121d67796..9bb445877f 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  9db6f4aaaf130e3f53a4c5255c1b1bcd  django-5.2.15.tar.gz
-sha256  5154a9bf84ac01dde011e367f355c07dbb329532e06810dcf3ef2af269e236e7  django-5.2.15.tar.gz
+md5  37d9504be21272595b91c2aa3ef4904c  django-5.2.18.tar.gz
+sha256  461c5dd06d2ea16bd5ca37d3f46e4def1d6b0fe7588c6f4e2119517bb0af8b2d  django-5.2.18.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
 sha256  a6fa72074c31928128aaa18162204507938b7a9a8b819bd833fa82467441800d  django/contrib/gis/measure.py
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index cae4542099..a94853c518 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.2.15
+PYTHON_DJANGO_VERSION = 5.2.18
 PYTHON_DJANGO_SOURCE = django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
 PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/source/d/django

--===============9151130530594803542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9151130530594803542==--
