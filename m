Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64AFEF99D4
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89B4541EB1;
	Fri, 13 Feb 2026 19:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k3iIMtA922we; Fri, 13 Feb 2026 19:39:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB04C42252
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011596;
	bh=0CsCaQDZiN4FF05yXlP+cKrrw2ZyfBKTJyClKfhi3wc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rxf5wtmaCXuzfRBV5tTBHwv+GE+FkqN9bHtjd2+DvkwEKP0Udt+r+aGVmW0W3k8PZ
	 Xrr0V2m/+1IRIZ726DawgPcZ/0Cs0ZR+yt4gNaauZGFOzOENSTTXDJtd31mUfmcRyb
	 QAlJhZI2xCQ771uwjGuzWjIP2537OdyP64qB4fBEju6GEE8SWNOOwO9fNPL/C6lEOJ
	 LOZ/9cl2Ei5oTEduYwKs+zIWHw/gJigZe44S/wLZz4bxJaRObI4l1ihYoqE7iWVFop
	 57kfNDKD/+xRyWWhZ4FNEC5mQwV6p8ne8Y3z2oKb04gzreCy8t6c4eWTMziJCQGd4B
	 9i2BboHjv6hNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB04C42252;
	Fri, 13 Feb 2026 19:39:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80F48EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D11A741280
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nfX2CXFE97No for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 113A5413F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 113A5413F7
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05F9585DA7; Fri, 13 Feb 2026 19:37:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:33:57 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 34b2c00d83b42fcdaca42ca2a94ce004b81ef061
X-Git-Newrev: c90ce3bff68927309cf1223551fa3b2dacf0d1b9
X-Patchwork-Hint: ignore
Message-Id: <20260213193706.05F9585DA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/blake3:
 explicitly disable threading & examples
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c90ce3bff68927309cf1223551fa3b2dacf0d1b9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Use of threading requires a C++20 compiler, and the oneTBB
implementation. oneTBB is missing from Buildroot, but a system
one may be used if found.

Even if the default for threading is disabled, explicitly state so,
in case the default changes in the future.

Also disable examples, we don't and won't need them.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 830726905accf698fb8621fa07d962a7ab97ce40)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/blake3/blake3.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/blake3/blake3.mk b/package/blake3/blake3.mk
index 9d1323192c..1055a2c073 100644
--- a/package/blake3/blake3.mk
+++ b/package/blake3/blake3.mk
@@ -10,6 +10,10 @@ BLAKE3_SUBDIR = c
 BLAKE3_LICENSE = Apache-2.0 or Apache-2.0 with exceptions or CC0-1.0
 BLAKE3_LICENSE_FILES = LICENSE_A2 LICENSE_A2LLVM LICENSE_CC0
 
+HOST_BLAKE3_CONF_OPTS = \
+	-DBLAKE3_USE_TBB=OFF \
+	-DBLAKE3_EXAMPLES=OFF
+
 # The package is a dependency to ccache so ccache cannot be a dependency
 HOST_BLAKE3_ADD_CCACHE_DEPENDENCY = NO
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
