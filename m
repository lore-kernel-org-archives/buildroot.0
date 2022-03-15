Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989B3C433FE
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 22:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EB9C4057A;
	Tue, 15 Mar 2022 22:19:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cxMSjeq3sz_l; Tue, 15 Mar 2022 22:19:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 227EE4056D;
	Tue, 15 Mar 2022 22:19:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 37CF11BF422
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 22:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0D0840103
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 22:18:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cjeRmB_D59-m for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 22:18:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3C2240124
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 22:18:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id ADCED84157; Tue, 15 Mar 2022 22:09:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 22:53:12 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 5b71eb2b09041647a0fba2007c6b967535269c33
X-Git-Newrev: 7a1463d88f3c38d35d58c60c52d0627d9d45f94f
X-Patchwork-Hint: ignore
Message-Id: <20220315220952.ADCED84157@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/xscreensaver: add
 gdk-pixbuf-xlib dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a1463d88f3c38d35d58c60c52d0627d9d45f94f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

gdk-pixbuf-xlib dependency is needed since bump of gdk-pixbuf to version
2.42.2 in commit a7b51ed3013c919b293deb95299e33363fb9df70 to avoid the
following "hidden" warnings:

   Warning: GTK version 2.24.33 was found, but at least one supporting
            library (gdk-pixbuf-xlib-2.0) was not, so GTK can't be used.
            Perhaps some of the development packages are not installed?

   Warning: The GTK libraries do not seem to be available; the
            `xscreensaver-demo' program requires them.

   Warning: The GDK-Pixbuf library was not found.

            The PNG library is being used instead.

            Some of the demos will not use images as much as they could.
            You should consider installing GDK-Pixbuf and re-running
            configure.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 35f02050be12b86cdd2220e09c72fd2586346068)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xscreensaver/Config.in       | 1 +
 package/xscreensaver/xscreensaver.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index d773c69913..c18f7cc7fd 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_XSCREENSAVER
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libgtk2 -> pango -> harfbuzz
 	select BR2_PACKAGE_GDK_PIXBUF
+	select BR2_PACKAGE_GDK_PIXBUF_XLIB
 	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBXML2
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index f73a75bf14..46dedc3211 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -15,6 +15,7 @@ XSCREENSAVER_SELINUX_MODULES = xdg xscreensaver xserver
 
 XSCREENSAVER_DEPENDENCIES = \
 	gdk-pixbuf \
+	gdk-pixbuf-xlib \
 	jpeg \
 	libgtk2 \
 	libxml2 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
