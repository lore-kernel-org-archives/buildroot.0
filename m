Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B176C25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 20:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDA4660B3D;
	Tue, 16 Aug 2022 20:12:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDA4660B3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rrm4w8KKtyw3; Tue, 16 Aug 2022 20:12:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E66460B05;
	Tue, 16 Aug 2022 20:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E66460B05
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E1C301BF470
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA05E60B2D
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 20:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA05E60B2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yGOy6pPNpVDH for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 20:12:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AC2760625
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 20:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AC2760625
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CCE7F87876; Tue, 16 Aug 2022 19:58:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 21:52:31 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 4a297987151fb6de3fded300f5a614d5ccc908bd
X-Git-Newrev: 0945915e4b66ea39e3f08a174f7bc741af1ad455
X-Patchwork-Hint: ignore
Message-Id: <20220816195804.CCE7F87876@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=0945915e4b66ea39e3f08a174f7bc741af1ad455
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
