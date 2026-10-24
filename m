Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67828606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 18:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qsHaP+Ih
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32C78407C3;
	Sat, 24 Oct 2026 18:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oh30lDDwux0I; Sat, 24 Oct 2026 18:10:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4644340787
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792865450;
	b=mRcLqmwmFY5iVxp6rCnwRE+c9Wz6QH7xZODyDFIRIJfcuBDgH1vafokjYL35FLKzAHRY
	 hPCQtqTd/CPr1vjIZRqp+cKxAjz3Siol+rfySnTprApiGYHE26DfdGPOCgJ6A9DcZEZUg
	 1lvwKF0s6SfTiaSa9RZaIVMpx2GFegd8kHXWX1G6D+lX7bMqPGeYakfd6eDW3jezcBE22
	 TDGNxrVh2vkUvdVrlIxydROFCJcTNHyc7nGJfBALHgzr9o+Xx24fPBZRMItVS6fGzNf5a
	 fWTe9pXFB37eCaIVKuRmCYhXonjC6PAvyizgT2ZIXwuMqGxNW2zGIIz2XtW34b3mlIQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792865450;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CgBNJ9bq2wmkhiyxHxWE+kZaCQH+SqEYzaE8CZuE//0=;
	b=EhZnI+SdXm6sQi1h1HWde3ktp8+PzQKzTem5ehQuzGb8kD+9vC09277zGrF5ubdjc2R0
	 gceK/RqRr9ePg3LOZR5laEoo8o/sfXXqGBNQm2L6rSY7/oZALSJnRUdgfrMPsYLHePhKk
	 IAFBu1rTtDTEALmLEeBGq8S0pn/40s2vnF1pajqR2ZqlcTP532Sl9QP0L2dwTtCDFn64c
	 L9YhoNRkK5LrurGZIpWwfIEZL1j4UOWjt2NHKVZnasZTY18VIGwQu3Sj8ulSnGG3Z5/bQ
	 GrRv/JAnXlyurVtdLe0oj8UAcojHTWFB147TEpvFpTRVMuPLuc58Kh82KbaAfVC5FSQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792865450;
	bh=CgBNJ9bq2wmkhiyxHxWE+kZaCQH+SqEYzaE8CZuE//0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qsHaP+Ihfx3eYHHLWZh08LVdkyN2vjnvMcJdAaJsaLsHPxXuJjuznslwD6cMbxSu6
	 QvVVCg+xjEzQZzjCoifedue6IuzBqUlyDgBG+Mbt2nE0i5CtjAk2BoyGbChFtvMd6z
	 EipENMbtXINc32O8Z+zJt98I4eCeawXJ1rswNu4CjdzPPBEOgtnng/nkUWNlxtkXab
	 BV0qLuUn6TCww/bx5RaHXu+8HXLurPo4p259e+Z3br/aadd6UUGEcdmMm4w6+eWAOs
	 vbVyaPvAhU4yYGpF8W+bskIPEc2uoLYsEYJ9BAht2KIHO6Gv8mAdGjt0Po3q8boZ7N
	 i3V7SK/ttgLWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4644340787;
	Sat, 24 Oct 2026 18:10:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E0D433D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C701B60640
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:10:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1moER3qzDEw for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 18:10:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C052760625
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792865447;
 b=kfquKLzw+SVIE18OmCv9qG4Bc4Wr+5DJTUfGqEgrgH+ZmOqqrDjq6U/3I6RoSq3ScLAO
 3keP+D6J2q9cw4EwlvbT+Q9UTB938hsbPwtiwGtv8yTgSDeu6N2AOQWRm9y2OcHxmlcyo
 Dmd45xgEWWcULgQEWDyAQrMA94SrYsYG3tYi2RvtUsHtsGbR60+Q2gnHrvD7wddy6mSZW
 rXndcyA3i44i7XyytSQBk8iD5IGLTH+Xu40tYylfp+MvaRxIvJILS2sO/8LLZNnn9NrXW
 VwfNyVgbpC5qkf+GHXRtYKmgB4rQ/SI/Hp9abxGBaV8ga8E8c3tId/FwoNOxCspV6Ag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792865447;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xpWksHAR+SUs8G8ouW3en/CqoMcbGbHet8ukm8i/xGg=;
 b=NuYzZOFAURQBza5s53EiLTr6w49uD/34uu4yfbyozLzCyWGT6clr1kXlvNs5hu6LIcvX
 rBo0dKDRbDBXlDQy65mcEjf0+JQtLK8g7A1J7NYYQ97YF2qAIx8f8MecxQZlNGdJaTQy3
 U9vb4QJX50Ya5RzMVNuvHIk5neoPFWCFwfNDAW7Jaj8lrbd3lqkjSnrR6dG52Uktf4qiK
 iiKyv21EUxaRUKReWXiBc65Bz2lVnH4CQnrdvXwPR63lFTJ3jk82uSFVqfKNe2SzGpxQG
 K1mVRNba2lPsB+wuIE79GVYpWmtJJoEOU1hwMuqcKXtRyAhkBuzu0EkNDQYaiorRuIQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C052760625
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:10:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B30119C8C3; Sat, 24 Oct 2026 18:09:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 19:55:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10b94e17f394a2d82c1748c1a6232a225970a1b5
X-Git-Newrev: d149c991835a090557c633e67c1b8d5cedb9c4c3
X-Patchwork-Hint: ignore
Message-Id: <20261024180922.B30119C8C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hpack: bump to version 4.2.0
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d149c991835a090557c633e67c1b8d5cedb9c4c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-hpack/python-hpack.hash | 4 ++--
 package/python-hpack/python-hpack.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hpack/python-hpack.hash b/package/python-hpack/python-hpack.hash
index aaaa3bcbbb..78e572a282 100644
--- a/package/python-hpack/python-hpack.hash
+++ b/package/python-hpack/python-hpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hpack/json
-md5  16e7423c5b5078c1997fa3eedd2e5935  hpack-4.1.0.tar.gz
-sha256  ec5eca154f7056aa06f196a557655c5b009b382873ac8d1e66e79e87535f1dca  hpack-4.1.0.tar.gz
+md5  b9e407d481be0790533689779b6b86ca  hpack-4.2.0.tar.gz
+sha256  0895cfa3b5531fc65fe439c05eb65144f123bf7a394fcaa56aa423548d8e45c0  hpack-4.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  763a9342a04df62046c9dc748a5287934eb0a5331c6863b3ca0aee20e18cb4ed  LICENSE
diff --git a/package/python-hpack/python-hpack.mk b/package/python-hpack/python-hpack.mk
index 2655a6b4ad..d49fe73d8b 100644
--- a/package/python-hpack/python-hpack.mk
+++ b/package/python-hpack/python-hpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HPACK_VERSION = 4.1.0
+PYTHON_HPACK_VERSION = 4.2.0
 PYTHON_HPACK_SOURCE = hpack-$(PYTHON_HPACK_VERSION).tar.gz
-PYTHON_HPACK_SITE = https://files.pythonhosted.org/packages/2c/48/71de9ed269fdae9c8057e5a4c0aa7402e8bb16f2c6e90b3aa53327b113f8
+PYTHON_HPACK_SITE = https://files.pythonhosted.org/packages/26/5b/fcabf6028144a8723726318b07a32c2f3314acdff6265743cf08a344b18e
 PYTHON_HPACK_SETUP_TYPE = setuptools
 PYTHON_HPACK_LICENSE = MIT
 PYTHON_HPACK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
