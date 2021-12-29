Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D0AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 23:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86D2D60B57;
	Wed, 29 Dec 2021 23:20:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IegqUcA60z7T; Wed, 29 Dec 2021 23:20:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5713160B54;
	Wed, 29 Dec 2021 23:20:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4A9D01BF280
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 23:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46FD88145B
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 23:20:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1XSonANx5-eb for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 23:20:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0831381445
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 23:20:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 738EE82B9F; Wed, 29 Dec 2021 23:14:22 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 00:19:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 792ce13913bd01b3b8c508075f134ffb525ea7f0
X-Git-Newrev: 153d028303c88b25344f33ddee0094b2ac5e2f49
X-Patchwork-Hint: ignore
Message-Id: <20211229231422.738EE82B9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vlc: needs host-gettext
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

commit: https://git.buildroot.net/buildroot/commit/?id=153d028303c88b25344f33ddee0094b2ac5e2f49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build fails on systems without /usr/bin/msgfmt. This has been an issue
that exists since at least vlc 3.0.7, with build failures that can be
found as early as August 2019.

Fixes:

  http://autobuild.buildroot.net/results/3c9893dd92d784a0520a287c4d4a5e760393c95f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vlc/vlc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 06fc650f6f..fe338fcbe8 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -11,7 +11,7 @@ VLC_LICENSE = GPL-2.0+, LGPL-2.1+
 VLC_LICENSE_FILES = COPYING COPYING.LIB
 VLC_CPE_ID_VENDOR = videolan
 VLC_CPE_ID_PRODUCT = vlc_media_player
-VLC_DEPENDENCIES = host-pkgconf
+VLC_DEPENDENCIES = host-gettext host-pkgconf
 VLC_AUTORECONF = YES
 
 # Install vlc libraries in staging.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
