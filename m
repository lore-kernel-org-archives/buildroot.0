Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C27CE8FDA7
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F19540949;
	Fri, 26 Dec 2025 18:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R1iS3BHJwFH6; Fri, 26 Dec 2025 18:21:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1706D409D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773286;
	bh=F3FS2GHD+xlLVc65RGNgl4oLAzGZUhbxwNBRm9iHQGQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Xbtno4O1sfkgu8CxRf4NbcZMi8YEgFH4pwhiqPqr4ox9OJIztA3Y7UzYPUq+IVbBQ
	 aJ3iUf54q9DGYGopivLKHptHp7OOubk7NUB5jQBcDGfwkC8apyYvBcEoBGeKM4ss/8
	 oqrw1BhTYEBLP4pRSui2Dc8Ch6KoYiFylQngmZdWcK73I4zEU5+ZYtYjjsEmDarBzr
	 mtckXyVC/XFDJXVLLjRJ7GDD64O1dIcgLCfgmYD3Tmhw1AekPm9mVxMyoTa0zER1NQ
	 akZ09tXX4KUjcbXs/IbaTTS2JOwy8kddn/sMBK9xzZzF+QybBe/j5PrGCxOiSSIOen
	 rSg6Tbk7auFHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1706D409D1;
	Fri, 26 Dec 2025 18:21:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 196C0B9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B138F80BDB
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SubLfxxzBFjS for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D199680C3F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D199680C3F
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CEEA48461E; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f32dd28b5c13c2747b27221480db694c99ac838
X-Git-Newrev: 972358973fef8c8e2d314d77eaf9a6b6229eb64a
X-Patchwork-Hint: ignore
Message-Id: <20251226182055.CEEA48461E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-nv: bump
 version to 2.1.23
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

commit: https://git.buildroot.net/buildroot/commit/?id=972358973fef8c8e2d314d77eaf9a6b6229eb64a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2024-March/003489.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash | 6 +++---
 package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
index ec7d198c18..4154efb612 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003196.html
-sha256  6218932db5c389878d853b11b8fbb667c321b65276f55aa6842a56fb1a30d288  xf86-video-nv-2.1.22.tar.xz
-sha512  a54767e9060404cafbb028ea36e582e8cfb7431a746cfc1d698c435fa73e41c4dfc12f84e50d002a582ac61e2d4c377f4defdf407250ee9e8656e5ff989b3cda  xf86-video-nv-2.1.22.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003489.html
+sha256  c68dbda431f3d47000606f8173b977b811c76ba9dda1a5d2e3ee122bbbb98aca  xf86-video-nv-2.1.23.tar.xz
+sha512  ce09f37bd29bbe588a8788d643240c9b0324654ea37b8e7f0f127494999f24b3048ca0c7ea91b33ef94efd12b570bfb73c8a5e20bf63749b01cbdc5669136b9e  xf86-video-nv-2.1.23.tar.xz
 # Locally calculated
 sha256  10d10e1ec37594d481c3de8dda22a40b731ebd43be7ccd462baaa7394738a9f3  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
index 2aab60aaf9..cec2101d3c 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_NV_VERSION = 2.1.22
+XDRIVER_XF86_VIDEO_NV_VERSION = 2.1.23
 XDRIVER_XF86_VIDEO_NV_SOURCE = xf86-video-nv-$(XDRIVER_XF86_VIDEO_NV_VERSION).tar.xz
 XDRIVER_XF86_VIDEO_NV_SITE = https://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NV_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
