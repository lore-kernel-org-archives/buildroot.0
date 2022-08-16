Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC0DC25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 20:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1DDF404DA;
	Tue, 16 Aug 2022 20:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1DDF404DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yp29XMSDU-R3; Tue, 16 Aug 2022 20:15:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD7EA4019E;
	Tue, 16 Aug 2022 20:15:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD7EA4019E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F3CD71BF9B9
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA8C6408B6
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA8C6408B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 12hTFvoD-NhB for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 20:12:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE7BC40650
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 20:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE7BC40650
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6D2E68788C; Tue, 16 Aug 2022 19:58:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 21:50:44 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0e2d07ee6e93b56d0202227d3655fd44dcb5d662
X-Git-Newrev: 4608a025d200cc34e1b6985fa5b4a6641b2fb66d
X-Patchwork-Hint: ignore
Message-Id: <20220816195810.6D2E68788C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 package/glslsandbox-player: drop BR2_TOOLCHAIN_HAS_THREADS workaround
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

commit: https://git.buildroot.net/buildroot/commit/?id=4608a025d200cc34e1b6985fa5b4a6641b2fb66d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

We used to have a BR2_TOOLCHAIN_HAS_THREADS dependency at the
top-level BR2_PACKAGE_GLSLSANDBOX_PLAYER option to make sure that at
least one of them windowing system was selectable.

However, thanks to the recent introduction of the support for the null
windowing system, we now have a windowing system that doesn't require
any special feature, so we can drop this dependency from the top-level
option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 624f2e658d09d13cb9e61a8a52f2227d2a60d7f7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glslsandbox-player/Config.in | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index 19536c8546..2b049357a9 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -2,9 +2,6 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER
 	bool "glslsandbox-player"
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGLES
-	# Doesn't really depend on threads, but this makes sure we have at least
-	# one native windowing system available, and is good enough in practice.
-	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  GLSL Sandbox standalone player allow one to run and render
 	  (most of) nice shaders available online on the
@@ -117,6 +114,5 @@ endif
 
 endif
 
-comment "glslsandbox-player needs a toolchain w/ threads and an openGL ES and EGL driver"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES
+comment "glslsandbox-player needs openGL ES and EGL driver"
+	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
