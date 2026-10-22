Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7C2606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 12:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BsbZkZUb
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A11F94099D;
	Thu, 22 Oct 2026 12:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dbEAej8TQyuw; Thu, 22 Oct 2026 12:10:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A6E194099E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792671037;
	b=YNKGH9brCEQ//1kuU4V8ylYGM93GJ09NKIu1186QCZhoUBhMoyo+rmtdHLFzh0yxj0v/
	 gIy4geoW7LgaFO+5Zarck+u30dJYdhhXRld4bSLeEdxgUkkI0MzISQRtxtCa9crn/+NWz
	 d+uO9YbawSlpH65Q+6HaaV3HAVzzEOmskTyvRcgEMPUSvlwe+IP4MIxS1IQ+yxmqWofjK
	 mM3D7qR9x6LKzROHVUutv7prBN3AjoXDXgEoTeV1ugcaFtxmT8ZnzLxvM7USrixPiIaER
	 2ka4vJIav696hWcBwIuiycL4qp7HOaqY+KLwW6tFE/W5DtAPsthE2kOl+XyJmt0mt8Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792671037;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KvUwrs/REq96Bv8n12ZHoOhK5WRYX9kOeOF3ldo1hTo=;
	b=ms0O4q3r7HXeTkAl78A0gSlV1lshLLsDK9beoHIJcwG/p1LWqrODlSH4sEICfVSuSwFD
	 fRLTNxcRnn7p6ixFIqqFClHGTzentTzCDNdtxB9GEtzHhxU3XHXr6U8YY+xZEt/GyM/Ux
	 zBAQPJh7BIRscc9naVnMIZpPSIqZF2H+Ai0gi4Sco0DZOkjNA462tuFiC605hyZwUclBx
	 6OoTwVY7lPif9ltW4xhu7K3yO+Gsp/iwYK8e9nTCfopQYxmsoEp001S6dEd2MvuXKIUt8
	 E6lI/XTWxLEUTI1Vo/c4X1oA36OTHAprWRn1fPisyPLcM/QEP0xkMWI8WQ+9LluD5GQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792671037;
	bh=KvUwrs/REq96Bv8n12ZHoOhK5WRYX9kOeOF3ldo1hTo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BsbZkZUbfEfVlzFjGs4t9GThYT1YIrV3c2YqSOyRbr+XgcKLbTT+dNjWcv+zwXCzK
	 uUuj+FjYqwfYrD7RuFuQuPUwan1J+3y3nY049/7AW6erTNYwPaA8wctGW7nZwRO6RS
	 p5/9WC6iDj96ddqbzYiF3B1+Otvxx0rzb6mrUwEDOd09VYL8TU1Hfb+gHQQWW3QD/e
	 jjzu3BCyacGPFtvAro0qON/+eXHt/7Z7vpfbvck0GuyGwCHehB1AUtobw2Efj5sJi+
	 0N8IwMBw2EBM0PuUvC0PTpy8xr81w8qKkkSgz9ptqoj5mCe22sqSzYdTlwZM17YOdB
	 FIx65jTc4s9ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6E194099E;
	Thu, 22 Oct 2026 12:10:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C80F723A
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 12:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9B6360896
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 12:10:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrgUlhQ8fOUx for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 12:10:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8FC5F607D1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792671035;
 b=s84a4vKYAFO5EpKvmfuR6owp18ZgXVFSFR8kEPdeC0MktdaPvb5I1LpccUwFGXYtVllV
 k8bgFHmv1EXhS6VOO4GMmVwuGOJGJ0CEZFAVd7qt/QYY/Mj7vZkLfasVqPFTWT49sw660
 92yWao17D4RZCdr+uxgU3agHwWECP5OGCmt86GpgayU5QuiUSz3r3BkxTR0jvrQSEsMfy
 +FFd/tGf1rpzZ/UQhFaB06YmBeX2nI/3UfZ4LsrD7uT4m2w3a7VQ2UiNzSlmVutwMCyBf
 tBk0rH+2TdVpX1358EjuX6+Ek9d2CLxKphMNqvYlk1VUVKsvIynvLDrCWWGlF/BgzyQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792671035;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XjQdriGe34767RYV9tJdLOIqsXYkYjm2z87qxEJ/HKU=;
 b=UOHq3osT1++L8uF+Qla4qgBOKkDaOBZO1BqrF+iW3GDdqo1dbyvlSJLW6GS8uLTkKIZG
 B3Awh5j20h0Kfq3MZdXD4nijUBgEnI4UGpZ8Asdsb0t20fjKcDK9FZ14XBaD8GJ7Zw2Hk
 W2ecfqoV5KK+dZPITkuB1at2HwkIhiAsKXCgIXMo6eecB0NvL1t8iA5l5lSRsNp9rapUa
 P0pBMdehpXQ9lCrPhcU+yV8UX/gxfliLgM2kmgdFpHHeZNGTVXKfI55hTGeZzBz9MXRHf
 K1dmr2sC7AZSnuD0cgtPCPlmhx8LvKQhNyJMSxbJK8Ipsfsw91XHrUjgvJ0EWAiyucQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FC5F607D1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 12:10:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BEC99B9D2; Thu, 22 Oct 2026 12:09:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 14:04:21 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 71b287c0298af6e59f2ee99ea0798df9c23b4313
X-Git-Newrev: e232fdf3969aa548b4833fd9d619ccb2d8dd2834
X-Patchwork-Hint: ignore
Message-Id: <20261022120911.8BEC99B9D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/ca-certificates:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e232fdf3969aa548b4833fd9d619ccb2d8dd2834
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
index 0f88df3eec..64dbf29dae 100644
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
 HOST_CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
 CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
