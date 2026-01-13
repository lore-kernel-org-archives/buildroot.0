Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662ECD30CC2
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 373F360DC9;
	Tue, 13 Jan 2026 20:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mTQpkxFnoDSh; Tue, 13 Jan 2026 20:59:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F51D60DCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337945;
	bh=OtWq3umCz+Iyn48zI1r8YMuQ2odHd9ffVDXnb2Hvsuc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TTck+BYEmuRPRZARUwQ1qINaPW1wgAWKsloZJwAk3VSrfvUIZxh8fVNim4HnsCBPj
	 JMY7vUhNBZ4RqGRI0RrwV9xsS1Ibh/Q4TYkbZPJvCn28kw212JFqfb+OVSsuXFWFPS
	 9nisEryeDGpP4Oa59KNaNxJ7QKcQUqYb87L0lPe4TdPjvgsH7PYkhLl2Dm+53CBfFk
	 84/o9JUugrc/amXWujn8Viruyb9BVy1GSv/i/Hwi9VQqt0WRQABwkgVD/whlF80L9b
	 rjnrIbqWSdBenDhXkoerEYyQseQQldKCFmhLB7i3ZQgHlp2hYqvVbJxqGX1lFrP4H4
	 AsfLosbGuxUmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F51D60DCA;
	Tue, 13 Jan 2026 20:59:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 20E791CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52DCB4079A
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G4VR49eBrogr for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0621940771
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0621940771
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0341A819E3; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc1ce4c2b54f8df71941e305e6aa48b7e1eb3e06
X-Git-Newrev: 287906a87023c363dff8ecf18daf7f339d796911
X-Patchwork-Hint: ignore
Message-Id: <20260113205846.0341A819E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xgc: bump version to
 1.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=287906a87023c363dff8ecf18daf7f339d796911
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2025-July/003621.html

Updated license hash due to upstream commits:
https://gitlab.freedesktop.org/xorg/app/xgc/-/commit/ff0106429414d845d72c723fc69123ee2beebaf1
https://gitlab.freedesktop.org/xorg/app/xgc/-/commit/3e699516059eaebbd9a65b7844b052c0bd71aaa0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xgc/xapp_xgc.hash | 8 ++++----
 package/x11r7/xapp_xgc/xapp_xgc.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xgc/xapp_xgc.hash b/package/x11r7/xapp_xgc/xapp_xgc.hash
index 7664e31186..896fd29068 100644
--- a/package/x11r7/xapp_xgc/xapp_xgc.hash
+++ b/package/x11r7/xapp_xgc/xapp_xgc.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003221.html
-sha256  7b87bbdbce4ec858738a3b81b8a3943aff01036001e2a1d00bb5384392a8b240  xgc-1.0.6.tar.xz
-sha512  f449b9b2d313aeba1fe9bf33fef90291776403f1fdf4afc507c4b973045c97fc8ded65ddec4f8c58727e7e4c7c4ad6a65ae79581eb4bdfe9c79a5f909dbc0a1f  xgc-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-July/003621.html
+sha256  d858258c05eaac2d1f48bb44820dc2dce0a68601a14fff97853c72b48d1b7d08  xgc-1.0.7.tar.xz
+sha512  2d994c1dfa93b8c99756336d099737025d97ae0e6ec102e964ffe4a46209e518917fb2bc57bf0274010e099742bd50fcdebdaf9add0d9c02849edb220bced4a7  xgc-1.0.7.tar.xz
 # Locally computed
-sha256  13ebeb3e59e406064d46e94a707ed5ec5d8d2bf840971265dd46db0850d22d02  COPYING
+sha256  db697e5e99f065bb3602a16fb7e60789cbd34c5cce49c5d4a4577e73d733bb12  COPYING
diff --git a/package/x11r7/xapp_xgc/xapp_xgc.mk b/package/x11r7/xapp_xgc/xapp_xgc.mk
index fc055f57dd..8248daf8db 100644
--- a/package/x11r7/xapp_xgc/xapp_xgc.mk
+++ b/package/x11r7/xapp_xgc/xapp_xgc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XGC_VERSION = 1.0.6
+XAPP_XGC_VERSION = 1.0.7
 XAPP_XGC_SOURCE = xgc-$(XAPP_XGC_VERSION).tar.xz
 XAPP_XGC_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XGC_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
