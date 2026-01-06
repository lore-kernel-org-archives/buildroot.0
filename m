Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC5DD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 349B940A52;
	Wed,  7 Jan 2026 17:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5B-jdllvKxnI; Wed,  7 Jan 2026 17:47:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F9C0408AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808053;
	bh=oFns4s3pDHWRcrni+EpAAlqfY0xpxFJsvyZLsgKeJhE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JlftgdRBG4xHcomo/Ef/g/VSCDVSFYfj9JFMymuPllQGUCTnHwZgTKlSnFGhkpClq
	 bKe5kaIOnPIgqq7mK0YhhFXMEKxrFiTy8E7SGxnxyIof7V581hJ2EwFZw8KBaY7y/b
	 xET06w09TF+RWOA/e16twKZoFTeEKFy/Vp6LPy56wwA64x/lI1VRhGjFVGGy0Cq4+7
	 5GHikfKzC3Hw3aQQ2EL4gJb4OEBXLPgX39AgSSNC/Idpk45kgaQX7izGNGqjo+pjVQ
	 dRSexosvmfOmuQPZLDE4ENgyvVUeqU5YiYiMuqcLJ4RT52pzk0i0Ahmz3SUbwm684T
	 TTa5qDNWBRuHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F9C0408AA;
	Wed,  7 Jan 2026 17:47:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10DBAAEB
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A6EA408B5
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U2QcTLi71itY for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3E09408A3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3E09408A3
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A278B88367; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:19:40 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 288e04ed508a74c53465d1f9ee325e29bb2747fd
X-Git-Newrev: 23ccc3ab5ce38f95c16e4f59729e3da93ccc0a71
X-Patchwork-Hint: ignore
Message-Id: <20260107174644.A278B88367@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sdl: add CVE
 trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=23ccc3ab5ce38f95c16e4f59729e3da93ccc0a71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ee647574b7c8cc662937a312c6d20f555db777af)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch b/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
index 68e66bd5a2..3624c5341f 100644
--- a/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
+++ b/package/sdl/0002-SDL_x11yuv.c-fix-possible-use-after-free.patch
@@ -3,6 +3,7 @@ From: Ozkan Sezer <sezeroz@gmail.com>
 Date: Sat, 18 Jun 2022 14:55:00 +0300
 Subject: [PATCH] SDL_x11yuv.c: fix possible use-after-free
 
+CVE: CVE-2022-34568
 Fixes: https://github.com/libsdl-org/SDL-1.2/issues/863
 Upstream: d7e00208738a0bc6af302723fe64908ac35b777b
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
