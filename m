Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AA2606A31A
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 12:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=stddA5iQ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE24B4099D;
	Thu, 22 Oct 2026 12:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yUto5PfdAXQ5; Thu, 22 Oct 2026 12:12:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BA5314099E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792671123;
	b=Dkb/OeaBeUkZ9IcwamwhqbM6wezekGQcB5yy/TskzYV9ZzOfvxNEO/1w2VvPqSijsTSx
	 EeoLmrPjspWb3az79Vo82sD3BOz3U0r5JiJwXFmEuwt14YPVSHJxNou7qvF34v8fdjNuH
	 vlY3GpHP/bC4tAgJHt+C90/NZMZAzprzXOAy7riqD2ER2C9ACKEG/Z0mlVGuOfILMkjND
	 6rRVX2fSqpRMJrLv9eTGxkTByk13SnZnsGmjq9EYYq79v03IIc7SmDdHsopvRmNIEwy7h
	 0/GGuv7gJwWfTRYGLJvQxCvW2gLKAd9V+vpvalX+Ex7KqA9z+OtzCHe4GrXiyQrn5hQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792671123;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HpLITOqbrZHEzUxW7Rl3WCNl44rs4me1q16wdDFp/QM=;
	b=VQKi+byhhOh3iZ0so6VoghyxVMEZaVQggrpnGTXmrgUGzLhCSm6Ei+DBsZEtA0y7VyX2
	 yGzMwCqix7SnbioIt5mWwbLgyNKnkZjh/pDqWNq/N9+HEVbzeCzGM/gcm8wwYnmBaxrTG
	 /IjoFgfjPajzPhB8obTWXPQ+PqD2lMe1vRz98hQi0VcYAcs2dIUKEPXDjPdcyoPgWWkLT
	 fLtKehEmN0jq1KRr7Ox643O/WhlDuxFhSj7oMf8cBdlJi6/eOOYXBZcecFTXyYuHPqZDO
	 qrjFbf9ZIktjGm1Yxmb7mO4NHaUQOLvfVWBsvhfmK7qOeMc6u95r3GFEJbZfnHBMHZA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792671123;
	bh=HpLITOqbrZHEzUxW7Rl3WCNl44rs4me1q16wdDFp/QM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=stddA5iQJbdXhM/3vFYq9bxvWfsl5VP1912n2TAXF6TeBANjg+b/ozCmAcKPnu/Pc
	 cCTYAdgrEvgEOPngmiThGUyjrm0pA+26jhuRd7CYtINSpCS2xAAJs2X2MaUy7hmn16
	 DktJr0YVEfyzhWq4KkSxQUJ1S1TGD8R6xzTQno7+0y8zFWlUDUF5zf+N8dBdvwIs7g
	 GnD8e/ae9Mf2b9rgwXAJXURjbvXUeUyjob3/LVh31jWEQh0TD6Nb56HmOhsugM9xVM
	 LAYCdNmFbpnoweDrmesJ4e362LbiTfA8LgkWQyHKvcQM9c7Um94VdO8DBvS0w0Zwza
	 xSi0T8nnfTSgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA5314099E;
	Thu, 22 Oct 2026 12:12:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DFE213C1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 12:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1B8A4099E
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 12:12:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hRMmdKvkQTVI for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 12:12:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BC0F14099D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792671121;
 b=myYjS9XRcsOLQL8VSsWLuyP20RRl/MKIvyQWT5rc2iT9XVxD35XNYep2NMP7XzCv17pr
 3kyXti9IeiG6E93v6iz1iUE37lUBLH88dNdZb5ACBnsRoKYf7WSLwCDBaKy80uekkeDIm
 SdM9XqMSZ/BIlIK9PhXxpv/ekBZGhgL8Slc10PLpi8ZWLxUbQQVx3N1M61Sh9HPa5bV+e
 GqkP3bC0sNhCuYbNMdUyrtesSlx9YuC9EWA0nMj7cZ1iylzr96ZB5jc0S9iAKhvQqHCHP
 gcJoKyKpCE2zsYRbkDjIBLy0wRmAu+kOK6y+qUV35/r7qO80Sc/i7ljOc7yJSWy5ohA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792671121;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=sxxjBsrCMFTuH9nie6b59ntbmVGRHmXO7DN1QqpIGRo=;
 b=n0KSjVxfaFSIpzpOeDcnhQNhhtjy6RXR5OZceugnRVOAJkP9gooA3zGR4U2LmZDz8+Xf
 J9tQYcNtpUDd7U9TXLBlI57IzFkqCDOKyQFYo/2AqK+JDb9Q+gNaWNZ2qs3ooD2YS4sQE
 YSV+ka1Y6Oj/7GwV1Xxtrt2ofaFPwyT91+a9WK1bd4adeOA8Pr193D61K+Z/liDz+gB/l
 hrkSsEMW3CuhB4P8z3Mq/YKi2g/3XlntJh6YjucF6BtLUL636R1Md6MnvQj8TXCI6GdV2
 47QwXXf4joK4Aim4XlY8FdLYcLuN37fxFHY6NhDP7NSXKxjsvM7BBIgzsYaRrQ6m6Rw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC0F14099D
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 12:12:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6B039B9D5; Thu, 22 Oct 2026 12:10:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 14:04:18 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a50da0051a9ad4abc2b884cf3bfb01e1982ea11f
X-Git-Newrev: d5e0d4ad40a7fb9f8ffe20c32f43f514a956f33e
X-Patchwork-Hint: ignore
Message-Id: <20261022121037.C6B039B9D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ca-certificates:
 security bump to 20260816+nmu1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d5e0d4ad40a7fb9f8ffe20c32f43f514a956f33e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This invalidates the compromised eMudhra intermediates by blacklisting
the roots that signed them[1][2].

Changelog: https://salsa.debian.org/debian/ca-certificates/-/blob/5bee010adca85eb867534f6445735ad5cc0dc6f3/debian/changelog

Hash of the license file changed due to:

--- output/build/ca-certificates-20260223/debian/copyright	2026-02-23 16:32:21.000000000 +0100
+++ output/build/ca-certificates-20260816+nmu1/debian/copyright	2026-10-20 16:31:42.000000000 +0200
@@ -2,7 +2,6 @@
 Source: http://ftp.debian.org/debian/pool/main/c/ca-certificates/

 Files: debian/*
-       examples/*
        Makefile
        mozilla/*
        sbin/*

[1] https://emudhra.we-have-a-problem.com/
[2] https://groups.google.com/a/mozilla.org/g/dev-security-policy/c/0R3XLJL6FuE

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2efd7262dff4bc43d70d785d44eab12ca1603aed)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ca-certificates/ca-certificates.hash | 4 ++--
 package/ca-certificates/ca-certificates.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
index d234705082..6ec824836f 100644
--- a/package/ca-certificates/ca-certificates.hash
+++ b/package/ca-certificates/ca-certificates.hash
@@ -1,4 +1,4 @@
 # hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
-sha256  2fa2b00d4360f0d14ec51640ae8aea9e563956b95ea786e3c3c01c4eead42b56  ca-certificates_20260223.tar.xz
+sha256  914416a1e44a25733aff51092fe4e27fdec1c9f6e8d1db0b8364922486153134  ca-certificates_20260816+nmu1.tar.xz
 # Locally computed
-sha256  e85e1bcad3a915dc7e6f41412bc5bdeba275cadd817896ea0451f2140a93967c  debian/copyright
+sha256  1ae033c4679e4440848d2fcf6bc8e57d4da2644662775f401e2fede57862674c  debian/copyright
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index edc99dfbfe..ab09e64785 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CA_CERTIFICATES_VERSION = 20260223
+CA_CERTIFICATES_VERSION = 20260816+nmu1
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
-CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20260223T202245Z/pool/main/c/ca-certificates
+CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20261020T202723Z/pool/main/c/ca-certificates
 CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
 CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
