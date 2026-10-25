Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165EF606A31B
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 10:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LGjje89N
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2154405E2;
	Sun, 25 Oct 2026 10:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m1L1InyFvHmP; Sun, 25 Oct 2026 10:34:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F147C405E5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792924499;
	b=pKRSl8VuVZ0Cz4ux9WyFOqYga7CaVOb6l5oO29gPLes6D6McmLr7yCzKyFIn6C97bJ6x
	 SH+cmAs/32+UbbLUWSlQo3k7j2mG2eYf1K3Wv16P15PCQmb41ical8Q+wXG3beFBC6s9x
	 W3kr4DCVmvqoHIYNXfAO5Q8nOlCrLhWH2rBR2zkn0zQAS0AQalA8Grl3yD8rNRL5q7vga
	 10KTIr7HAflNMupYk5300LtuT7naO09iG+7fp2qQoYrYXvY9mncgvNUUHRi8wVrXKizDq
	 JI1ATn9OwgkWDNyB1QDfzDkFMgOPy+c0g4+J7YF99vu5Ct2g2PPQ2SxmzVCS7EkcYJw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792924499;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ILQKYb2V/Hp+eqWRd/uP0kYsaPPDoQiUwlRsKCA6ptQ=;
	b=qnf+gTiAH+ke8OOdDqJAgZRNPoq/ceoWJowWmv8qle5U76E15wAYbnFui846EzXIqqRj
	 +SE0DfqCMVPyTjGZvXkrM7W3nGafeGNjSZcryC5mPdX9ZLO150exapgemcY4jr/CSR2e2
	 SWzRkXlpKUpbvasG3z7sKZzyLSYhq3Tq1ZOn8x4N2ZNIzDp5JkoAt/AQ5A+pJUpLZqn3F
	 d0DX05qJ6QScH0gjFl26HJi+WPWfdMeBlBS4O1ikqhQ8NppnuJWQPuPUGFi2TG2+VLQ2M
	 PIWTk2iUgCAb7szI2BeppeKZbHA5kTycqAR9zTUzO/zE4YFEVUIoOP/h/9NYAhp00dg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792924499;
	bh=ILQKYb2V/Hp+eqWRd/uP0kYsaPPDoQiUwlRsKCA6ptQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LGjje89NdYsbH/agoCMCw0AD+fNLmv/z2qIuYOPcR/BKcX8Blg7G4nWuC7K3N0+oA
	 l3IMD92nsNpCTJ7zqSXto8mfZNkkoxK+8a2Se+CT4ejlwX17rJRONG5u1+QqAC4BDW
	 tvzrh5/VUngWEQJ83gQi67Tgu1RBPw4vSFytdzpS2gllpfIlM4r6vvpaV1mDlAyT88
	 yEpj8q2/COQ4BvczQ5FSNMM22h7/OP79r1o27yH7qI+PaGSQWi0EmHlci8eoFqfkMM
	 3JPaTgbVP5FtCRu5w0rGcc0JlHI/ysRKJ7vPMMbawkokw3VkKEi+2V5rO8JS45lp4M
	 cjv8PDJb1kcDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F147C405E5;
	Sun, 25 Oct 2026 10:34:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C39003AF
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A93E8816D3
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:34:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MhdydaImGL2b for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 10:34:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0A2A281693
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792924496;
 b=B63x0HRiI6xXSwJLGSlHG36XNqV5/JDFePdhLePg9R+WpZ0BPWcoa4TUni9UmyRrEE6v
 htCZSBuTCfYOGUt+ac8tqLHOSNl5RBb+KxL93vzG4FeobtAxUtULtbTUkpOflwuWaDXyo
 iyHSylM15FB4eB8C/GrBKnsxOXyuUUAFkA81MvKEgB/Cl/huGg3yYPIeOh2V53hoEIIEl
 iWMdZHs0b9o2NxvEzB9jK92+geOvFhcNQ0NSd5Yk1BgBSU8kzF1h3rjntMimxuteI3s2j
 7SXZ34fO+S9f+sHbmjTjyPAMfTk7lfyVvardAqp9kkOb/V9w/1vzWtf62VzI95hQcxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792924496;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=BfVNCdD+ICzhHQ7KrEh8tNaRJu4C+GYM0uPGhDf+s/4=;
 b=M1O7YcDnH1ekYaJMUQW3jDOe+VoPo9w4zfXKCwPo5l7y1yklc8dpPpVDoSE49G/YfD3m
 X7ryqJcb+sCaTWaIFsaW79tz9T+J0cUrGWzAgq5tQSb3X53iOah7nKaYEJRTjZlzPdl55
 iW01f6FHISo6L8a0G1t4jzl9q+aw/cSZwq1Cr/k++H3DA9TLlrXQf1kKhkTB2V9hzBJDo
 z0WOcWse/id1t9dw2goz2/mDvO+rXqayUhjwShNTjVqb77F+uACR3psFT8jnxQ418Ydqs
 PnKxfY9fyc/3JRiB1OTMyB0A5DV/Oo+BUIEt4fKif2RLqVEvq1x/Ege2ofJQ6jV3bgg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A2A281693
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:34:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 940019CE38; Sun, 25 Oct 2026 10:33:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 11:08:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 309c48bb224d8d403590fd1cc64c6ed927602872
X-Git-Newrev: 7f0381b3074862c1f287a4a4036b6bd154cd4869
X-Patchwork-Hint: ignore
Message-Id: <20261025103330.940019CE38@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/containerd: security bump version
 to 2.0.14
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7f0381b3074862c1f287a4a4036b6bd154cd4869
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/containerd/containerd/releases/tag/v2.0.14
Fixes GHSA-hc94-p972-ch66.

https://github.com/containerd/containerd/releases/tag/v2.0.13
Fixes CVE-2026-53493.

https://github.com/containerd/containerd/releases/tag/v2.0.12
Fixes CVE-2026-53495 & GHSA-rp3h-jf77-q9p4.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 410e5d61e1..97d2691c5a 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  eadaa5301c0f633f6fed6a3b22f5cf4343ac522401ad2e84bb3299f811a35976  containerd-2.0.11-go2.tar.gz
+sha256  a07e4bc9959ffdc409d2df22bd199be93fcb7a88f77b3c3dd1c07c199c01b42b  containerd-2.0.14-go2.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 4a3a371ee4..753011e125 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 2.0.11
+CONTAINERD_VERSION = 2.0.14
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
