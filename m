Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9ABE9272A
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 14:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DB298183D;
	Mon, 29 Dec 2025 14:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5wlvm1qlJIH; Mon, 29 Dec 2025 14:07:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B0A68186B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767017276;
	bh=dSLvOeEGSwckyk29yO74f0O+uLiKJN0yx+V6G+ytw1o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Gl8LGv1TIvL4QZ7cnS148HQBDJwVE9NNVzbzSos7j1C+LR4pcbHiA7+FMfdfdnS6S
	 RKBLeQ0XS962cfp0c4ZQkfecT3H52OvGFqG7IDywb6G5IEvx8OuXhsSP9gp0rPpQDN
	 8SboM+6YIsZeuHMMHW085JjRfY2bdFwPAGrkV8H9I10DZB3fhQvyLmk/FIEVs5e0L4
	 3htjKnlkBFMbiRJv8nM6Wh2J4WnvLtrFx8VZKN8jsgIofPbH7lBmqjtBtCis/QXxNS
	 rv5jJRKrXhtMy4BeSgz8Naoh8i7JzRvIE+x5f+dXF36FrQMkQOqCpIbazQZtlj1sk5
	 I006odlgo1u2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B0A68186B;
	Mon, 29 Dec 2025 14:07:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33E461E1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D1C860AED
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MqKCDe49HVvo for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB9896086A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB9896086A
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB0F887B49; Mon, 29 Dec 2025 14:07:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 15:06:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9265e6973593240104c8f9e2a675c01c6c8e37a3
X-Git-Newrev: ee647574b7c8cc662937a312c6d20f555db777af
X-Patchwork-Hint: ignore
Message-Id: <20251229140743.CB0F887B49@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl: add CVE trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee647574b7c8cc662937a312c6d20f555db777af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
