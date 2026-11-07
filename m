Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB22606A33C
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 10:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gMws2JCM
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFE8A40802;
	Sat,  7 Nov 2026 10:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zIn07hhBhubK; Sat,  7 Nov 2026 10:30:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D79B6407BA
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794047408;
	b=pbsxLwQPCiM3SZZEyRuPN97NCP/1vbv3X4WlBKkkWq0sCfwa+ZY6ZWsDuQrh5Lu9lc7E
	 6/rw1KoR5pz+jlCQzC7d0gxcYdAQVPEqrAWnD5mWwJhkvj8XQgNlbu5OmF318CLFMysoH
	 pmxpzduEbSvlABvSi65VLbKCrRlFhriBBTNuCYdIjYicNhVdZpg74vUPZML0iPaBOg7N+
	 JrB7lDhEqvz3deL5N0Kye+CTXFbMJ4f5nRiIeApxqq6/us8+H4m7xqiXS1ias1K0NvFPI
	 3VbRcXnblobMLRYOrS+xJD04rGHYfaURSii+1I/dVvbW7x5wUWhurfEdIOfteNds7Qw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794047408;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=84odQam8ATGfEFzfr703gPRPBOo6S9CEmB6oFQB1nWM=;
	b=enX0qOi5cxQQCvizCKXQNOT9lOjJml5wBScwWM8mxOIZ4L9h6TnP5qQiSDeew6FJ3EOp
	 LQiyufDPjjH7RWA9MaMXi7veq/0mWDPq88omHjEaRItwNnY9owhd8OK8JjnJYPIKXefYA
	 SoK59IYjgjgaU06wnYkXKQ2dq0zclAtlOgeqdoX+m9GwC4zXKnxAITDfgMc3n258o4XVL
	 Y3VKCw8lfvrBBG1IDk8U/iDOs6pLDvv/wap7gD6Q542/8YoRoe8yISv7Rgr9FZxDhEm/V
	 r7Ad6icDLgzrGMLQtM7eyQQGvIGKdZsHFyWNaHiSoH4XN85cq9+qrV/VaIxBFY+dkWA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794047407;
	bh=84odQam8ATGfEFzfr703gPRPBOo6S9CEmB6oFQB1nWM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gMws2JCMvYRkxDf7l2KhKBwsWJNS+asHFsWOYYbxEkpF4xcZU0/JyG+kEhcktqhtK
	 /bi9IQFGCAKgkC6j5rdlncDllT4cD+tp2dVWCGe5lG7n7U65bZNAM/FqBi/Y5tdbFv
	 rBNsj0lqndkUYQIHFL4EaL8aJs1uxq3p6x40eDY+9pn9kAoAaoAE+/iFakiZ3Jb4jj
	 ruW/3t8cqTYdTZsnegKvCJS2U0g3OFRqFnniMoKss0VRN/x1iukQ8fUFwTiftkCWgS
	 ujomOMwZmo+iydE+FxsNPHxJ21WWWzrZNzMMLJSKkrmNex3WBFGo96wVbePW4N/1cm
	 17Alpd33b8U/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D79B6407BA;
	Sat,  7 Nov 2026 10:30:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C09137D
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 969E6606EA
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jGaG0v1cH1B for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 10:29:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8C6E6606BA
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C6E6606BA
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:29:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50A188B56C; Sat,  7 Nov 2026 10:28:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Nov 2026 11:14:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc44998e6c3e8d49ab2bf0e045ec2b298d89b59b
X-Git-Newrev: bd7cf9c5e4650b4199d81bbd1093072aff0d8491
X-Patchwork-Hint: ignore
Message-Id: <20261107102827.50A188B56C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-uv-build: bump to version
 0.13.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bd7cf9c5e4650b4199d81bbd1093072aff0d8491
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-uv-build/python-uv-build.hash | 2 +-
 package/python-uv-build/python-uv-build.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-uv-build/python-uv-build.hash b/package/python-uv-build/python-uv-build.hash
index bd0644a72e..23c6ecffa1 100644
--- a/package/python-uv-build/python-uv-build.hash
+++ b/package/python-uv-build/python-uv-build.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  6b2b5c814e6ecf61a0f3743362d3399fd7578324a1b59b12e242cb6051881dc0  python-uv-build-0.12.23-cargo6.tar.gz
+sha256  42e458d1fb83431e69481a91878e6782c20619ec9d670b1879521725b393b5c7  python-uv-build-0.13.7-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  860e3d7a86b84e6a7012c7a635fc64df475cebc6cce34dfeb73a5982ec58176c  LICENSE-MIT
diff --git a/package/python-uv-build/python-uv-build.mk b/package/python-uv-build/python-uv-build.mk
index 1a4cf5a4c5..ddbfdcf982 100644
--- a/package/python-uv-build/python-uv-build.mk
+++ b/package/python-uv-build/python-uv-build.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UV_BUILD_VERSION = 0.12.23
+PYTHON_UV_BUILD_VERSION = 0.13.7
 PYTHON_UV_BUILD_SOURCE_PYPI = uv_build-$(PYTHON_UV_BUILD_VERSION).tar.gz
-PYTHON_UV_BUILD_SITE_PYPI = https://files.pythonhosted.org/packages/b4/65/672d5c1e7fff2a602b51758cd96c379ea80c0c20d9d10aae5139bfde9877
+PYTHON_UV_BUILD_SITE_PYPI = https://files.pythonhosted.org/packages/73/a5/916905235227c4f074ec0b125a3f2a5ba1839892e64c9be20200c48bdb5c
 PYTHON_UV_BUILD_SITE = $(PYTHON_UV_BUILD_SITE_PYPI)/$(PYTHON_UV_BUILD_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_UV_BUILD_SETUP_TYPE = maturin
 PYTHON_UV_BUILD_LICENSE = MIT or Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
