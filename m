Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD2CD30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96AA583EE8;
	Tue, 13 Jan 2026 21:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNgJ0THbIrAs; Tue, 13 Jan 2026 21:00:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7880C83EE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338013;
	bh=m+jmThiGdOjaFwxLhNCea6/S9tIPGwprm6rncHqnBaU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z+B/YtL5ebGtuxvKtLMgXZp98CztajWNdK20RjH/azBVKJwKDMhGtEkc+C/fqT+Vx
	 1sZt/bxp0BUNUN6TLuuI48Al9TwTPK81MwcianXpwYuB1vzTVkGVPt7oTu5b+YEJ24
	 tMCJCrI2RmXyCwZintrZgKjIoYnAz54pU1vH+aDlmgRci72OvN+TP8/uSotgCwvGBD
	 OYG6rzxxZwy9+J2mVjYrWxACmS4Ja6idyF4hJpv3/pBqBsYyaajYyx+z/s771no7FK
	 udNudgkOGU5H5/pZX5AET+ALGXVCTs9pQYt4zFNRUojr00uMz/++cSXRdsUi/Beizg
	 DBFZR/mIpk0TQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7880C83EE5;
	Tue, 13 Jan 2026 21:00:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 825BE1CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A45A6407A3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QHc8vLrmn-co for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1108B407A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1108B407A7
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 014FE82242; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90b693a416e2e76d23c3b2cd8c46d236a667a646
X-Git-Newrev: 8f055850735dccf3264809277a47e809f8c97e8a
X-Patchwork-Hint: ignore
Message-Id: <20260113205848.014FE82242@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_bdftopcf: bump version
 to 1.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f055850735dccf3264809277a47e809f8c97e8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-October/003542.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash | 6 +++---
 package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash
index 0596b65e49..9e314ba000 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003223.html
-sha256  11c953d53c0f3ed349d0198dfb0a40000b5121df7eef09f2615a262892fed908  bdftopcf-1.1.1.tar.xz
-sha512  257dc9ae29f2cf1496aad91ccba534348d87f881d75431aa6611a8154cb817d17588c464ab6c6c6bc51e6060baa8dcfcb9fd8c037cdaea8d18287651fa6b7ea9  bdftopcf-1.1.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-October/003542.html
+sha256  bc60be5904330faaa3ddd2aed7874bee2f29e4387c245d6787552f067eb0523a  bdftopcf-1.1.2.tar.xz
+sha512  b3dde8d73084b7ec23ea47491321d12fa8f4a0a9ce0f61f2f89460fdc98f05d135ba11d8588d9debb8c2639ac68a7434a0cf80d9d548cd7328cbcb2339b4c0a6  bdftopcf-1.1.2.tar.xz
 # Locally calculated
 sha256  a437fb5272ba507c2977b2ef623bb391270f521b2a20271ed044785f4eaa5dbc  COPYING
diff --git a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
index d47f5c02ce..990e673105 100644
--- a/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
+++ b/package/x11r7/xapp_bdftopcf/xapp_bdftopcf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_BDFTOPCF_VERSION = 1.1.1
+XAPP_BDFTOPCF_VERSION = 1.1.2
 XAPP_BDFTOPCF_SOURCE = bdftopcf-$(XAPP_BDFTOPCF_VERSION).tar.xz
 XAPP_BDFTOPCF_SITE = https://xorg.freedesktop.org/archive/individual/util
 XAPP_BDFTOPCF_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
