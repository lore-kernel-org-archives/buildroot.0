Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE243FA3758
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 20:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAD8381238;
	Fri,  2 Jan 2026 20:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ktKdUkxZO9c7; Fri,  2 Jan 2026 20:51:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A69E080E08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767387107;
	bh=8rSzCGxj6yeUeFsYXD9bswnXWDP7bdrw48iKkdZj+pM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TvMNFNfSf+Z9LhLY6rQbh7FV0i9/YcuvaPsLF5HgpEHcJ3Bp2/CBgd1DPzWW/W4Nh
	 y/THAQvylnYnAhIFg7LrzZ44EPyj052BDiRGDXVN1wS1LYKfLXKN3bIBOwKv1MhMAP
	 1L2DEbsdr9U2Rn9P6aye4GJIQTw2j8rgtsOP67pLaQk2fMlV5EoYFLxVf1BlT+pMZg
	 4MUHlQ1V4wwOuMEBxMJnO8l8bFxOygjcBoWdFgLuDMLTVSYaPy4pdMLgHkd4PYuoNS
	 eDkEHlLdvmFlPh2oiJoxCkPM3n4iidokm3/BFeM6TdMMEtRJUqhED5+PZVe+cqFetW
	 aDx8fqbp/oN0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A69E080E08;
	Fri,  2 Jan 2026 20:51:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9794A19D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9410340083
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_NGGKaKcpjF for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 20:51:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5C1D40072
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5C1D40072
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:51:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0EC28809A; Fri,  2 Jan 2026 20:51:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 21:50:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2092fdc003f853266cf23ae62b1de5204b370223
X-Git-Newrev: 8ba59c12e9190772bfbf25374fe6a66611b43a79
X-Patchwork-Hint: ignore
Message-Id: <20260102205145.A0EC28809A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fio: fix build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8ba59c12e9190772bfbf25374fe6a66611b43a79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 215133c0fc2819f059fbb35071ab2e0987f5107d bumped fio from
3.38 to 3.41. Upstream commit
https://github.com/axboe/fio/commit/4175f4dbec5d1d9e5e0490026e98b1806188e098
was added to fio 3.40 including FALLOC_FL_ZERO_RANGE which causes build
errors.

Added upstream commit which not only fixes musl builds but also uclibc.

Fixes:
musl: https://autobuild.buildroot.net/results/8e9/8e946c7104be0295a9a2b946fe4a82bba0e28db8/
uclibc: https://autobuild.buildroot.net/results/ece/ece6ff1b20fa3482a88ffb3a6167b2bba9b06101/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fio/0001-fix-musl-builds.patch | 38 ++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/fio/0001-fix-musl-builds.patch b/package/fio/0001-fix-musl-builds.patch
new file mode 100644
index 0000000000..16c3d3836d
--- /dev/null
+++ b/package/fio/0001-fix-musl-builds.patch
@@ -0,0 +1,38 @@
+From ccce76d2850d6e52da3d7986c950af068fbfe0fd Mon Sep 17 00:00:00 2001
+From: Arthur Gautier <arthur.gautier@arista.com>
+Date: Sat, 13 Dec 2025 20:07:11 -0800
+Subject: [PATCH] fix musl builds
+
+This commit fixes the build on musl which fails with the following
+error:
+```
+oslib/linux-blkzoned.c: In function 'blkzoned_move_zone_wp':
+oslib/linux-blkzoned.c:389:37: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
+  389 |                 ret = fallocate(fd, FALLOC_FL_ZERO_RANGE, z->wp, length);
+      |                                     ^~~~~~~~~~~~~~~~~~~~
+oslib/linux-blkzoned.c:389:37: note: each undeclared identifier is reported only once for each function it appears in
+make: *** [Makefile:501: oslib/linux-blkzoned.o] Error 1
+make: *** Waiting for unfinished jobs....
+```
+
+Signed-off-by: Arthur Gautier <arthur.gautier@arista.com>
+
+Upstream: https://github.com/axboe/fio/commit/ccce76d2850d6e52da3d7986c950af068fbfe0fd
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ oslib/linux-blkzoned.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/oslib/linux-blkzoned.c b/oslib/linux-blkzoned.c
+index 78e25fca91..c45ef623de 100644
+--- a/oslib/linux-blkzoned.c
++++ b/oslib/linux-blkzoned.c
+@@ -25,6 +25,7 @@
+ #ifndef BLKFINISHZONE
+ #define BLKFINISHZONE _IOW(0x12, 136, struct blk_zone_range)
+ #endif
++#include <linux/falloc.h>
+ 
+ /*
+  * If the uapi headers installed on the system lacks zone capacity support,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
