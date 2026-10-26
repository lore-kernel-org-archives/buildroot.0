Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996FE606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 06:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=f+gwZe/s
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BEEE80D97;
	Mon, 26 Oct 2026 06:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jcc0ZUdvfMzr; Mon, 26 Oct 2026 06:40:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8B44780D89
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792996859;
	b=UPdFKdgZBpz5zVcoT3759dt14rBEbZlxGdK6NxDXfWyRULZoh1SnlFpc0wlx5zZv1lfq
	 C3uL63YzWW1+G6Aid2FyE+YNB9rqKdAHtbNk157YhOZu7W05Clo5KKqBDk5dOnSbVXbYK
	 oxuZ2cfQZsioWGicaEmG0jNkn0fQInkcxquWE3e0ujRkLo+DyyWB0Sp/nxFppKUDK+BvP
	 JBegOaQA9CcVFFTbrYJ9D5vG94rAT7Q50KtkOqNUjoBruMUtUiPsDDxBlzbFPNuKUy+xn
	 6t3x9jKiZnkadQRQwaBNH6CtapSeW9xBWdN4iGT0G+7yMJCWi5/69pvhdDyZ7CIqPTg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792996859;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=yphfd6SX9VBMv0tY4RuKKP45s15LhlwgQnjD1PXzAwo=;
	b=ieZ2Eo+7x4ku8Yz1wcmD3G6Cf9qWN5/8SqwD2bqYJGW+oXu7KHR1tJH0rx3oTVOfhRz3
	 9QsZqnfn+MHpwHk9C64A/eNv6J0iJAEwopjKAiF6uJ8lLZ6oeAYBSFJqlhJUMhWDNH7G+
	 nSvaa2BsHFY52cef8zSIWU8kwogIeyTIfE4HFRxlr2BYc6A44Ru884NE3XD2gkvvvhYGb
	 It22gZyLENJ14MdnRgz9oEpHN7B0C42+DnPqXCvb/nGO1niqDs7ki+AxkpRHOmEJ8PIZC
	 2ZY2rWQi+Wu0wrgYdHgNnP/4KoNy76hvuyOBUpPocV1v2uMBt/IrtNsfwxhKte0wIZw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792996859;
	bh=yphfd6SX9VBMv0tY4RuKKP45s15LhlwgQnjD1PXzAwo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f+gwZe/s50W/tKTIhbtVFnzC67zwSrinJVeC6ES9kXGgnOWkIm5YfIKEr56p0kb3E
	 iD2iLNebWKIJ0f3kUT6G/cqfzPoXn228CZqz6iNyWlRgEvO5ihjZFWZer3jLbWGRN8
	 m0hJZS8X3NHbjZufhu/2SLAFHmkoyBJub8IhOT+BSWj0iIXhKhyc+zrznVDmXgWMEI
	 G+S+u7YVMNxq7mCCrm+k6rDq+KVULpq3OAtVQtWuZTpyijGwsfT+8kV9btvjPoAaJA
	 xqOz8eswR/eVIN0bItgkxXrelJmB6U+wiJuzWsqgIxgMWqtGV3Ujkdq3m5vYkolcKF
	 1N0SNu2qA4qIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B44780D89;
	Mon, 26 Oct 2026 06:40:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F4E0235
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 06:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81440405F6
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 06:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XW11m8bEo6mJ for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 06:40:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9B7BD405F3
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792996857;
 b=Vuman2T/plVQbNJ+hVYBR6/9T2Z7mJMVBJAbsk9aVO+tFqZm+YAfewMIw7m2AROspZcV
 /hScuO88GzCUH6PDiJsHWsu72A88uruaGSMeoMjkpcMhWqImsy9VpEK/KWHlSI7I3JVEG
 V0me1PHZ4jU9GH9dH2xJFEvQ21LrozwgLVNoOOowR11yLmC17eXPAsRtbRQCsLUiGe5gZ
 /eS9E8Nx8oXGsBIXjquNMWOzQ1AM7mOAKKG2SadkC9LT8Sk/xRHlrc35MmVZCA9LA291f
 c3+c60ADwX3Xtuhv/nI8nJtpR6XckHneUc+yBH7RhZvmUGGelIa0trSVvJABnn3TDcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792996857;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=P3+9WdnVP/moTi3jNd5biq2J4RWghJXd0mmERHnLa0g=;
 b=ct1hYg/YEF3k/LcX2vd5pTqjQqAKn/PftXdXALOmk1dTv78YC/XwjHvU29Jb05ChCLyn
 VXyo9aaYMbo6028XnJbtrwZ8vVtGQoI4fiJTo+DfN2rj/QCcHcsw+zvz4GcPEb8X+pktP
 eCUS6rXTdcAiPNm2ryK1I/2OhJGafwS1JXnJLcSOaHGheE+iin7a45XG2HYOt82uiYWu2
 eBRvptA+0Z3DXlOxArzpEXsReNTBaJXPxOVdtzYCrUxYfrhTsxNsAel7HswLZ9bdetnN9
 G06+46EdlpIwGYJMMat16gwzWPxb9+f5YaxVXrU/rD9pIS9/tWbIC5VLnachOv++FfA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B7BD405F3
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 06:40:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDC1B9CF45; Mon, 26 Oct 2026 06:39:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 07:39:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3cb3f451a5b6ddf6dfff9f83c7f65c738df6d90a
X-Git-Newrev: 3736eda341337a2ddd824111a5f065c84d44c584
X-Patchwork-Hint: ignore
Message-Id: <20261026063931.CDC1B9CF45@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: security bump version to
 3.14.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3736eda341337a2ddd824111a5f065c84d44c584
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.python.org/downloads/release/python-31410/

Security content in this release:

CVE-2026-115557:
Distrust compromised eMudhra intermediate CA keys

CVE-2026-114583:
Reject links replacing the destination in tarfile.tar_filter

gh-160300:
Reject cookies with a negative version in http.cookiejar

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 4 ++--
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 20abfb573f..7272555258 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-3149/
-sha256  e02d9ac21cebda6e46435369744a92c65cc7cd8669697694122cf97ffacd1e53  Python-3.14.9.tar.xz
+# From https://www.python.org/downloads/release/python-31410/
+sha256  de414a57119abef52784d8993e341d53aed635fc2b05c2607d9f98a2c5b72032  Python-3.14.10.tar.xz
 # Locally computed
 sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 1916982dfe..c24020af9b 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.14
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).9
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).10
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
