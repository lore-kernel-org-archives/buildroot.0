Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC927C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 19:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE45D81D02;
	Tue,  7 Jun 2022 19:38:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nIbXxpwIg0v2; Tue,  7 Jun 2022 19:38:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1FCD8183D;
	Tue,  7 Jun 2022 19:38:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC9181BF475
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E950408C0
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:17:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XMra1wJo9u8m for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 19:16:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 484D4408BC
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 19:16:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 49EC086E22; Tue,  7 Jun 2022 19:05:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 22:36:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34d157af56c74cd69bd6a6472d1e2f571161a8d7
X-Git-Newrev: 62d9c9687818ebc68437cf984aedba02014fcda7
X-Patchwork-Hint: ignore
Message-Id: <20220607190500.49EC086E22@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/x11r7/xdriver_xf86-video-openchrome: switch source to git repo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=62d9c9687818ebc68437cf984aedba02014fcda7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No functional changes here, the commit used equals version 0.6.0:
https://cgit.freedesktop.org/openchrome/xf86-video-openchrome/commit/?id=5e158c76eb3a0fb0db207229697139f8da2faaae

A follow-up bump will fix build errors with gcc-10.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../xdriver_xf86-video-openchrome.hash                             | 7 ++-----
 .../xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk | 7 ++++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
index 57cc9aca9c..8c1c5ac91b 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
@@ -1,6 +1,3 @@
-# From https://lists.x.org/archives/xorg-announce/2017-March/002781.html
-md5 c87f164739729b00f7e1a9934420c22d  xf86-video-openchrome-0.6.0.tar.bz2
-sha1 2077181ded4d86e9cbe6d3e9b1245339692e848d  xf86-video-openchrome-0.6.0.tar.bz2
-sha256 da2975c6379358de52c1257710c67eb59139a7f0a1cd28d00cc64cc3e1c02f75  xf86-video-openchrome-0.6.0.tar.bz2
 # Locally computed
-sha256 1fde58bce5cff8c32e9a0a80bfa3e60213a2767954e30a367127d5afa2884ca2  COPYING
+sha256  05beeaff42ffbe41f37dbed0d6fe94d1829a9dd847cdab4068d107cfc485a62b  xdriver_xf86-video-openchrome-5e158c76eb3a0fb0db207229697139f8da2faaae-br1.tar.gz
+sha256  1fde58bce5cff8c32e9a0a80bfa3e60213a2767954e30a367127d5afa2884ca2  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
index db9e11f6da..0e04f59466 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_OPENCHROME_VERSION = 0.6.0
-XDRIVER_XF86_VIDEO_OPENCHROME_SOURCE = xf86-video-openchrome-$(XDRIVER_XF86_VIDEO_OPENCHROME_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_OPENCHROME_SITE = http://xorg.freedesktop.org/archive/individual/driver
+XDRIVER_XF86_VIDEO_OPENCHROME_VERSION = 5e158c76eb3a0fb0db207229697139f8da2faaae
+XDRIVER_XF86_VIDEO_OPENCHROME_SITE = https://anongit.freedesktop.org/git/openchrome/xf86-video-openchrome.git
+XDRIVER_XF86_VIDEO_OPENCHROME_SITE_METHOD = git
 XDRIVER_XF86_VIDEO_OPENCHROME_LICENSE = MIT
 XDRIVER_XF86_VIDEO_OPENCHROME_LICENSE_FILES = COPYING
+XDRIVER_XF86_VIDEO_OPENCHROME_AUTORECONF = YES
 
 XDRIVER_XF86_VIDEO_OPENCHROME_DEPENDENCIES = \
 	xserver_xorg-server \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
