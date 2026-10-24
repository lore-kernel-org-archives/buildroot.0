Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54CD606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=m2216GY2
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E09860A92;
	Sat, 24 Oct 2026 11:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7qhZU0C9QZDH; Sat, 24 Oct 2026 11:53:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6729060A95
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792842837;
	b=WUuDJ7ykoRyu9q3gQCtNEWM/6rKqNe15pQuCx1VVCCNH+qRm7jKWhttjtOvZiqSSr35g
	 Gr4lDvKHNw/Xcpm6V61InGS1VXCdqQjf6MaM5l5SIIjZOtEBUqAKOeY9+10084BSZNFDk
	 V+kbqdZPJL3VcR7cLEZET9HenyW0c9WTHkTF5+GovNJqJa0D0ZZMHiAjGkCZucJCd+W12
	 mk8mIdbiJSuFkALrFtLTjkIdog8AgQsxKFSdXSCd//7mjac3x/4/6x1odgABvK2ObseiA
	 2lj365RhedtDkJg0RIubiRCtd4JC/4GLpOgJQByX9JEhaGcOJJ0GI0SL6yktuLKFIfw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792842837;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KmUvRXD1KR10JM4D3jjdkybWY8XjJ0aa4N9+zcBU7kE=;
	b=Eqf/+SIpJQNW90++2q9BMxM3YBSdMKsGCNefejLAuGid4YwPr76tDPyyLSS+U8vas8dl
	 dJbRrK6LHzN5T1vB+Zff4GOrU5dMk4TRa32bnbuxESKAsf2ts5f8cNBhE1ONKStU2omWo
	 UCnRoiB13rtgf6xUIia8yPluT4L5oxwhnGpOENCfHk6IjvRsLW2SiEPF0H7dG4zThavNK
	 /Rkia+99zEXU7zDiZdz23jCa7ApK0N8PPAjCf6Jq2ERVXG/3/OD6UpkiEj9dNvYntXxSV
	 r5/kcMDB9rzCK+wKmw2gK4gXG4I0gPB8HMzc+9lk4h2gw+m8RVOc/mKWSuWDP71fU5g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792842837;
	bh=KmUvRXD1KR10JM4D3jjdkybWY8XjJ0aa4N9+zcBU7kE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m2216GY25cu+j2cqzcU1gxSmgsPuGEk/3WD5oMm4klS1ZPwEeIGK2+vBAtCscI3pO
	 i9Z0/ec2oLuHa+y7h/ifKNrMcivVS5CBCnUjA4nojLkSLlhM3oYGO3U3iwQWYCpZV1
	 VSspe6G5wI8T8AL6Z4f4ctxN+JomvpXNr+6WB8soMZpp8exUJ3XMlVoaRkXUhU3RJk
	 CA3Woe1ZlQnJyudBX3+ec+SabjqVNr9qFF7Jq8J2BJkaPPjDV8eqPpBK8LT8m9oKhR
	 DqCOAyheRcEtgg9QghwU36MmvGGWMsu2o41avjkatKdxkzz1RzlFvfkjovv1HqISvc
	 t2pGjVHuH8dOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6729060A95;
	Sat, 24 Oct 2026 11:53:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D93D14D1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA72440182
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQGO62dWhz1H for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:53:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A920440068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792842831;
 b=H6uQXRFD141fcVB70zRcGAgvWI7FCrphhXNa522xkXO7WrFT8yiduCrS3MYR/dpmi7gx
 RCpCGDWwUy2a4R8/jExHnJOPr4FhASaztg4RKBSZWUDv/5s58Bs2pUTihq0oZy8w433We
 FPdj0397VhZgLCGrq0nGKam5uJcCrdONUY7jeeV24V8GKly3r9XIjqMUj9DWTjofjuSuO
 HdzISo92OjAEcuws3IZfx5iqjQpIU1QJEqZEm34YZtqVtcko25JfZugCSE2WoavkmkKRW
 jcgTLQErQLmKltedeZ9fq1uAxxjR4Re5sMhlzuXuVwuAaBSLOjvykxOnSX2t/mTTNDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792842831;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=HqBHXqhHYVDQp8Q/HytETPN9crprCodbWW45SK8eW3g=;
 b=JqjiI3I303iQcDxeC6jBHHKDQpL5W/MjqFXJR4U3cilcxE6f30YUuNtWbA4orp5v9V8W
 WEVRSmmJoUxGvZCoG4xcAgVSrx4SbLMiyIah5OOxJhEvBC33uN0Y3rJXMkyuCR/Ho4C2N
 a9uJVK9zun3Nq7uUvEXhQompYKbM01J0pFxEZvx2qjg59Lfst/E54AYCNS3pZz/jY7fds
 PJez/l6jCphCkmVoHXDHDORG3vLqBOYIv+KWWQ/bSpdCHWdHI1BK5wbALCJUaDx14KRPL
 4zRS2/ev7GhCBTeOWlqC5BGzwwqMdpeW4O/xXtWsVAOy1oQXVRW16LKlkQSH9sTWK0Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A920440068
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 701AE9C7A4; Sat, 24 Oct 2026 11:52:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 12:50:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef46592ee7d343c306484743a6c307cac67c91fc
X-Git-Newrev: 21d33623d9a26ae31ed74e65807ac5ed23f289a9
X-Patchwork-Hint: ignore
Message-Id: <20261024115225.701AE9C7A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sentry-sdk: bump to version
 2.73.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/21d33623d9a26ae31ed74e65807ac5ed23f289a9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 196132f5f8..ee77b2d028 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  b4ab7ff3867322c4059ac4ede7afd5c0  sentry_sdk-2.72.0.tar.gz
-sha256  0d2ffbc28ee2e63cbaf3d015e93b448cffcc3ef3be03a44704ad36ade72faa95  sentry_sdk-2.72.0.tar.gz
+md5  b904b4e99adb7227d3b9026e71bba3cc  sentry_sdk-2.73.0.tar.gz
+sha256  4a2ab97b16e4693c325ab361c7bbbb346dbc7d0bc0150922d795a25bac8d5280  sentry_sdk-2.73.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2a140d660f462812fa290bc740d04633126c5ec45d84b79b569e127b0eeddd0b  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 44e102d9cd..e15f847060 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.72.0
+PYTHON_SENTRY_SDK_VERSION = 2.73.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/26/c1/d2bbb2b03bdc2ef14b35e02b647b8489156c50b6e0b8bacc5fa303902e23
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/c5/3b/1e47acf2456781c26e12007379ecc154bf310b8f64d40390d78b791d55c3
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
