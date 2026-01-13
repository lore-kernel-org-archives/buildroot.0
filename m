Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5851D30CC3
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BB9D83B9C;
	Tue, 13 Jan 2026 20:59:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3tlIhx5Xh7Gq; Tue, 13 Jan 2026 20:59:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0824483B91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337982;
	bh=1/jEaURGrveOtznlmwjWBmwxrGRPE7/HhDVFsPJdg9Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KxDJeqTo5UQjEhSmhkwRIAZTU+rr0CI5fw5eqVJT/xBE6PhxijQ6d+Svz8rV8ixU6
	 9sbGeu1zmO8ohPcAdmFJJGAFKGjHRxbZSyfqaxAvv31+4cyRJ8QF74ZetkCAYvQzYM
	 maNN3/hdFSk7HfjIRhHquzhBBAB2tuFCs3Q5YFXzlI1OM36mVifOisRmuQbZA8XdPa
	 EI+rd5Y/2TimzLBcCrmND/XOjn6g0wZn1QxoX00oyYU+ALamrelfjz6z008wjrHGua
	 rpY2yzGd7rfLhMDxhrz/7O9FuCxp7ViUu96TUne/LiknH27emj6soZ87drlz+vuw5o
	 bwLvA7cnunPRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0824483B91;
	Tue, 13 Jan 2026 20:59:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A66B61CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1456D4077E
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6E7BS59ST8I3 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88AF4407A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88AF4407A0
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86E5982242; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa812972cdc9102ab51868119efd96be2720ee86
X-Git-Newrev: cd951830c703ae7afb50a3c0f3be6b1c042b668e
X-Patchwork-Hint: ignore
Message-Id: <20260113205847.86E5982242@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xcompmgr: bump version
 to 1.1.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd951830c703ae7afb50a3c0f3be6b1c042b668e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-November/003555.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash | 6 +++---
 package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash
index b9675a5ecf..74333d92c0 100644
--- a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash
+++ b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-November/003254.html
-sha256  4875b6698672d01eb3a5080bde6eac9a989d486a82226a2d5e23624f1527a6f0  xcompmgr-1.1.9.tar.xz
-sha512  699117492af7fd84b36d317dcbf422d5ec86a7f21e29370caa737cd940d8ff866a5c8704ba2e7bd17a64e085d77fd23b628263d619813dead85cd669ff5b860e  xcompmgr-1.1.9.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-November/003555.html
+sha256  7824f709c4f22432eaea7542ec93384e5dd48f6fcb85c12ff82d721423b0b98f  xcompmgr-1.1.10.tar.xz
+sha512  6dd5c72d6859489580dabdb96e3b572931cec7c426022213007c92df2d805a8f01a7f3dc5e8493f6e550bb809f71a50ca1630f50555d47b8d5b4b2726d7b8b12  xcompmgr-1.1.10.tar.xz
 # Locally computed
 sha256  c843545f72771b3ff95eb88defc2e3ed8f9a1802d9bb6c32c196bb5eec3d3a5d  COPYING
diff --git a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk
index c754ea37b3..d8a6855d88 100644
--- a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk
+++ b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XCOMPMGR_VERSION = 1.1.9
+XAPP_XCOMPMGR_VERSION = 1.1.10
 XAPP_XCOMPMGR_SOURCE = xcompmgr-$(XAPP_XCOMPMGR_VERSION).tar.xz
 XAPP_XCOMPMGR_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XCOMPMGR_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
