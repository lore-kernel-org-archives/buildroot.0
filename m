Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B290606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=R5ihTFI2
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2363B60749;
	Sun,  1 Nov 2026 17:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6wCiUCIbxNb3; Sun,  1 Nov 2026 17:08:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0F98360705
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552883;
	b=NeKiFAMdLip7FM3Pj/Qs1uVQlnRGXPDfIGCDTGS8fyw6qTsu1JDfeBBqhcTHx0M70cb8
	 OdHDgyiBjofl2OR4NAwEUlgeqWBp9Mi/byvEhk7GtzegAtw5dYHwWtmL3Qr01WMsrVznN
	 hFVb5FY+0Yp3GdRbDobud5vWX5v0/amLJ5WvSjSx6U+JYU99Dy4NIEZMzMBXFUB7gZKWi
	 o39iXvbWPdbikHGDsHbnWHLbRI1uHsKDfx5yOKLxbO93J6AbeaBgEE5ScivdPpmNptX9I
	 /NpAbMOxQKHAePv5sVbpzF2AA9r6uwsdNH965neln6BMOdFGO7wYagnJCh1NYqS6Hqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552883;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qbQJmdN9P7n1ySo4tRZ5nZA50A45ihXCcLlkj9S1aPk=;
	b=nYF1w4Du1uLN+L8VewBZKGsCIDSt26o/zTR38BCOkZQtUGRx24uuzgFIGe9n2veTisE5
	 69uR47r39p2SdBzPyEdhLFAHQI+XRUPqnKQt9JJ618NIEF42/WVzs4AtA36yEVZC2ZI+Y
	 RZjvy8RE1ovCVHPI4rqvidLI+Sgzex4Qf69CKPYS8fgDBWJYE8Ulye0wQF0lk2xnxqjj/
	 VpCfMjDWiJp8VOl4eDS5n6YTWpj6yzsd53MKDa7mfeVPT0xAKAIv2HU2DenXoktSrR/HJ
	 ew9vceBl+N/l6fWKEeoNyz/cisAbHaGrstEEm9VFlQixRCagSbS5jqoVfUJq/AzOOFg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552883;
	bh=qbQJmdN9P7n1ySo4tRZ5nZA50A45ihXCcLlkj9S1aPk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R5ihTFI2WuCEWcjmBS1f4Y5KUiO0fWtnLOz9k/OWU2/8n66Y3rrdt+J1Qx4vNxr/F
	 yGBk5qHvxLgodPWYmxJPTdUVs3BUZvX83wAjnXifGLqm+1t5P9k49vh1SJWan8FVxE
	 iAHKSsolSbf8oc+9qYCGqLP9gO4tM0EMnY7M5XEhkNLJfa2KBMi5DM/Uo2B8CpK0ba
	 tZd85NvtRWRK6d0JaZoKe2LcgeUNToy1iZyjv+J8ViXFrpn6accNjkbZcqQ9hZtTUt
	 QzABth1qtrpmXme7QnWvyBvMeQk39wicY5i1ouVDuGOSQxBW0wSmGkE6fA8G4JC6iB
	 Uc9Hn2j/tAQ1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F98360705;
	Sun,  1 Nov 2026 17:08:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A2AA2AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FA4780D1E
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJypoShcurIp for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7F52280DB8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552839;
 b=UXDN9r4C1M6rGQSJkNIM0fTfz86qUxMR8xB8+CWBEQeFtLKQ7pHbO5aHooEc2u3SxJH6
 gQNLG6Q22qEQ+W53+5506wCnEdWn4GlF7QgYaPrX63FPPQkoVg02JIBb8tpFVfCo+M9W/
 hh/8WfqHDy+u+aGHxhGXH/TkiUflfpPJxSMWnhidz9lXewjPph9MiQCM5NE/KimIkI++O
 ugO/71L9XHIlz4/Q4IwcRsA3oYbpAT5NMfTVQbTVAt1cI2PiaUF2iLo66pfqvoLOrFr6j
 dPRYZMLFAT0Ne5E50d4zz3VsYsSmCAK9V7SNoVxcWPqEkwHUPj98topiLl6QmKcZaaw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552839;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ug3ZHHK3OKQprZJ3W50IPv31oS+i4SrIz4eer4g+PQc=;
 b=fD+dRZexti85PamRsn347f7DqTxNzGkT+Gw+q8rEONjcBOxL1Q94i5+gv5+BOmi6kXlD
 eZCzgr+pyTZt8cMC3wreMbMU8Yt/9TljL9uCQXr68IVsdcCLDwnMzQeu8ZLqoqdsEsmck
 7M4eWTwbNVBd2dAy5oRz+CEnz3ecf+hbiN7xqygog94Tddu7a0i0/U9hDefsd2nUDuwbQ
 +RfI+3ZPupkGOM+B/sXzAvZxaM/+gu8l8DsmPd9QYk4DnIzB0qcnagdJEGd4TbHzhDcTy
 dYc8EfB/ET2KGibz3CTJa2rDlEvtXAqlNaWvKhUPw8O6ZZuhtqM3RqUrirTmsewxIJQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F52280DB8
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D22B9D3FD; Sun,  1 Nov 2026 17:05:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27d507121ee4b1e6a9ba490b2c907e30742ddbc4
X-Git-Newrev: 20e04161a3d5255a349d964b2eef98df3454c7e9
X-Patchwork-Hint: ignore
Message-Id: <20261101170550.4D22B9D3FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-grpcio-reflection: bump to
 version 1.85.1
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/20e04161a3d5255a349d964b2eef98df3454c7e9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-grpcio-reflection/python-grpcio-reflection.hash | 4 ++--
 package/python-grpcio-reflection/python-grpcio-reflection.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.hash b/package/python-grpcio-reflection/python-grpcio-reflection.hash
index 42540564d2..1f5b56f58b 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.hash
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio-reflection/json
-md5  fcc7b785c8283697cba440e9c32e6260  grpcio_reflection-1.84.1.tar.gz
-sha256  09d72642fbabaf45f8fb9c86b0d3cf45945fb7c7c1c4a2dd3321dfdb05cbe2f8  grpcio_reflection-1.84.1.tar.gz
+md5  732c4dde3cbd777dc44d0fcdfa20acc7  grpcio_reflection-1.85.1.tar.gz
+sha256  a3257f35cc817e372cfe330ba3411fc0c61f23b09a94dd2d8f91185955c5533c  grpcio_reflection-1.85.1.tar.gz
 # Locally computed sha256 checksums
 sha256  58c86a3f2b5cca0ebdf9ed3e7f4e6dc38e3b38796d8c3dc92064c62a4e39d0dd  LICENSE
diff --git a/package/python-grpcio-reflection/python-grpcio-reflection.mk b/package/python-grpcio-reflection/python-grpcio-reflection.mk
index 1b5f909727..f21b8d5e91 100644
--- a/package/python-grpcio-reflection/python-grpcio-reflection.mk
+++ b/package/python-grpcio-reflection/python-grpcio-reflection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_REFLECTION_VERSION = 1.84.1
+PYTHON_GRPCIO_REFLECTION_VERSION = 1.85.1
 PYTHON_GRPCIO_REFLECTION_SOURCE = grpcio_reflection-$(PYTHON_GRPCIO_REFLECTION_VERSION).tar.gz
-PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/d8/16/dc6673110945d3d2a17d862516b67e0237dabdbaaa6ea1c8ccd76fb704b1
+PYTHON_GRPCIO_REFLECTION_SITE = https://files.pythonhosted.org/packages/3d/57/6dd3f295af8c5b0516ae58b252fad8f07eb18c13b6e81db04b3537740574
 PYTHON_GRPCIO_REFLECTION_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_REFLECTION_LICENSE = Apache-2.0
 PYTHON_GRPCIO_REFLECTION_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
