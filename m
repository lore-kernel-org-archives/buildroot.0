Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06FF606A325
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 14:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gf06v8SR
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEFE0405E2;
	Sun,  1 Nov 2026 14:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o-z0ZGR3gJnc; Sun,  1 Nov 2026 14:50:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A5A8E40620
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793544654;
	b=iy7+zdrhJmFErqZ7xA5cDXsd5bLmfdGLGQp4MPLqpm48f9jgafujIpwPOhNOJFZjsEf9
	 82pEYN9lnP3le1AxdaC3KIfqwrK87z4fGrN+6ECrPzeDTNhDMj2G1DFx6p/nCEFx79Cp3
	 44RzxPOWI4VcINq0j8tTWJtWfMyBW9Mi/BUzcWSwQYnZiq6eFe3hZKUZL17aG9SZ+wcZm
	 0M3og/tAdkerC1afuzJ80aFGDpDSYeg7OhAs6HoTJGFGHowSzQCBnL9nSeE45n5V3+DoB
	 CzcSKuKlYIjooSvlOJ/Z0cUevGeEYNU131+vHyQRMbnaOyC2vuXvtZ6vMEiVTUSyfKw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793544654;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2S3GpDlKfin+w8EQqEvquFDaAcBewtNMbOas+P4tZR4=;
	b=BDYmTKoJ6s+aEtrA4WVNBjuxN9Bv1+qv4F4GHYZpuCeqVmiXJgOUn1f2MgT7q07oqSsr
	 OMptbtWatKr79AdfGpCqwAK2jLN1vitSldCO6M4J5Sp0E1F4ycEd0HvdaiN7obnmbvZ10
	 U3v/4ivfb5FM2iF6NwO1j4zsVXS7KZy1KKyJSoe/EpPe9cv3SCJ6iB/GlLmlkMR39ev5P
	 wIMFHSCgZjPCkxV8Qg/c17d4RZmxrQhHGCMSD03OuZeAkKerC9TpoMYSBzO+r1vZhbDQv
	 xK0DU0WhZpOz07SLeHJdAAK6MWBUU7gScaXQR3qG/eBg49ZLmaSbmNKcYmOYSpoIDCA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793544654;
	bh=2S3GpDlKfin+w8EQqEvquFDaAcBewtNMbOas+P4tZR4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gf06v8SRa6mNrbwkd61GdB6exX+dnAyIaUTSCIGjDEM+7gUBqC+HKogFl3Joxz/js
	 wjRgL+MHeUrG+JZWQLHC3+cnBjsM7q8xfgFXi6Ycu2INitoY8zUlFJzsPYV5+L30PP
	 JhmE45hcBmICaofRAeYc3Xwero4y07KVfbFHiS3pfgVBsHAnHKSqLR7dX+Fjsh8AKh
	 Fz0Lw9I7COarRyjcky0oXoh8ib01QT9FE0GJcu+o8nm8M3aWm6Wj/Q16ZxX7S358e8
	 P7bFs7Slu0rdNO94ej2SVWkosYHB9M4wvarKwrVFfgrKscAMTJopLDQ18tc+mu+mKY
	 m+lDj6RfVIRXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5A8E40620;
	Sun,  1 Nov 2026 14:50:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 575B34B7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 14:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49A5B80C6A
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 14:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jslmqg4Y_As1 for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 14:50:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 955AB80BF7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793544646;
 b=VcSnviYoB9+v4XyJQTPTUWhBiU8V26ZQlZafsCvMuCk5IjZiVZLF+I1djlZsu4zmIkut
 6XU8D9Tmg4e1S8Uc9eFkFR8p734wuGfbBWGta+KVOSFxhDlFbXC1HduLVCA/+QjRq7pEl
 XkqHlRI6gKkDmtOc/XoKb3eED+GbNlqH2dlLiQPthw/HoWv+dolw3TpDLLMEMPd1QdBaw
 q+zHpjoGFz9rpAzBe7qBHfEZo3vtw8eIprvu+LAPIX4Vqw503KWu/1NZNfdsELyccMqnz
 4QJXy+xs2Heyf5YU6Ekz5/Roq1Iy1gKkLPRtBAOOgu1gVULySPr+77HHbxphyE1RxRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793544646;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=s7lQcMiN88uE4COAtbyBrsELsaHKYPP+8IPavVBEMcE=;
 b=PRbO4WA65cfcsCQCuAT3PxfS2KJl0jQ05P76hUiZzgLNPfoWXm/h1xAbpGiBjCvvfp1O
 nbS90qVvY8y8xS6Vh711G267h8/e5uO7A0o/9F0jUGacMmKAM21Hd6VHT2+eV2SgS6MoZ
 vTY8v1SvoH0xFcicwytwWN+9kiexjYnvuwLOdTnHHk59DC/3JNFfijZivoHN6pWKncCQS
 HSVMM4QmR95XrpVDX4ydr0Lz4ZvEeyRBxBmoNi1l2GZtnviE1F02DmJNfKulvNkRlMmQN
 p9x6Da40xQ4wc6yaX9MFi+AWSAXphBqPP8/acmMj8HmRpjjrVAvGNSc5jM3B+PWiDMA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 955AB80BF7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 14:50:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5ADDC9D490; Sun,  1 Nov 2026 14:49:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 14:54:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f50c782dfdc69ed116e388cb49d6394e7a3828c
X-Git-Newrev: f8850254c60c8d3c9c696beb8fda8d599b8543c8
X-Patchwork-Hint: ignore
Message-Id: <20261101144917.5ADDC9D490@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic: security bump to
 version 2.14.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f8850254c60c8d3c9c696beb8fda8d599b8543c8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the pinned pydantic-core dependency to 2.50.2, which fixes
GHSA-qpmf-fgh3-ff25 and GHSA-3r8g-cqwr-jr29.

https://github.com/pydantic/pydantic/releases/tag/v2.14.2

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index 68ffab3df5..57f49bbe03 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  d1d82b6afbe5cbed83544dd99a104c02  pydantic-2.14.1.tar.gz
-sha256  94f478203dd03404682a1ada216965651dd74b1d2d5ffd62e00e0837caab5c26  pydantic-2.14.1.tar.gz
+md5  f088af0a539873a8dce16be5d13c4e10  pydantic-2.14.2.tar.gz
+sha256  fb7b2db6cefe8414dd612edeede49c4c433acb0432b0f92b95024e45f66c505d  pydantic-2.14.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index 0a48204cca..5a560b2afe 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.14.1
+PYTHON_PYDANTIC_VERSION = 2.14.2
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/7c/0b/8e10b2e693af8ec54346a14caf36221334775975a747c9ceaa3f8371d96d
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/9f/d5/b4867fa7c7f04c34997d7d8aad744f64d210bb99d67cf18bf3fb1eea1aed
 PYTHON_PYDANTIC_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
