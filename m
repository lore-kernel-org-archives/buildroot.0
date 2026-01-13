Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF9DD30CC4
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 281CF40C2E;
	Tue, 13 Jan 2026 20:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4D3Do3Bhsj7w; Tue, 13 Jan 2026 20:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C2F340D09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337960;
	bh=ub17A+mt+VbaSetl7vpOP/HKlvvFJjAFVb/ibTYc1as=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Wi/vZldddhvEvVdogAW3bsfMrjmTOQz9r48dDGNX3SXzyc6a9yRluSjlEbtx9cMsJ
	 rD+bR/roJL/gTGYkIR6uQihN1ZWMwnfcIvIb23uBd+x696sj5SoeVAI7fot+ttJ1/z
	 rDsBjv5hgpzxB3sCVewgxqPHeXzm/SeT9dXqVD5F9uzXa5SO1kfeTnPHWy+l09dMuZ
	 Z+jN/AMljy9/lKDn7fr3j2BFmXHzQW0Kt2gODa9MjnRSeKfAEmZi6JhrrxDNcAZuZK
	 oKlZtOxP4b5RbaAawCvJt1ILp3aNSiG+tV8ABWD41f44ZRI6KzvBVMsuUrRByAtD2e
	 LpUc8iWkKEzIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C2F340D09;
	Tue, 13 Jan 2026 20:59:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 17F0E1CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4C2B407B4
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9_3eTUd3FAc for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0385340793
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0385340793
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00FB3819E3; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 293e47420884109c28401ed2b144ebd924198af9
X-Git-Newrev: a6673cfb2f47c03374e40ecd28bd66d65abb0248
X-Patchwork-Hint: ignore
Message-Id: <20260113205847.00FB3819E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXxf86vm: bump
 version to 1.1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=a6673cfb2f47c03374e40ecd28bd66d65abb0248
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-December/003574.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash | 6 +++---
 package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash
index d181310c69..4f757fffbb 100644
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-September/003213.html
-sha256  247fef48b3e0e7e67129e41f1e789e8d006ba47dba1c0cdce684b9b703f888e7  libXxf86vm-1.1.5.tar.xz
-sha512  68226fcb9773a583ea417ab413146203dd7db6ff8a4d388285da972353355e11e179861a77c9fa284aefac025bb3bbf5a9537fa0bf246c782e0116a667c9d9b6  libXxf86vm-1.1.5.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-December/003574.html
+sha256  96af414c73ce1d5449ad04be7f9f27fa8330f844b6dda843ef22e3e1befb3ee3  libXxf86vm-1.1.6.tar.xz
+sha512  7fb3ac4302eea43b70d5106f6c7a113e28e2807da22d2bb7f040e0c4afd322cad4b7f258a5bd6da3940b6b6b39065e1acb218a6dc0ba06b9dd86ea3849231266  libXxf86vm-1.1.6.tar.xz
 # Locally calculated
 sha256  f3da8eaed19e27e4f67e6f076d4ebdb8d649e15a8ad33a415fb65a23de1b6689  COPYING
diff --git a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
index 0f3decb04e..517e7b4e30 100644
--- a/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
+++ b/package/x11r7/xlib_libXxf86vm/xlib_libXxf86vm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXXF86VM_VERSION = 1.1.5
+XLIB_LIBXXF86VM_VERSION = 1.1.6
 XLIB_LIBXXF86VM_SOURCE = libXxf86vm-$(XLIB_LIBXXF86VM_VERSION).tar.xz
 XLIB_LIBXXF86VM_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXXF86VM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
