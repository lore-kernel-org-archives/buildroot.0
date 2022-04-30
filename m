Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC47AC433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3AB6404F8;
	Sat, 30 Apr 2022 18:54:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sg9ryJW6n6pz; Sat, 30 Apr 2022 18:54:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDB5B404F0;
	Sat, 30 Apr 2022 18:54:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C62E1BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8920660B8B
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZF-ErSbYwMR5 for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:54:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F221660B58
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:54:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 88FDC84B62; Sat, 30 Apr 2022 18:44:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 30 Apr 2022 20:20:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7280c202f8a29310fa801e5322dad00308c9c4c7
X-Git-Newrev: 29a38e7941ada87c344e2edad49a904e1084110b
X-Patchwork-Hint: ignore
Message-Id: <20220430184417.88FDC84B62@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libv4l: drop -largp
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

commit: https://git.buildroot.net/buildroot/commit/?id=29a38e7941ada87c344e2edad49a904e1084110b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 07ac045655d08255fbc2d17b16a42d0f0017632e added -largp to LIBS but
it was not needed since
https://git.linuxtv.org/v4l-utils.git/commit/configure.ac?id=b187b94d8e9158973ad17ea1f9c4cb01df117ba3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
