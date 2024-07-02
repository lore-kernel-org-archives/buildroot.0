Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21BDC3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB06780C5A;
	Tue,  2 Jul 2024 07:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9aeeVn25vVnv; Tue,  2 Jul 2024 07:59:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F5F380C5F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F5F380C5F;
	Tue,  2 Jul 2024 07:59:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C44291BF31C
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF354606FA
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u3Ztm1i1qlR6 for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1BDF606AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1BDF606AE
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:59:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB0A283AC9; Tue,  2 Jul 2024 07:59:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 09:53:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2c5c608a366faed8af312a59e9ad22eec69be5f
X-Git-Newrev: 3fb44cc367b47e9d3eb15eba5e77d624f709d60e
X-Patchwork-Hint: ignore
Message-Id: <20240702075919.DB0A283AC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flite: update the patches to be
 applied with fuzz 0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3fb44cc367b47e9d3eb15eba5e77d624f709d60e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, flite fails to build with output:

    Applying 0001-fix-alsa-static.patch using patch:
    patching file configure.in
    Hunk #1 FAILED at 275.
    1 out of 1 hunk FAILED -- saving rejects to file configure.in.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/flite/0001-fix-alsa-static.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/flite/0001-fix-alsa-static.patch b/package/flite/0001-fix-alsa-static.patch
index 7ed4899cc4..83f0a86e4d 100644
--- a/package/flite/0001-fix-alsa-static.patch
+++ b/package/flite/0001-fix-alsa-static.patch
@@ -1,12 +1,14 @@
 Use pkg-config to determine alsa link flags. This fixes static linking.
 
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 diff -Nuar flite-1.4-release.orig/configure.in flite-1.4-release/configure.in
 --- flite-1.4-release.orig/configure.in	2009-08-14 23:46:38.000000000 +0300
 +++ flite-1.4-release/configure.in	2014-04-30 18:52:33.253297236 +0300
-@@ -275,7 +275,10 @@
-                 #endif],
+@@ -383,7 +383,10 @@ AC_CHECK_HEADER(sys/audioio.h,
+ AC_CHECK_HEADER(alsa/asoundlib.h,
                [AUDIODRIVER="alsa"
  	       AUDIODEFS=-DCST_AUDIO_ALSA
 -               AUDIOLIBS=-lasound])
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
