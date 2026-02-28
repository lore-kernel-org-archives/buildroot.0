Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446BFEEF319
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 08:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B25C80DFB;
	Thu,  5 Mar 2026 08:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2cQorsKYxJsP; Thu,  5 Mar 2026 08:02:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2462B80DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772697750;
	bh=ZKl8ZcZk1p9oT51mxz7g1hFJGGNBmiNyHYp04CH/nOY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=p08TAt0Iruh17xIKhrkKPEKbqb8f6Jf1BM8hsgCElgg7iQZJR2jmZnktAmwHcKBMF
	 Q2rNX0EMREi48fekUtwuyrjAt/s5oY5Ync9OtDuI6hdpVT0RlNTV8xn1uzncXnTn7D
	 479ytWQHK8FauTNjBs+rxKBTnK30e1Q5g8LMo9Vw04GEz8N3Of5OIsNFafUJHrz7Or
	 sh1tjGWoO0PoDau/dBGdQ05z9fNYZEiVbgVenrD/ylQ6gkQXSxcdLnaOoXIOSEA+fK
	 TDu6QD/xPfeVxOXfuiVhBZokEwwpcKdnXvhMVzhAn3ofsZ90B6KBElpJ8vRtIu736r
	 9f9mc5nWXoHvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2462B80DE5;
	Thu,  5 Mar 2026 08:02:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E6A725B
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 473E44064D
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_-eV5DDOHLS for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62553405B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62553405B9
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E7E185EEB; Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 15:24:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7db1db0816d1e668b2802e9d1279915ef8b6634
X-Git-Newrev: a26c13c8e15efdd3f2548d261e5df29f9ff5ecba
X-Patchwork-Hint: ignore
Message-Id: <20260305080208.6E7E185EEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/piglit: bump version to git
 3051e13ae1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a26c13c8e15efdd3f2548d261e5df29f9ff5ecba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/piglit/piglit.hash | 2 +-
 package/piglit/piglit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
index a778401253..8158177e4f 100644
--- a/package/piglit/piglit.hash
+++ b/package/piglit/piglit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  0553524e1bfce646771560805cbe523204c59dcee20dc58bb9baa87134a50ea1  piglit-62d499d63d2b8b29a67efd9d93ed9b6a94d4950e-git4.tar.gz
+sha256  060d45db7304446ef280afd60fad3a728bcd9fdfe4c204b8a236e6a4a46ce592  piglit-3051e13ae12e1c927c7baace3138a8bebec7018a-git4.tar.gz
 sha256  dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
diff --git a/package/piglit/piglit.mk b/package/piglit/piglit.mk
index 619f29204f..e61c3c9e61 100644
--- a/package/piglit/piglit.mk
+++ b/package/piglit/piglit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIGLIT_VERSION = 62d499d63d2b8b29a67efd9d93ed9b6a94d4950e
+PIGLIT_VERSION = 3051e13ae12e1c927c7baace3138a8bebec7018a
 PIGLIT_SITE = https://gitlab.freedesktop.org/mesa/piglit.git
 PIGLIT_SITE_METHOD = git
 PIGLIT_LICENSE = MIT (code), \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
