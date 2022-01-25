Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F75C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 21:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1871160AAB;
	Tue, 25 Jan 2022 21:16:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ojQULl_BEqf; Tue, 25 Jan 2022 21:16:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C86660B02;
	Tue, 25 Jan 2022 21:16:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B1CE11BF599
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 21:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F02182882
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 21:15:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WVyCkpYuAP1R for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 21:15:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED966818C4
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 21:15:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C306D825E2; Tue, 25 Jan 2022 21:09:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 22:14:37 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 11f7c50bc2a0451bab846166cbc4ab680205e545
X-Git-Newrev: 575a94b1acc2079f6f0ebb37f451f6bf044c99eb
X-Patchwork-Hint: ignore
Message-Id: <20220125210906.C306D825E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/vlc: needs
 host-gettext
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

commit: https://git.buildroot.net/buildroot/commit/?id=575a94b1acc2079f6f0ebb37f451f6bf044c99eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Build fails on systems without /usr/bin/msgfmt. This has been an issue
that exists since at least vlc 3.0.7, with build failures that can be
found as early as August 2019.

Fixes:

  http://autobuild.buildroot.net/results/3c9893dd92d784a0520a287c4d4a5e760393c95f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 153d028303c88b25344f33ddee0094b2ac5e2f49)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
