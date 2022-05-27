Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FE4C433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 19:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1AD7409B5;
	Fri, 27 May 2022 19:12:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XCwo3AXnBEhN; Fri, 27 May 2022 19:12:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE4CA409D5;
	Fri, 27 May 2022 19:12:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31B4E1BF296
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 19:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 215D560BC0
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 19:11:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gox02jm56m9Q for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 19:11:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DD3760BB4
 for <buildroot@buildroot.org>; Fri, 27 May 2022 19:11:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A5DEA866C2; Fri, 27 May 2022 19:00:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 21:10:39 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2949a96373fa7f7d1232c8b2323808015774fd6c
X-Git-Newrev: 0c1b40a3acbb8d5dabb99f6e6c89cde613ef2aa4
X-Patchwork-Hint: ignore
Message-Id: <20220527190009.A5DEA866C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libv4l: drop
 -largp
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c1b40a3acbb8d5dabb99f6e6c89cde613ef2aa4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit 07ac045655d08255fbc2d17b16a42d0f0017632e added -largp to LIBS but
it was not needed since
https://git.linuxtv.org/v4l-utils.git/commit/configure.ac?id=b187b94d8e9158973ad17ea1f9c4cb01df117ba3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 29a38e7941ada87c344e2edad49a904e1084110b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libv4l/libv4l.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 8300f5c970..a781ffcd5d 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -28,7 +28,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 LIBV4L_DEPENDENCIES += argp-standalone
-LIBV4L_LIBS += -largp
 endif
 
 LIBV4L_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
@@ -85,6 +84,4 @@ ifeq ($(BR2_PACKAGE_SDL2_IMAGE),y)
 LIBV4L_DEPENDENCIES += sdl2_image
 endif
 
-LIBV4L_CONF_ENV += LIBS="$(LIBV4L_LIBS)"
-
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
