Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1C4C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3AE640591;
	Mon,  4 Apr 2022 19:48:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l8rl7zuwosWa; Mon,  4 Apr 2022 19:48:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2585401DF;
	Mon,  4 Apr 2022 19:48:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF1BE1BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED0E881AAB
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:48:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4YDHqOaZpEMR for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:48:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45D9481A24
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:48:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 95069829FC; Mon,  4 Apr 2022 19:38:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 21:46:41 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f74be7b432843d2da0ba6dc2ceea2c5dc15d60ed
X-Git-Newrev: 81317c9ee54bf464b89765afa9808f7ecb4db6b2
X-Patchwork-Hint: ignore
Message-Id: <20220404193844.95069829FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/fluidsynth: needs
 C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=81317c9ee54bf464b89765afa9808f7ecb4db6b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

fluidsynth needs C++ since bump to version 2.2.0 in commit
7e02d2e762eb94fde1f222df1b960dbd263fa946 and
https://github.com/FluidSynth/fluidsynth/commit/0d98c47545aa2424741c0cc2b244e4f73249302c:

CMake Error at CMakeLists.txt:32 (project):
  No CMAKE_CXX_COMPILER could be found.

Fixes:
 - http://autobuild.buildroot.org/results/fe677f7b38c8ed7011f1c976bdb45768067936f7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 2eeb66a82b2dc5696cb1b9b9e9a1f0df1e7b1647)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fluidsynth/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/Config.in b/package/fluidsynth/Config.in
index 5726e235e4..376419ce8f 100644
--- a/package/fluidsynth/Config.in
+++ b/package/fluidsynth/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_FLUIDSYNTH
 	# the .pc file installed by fluidsynth does not mention its
 	# indirect dependencies in Libs.private.
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  FluidSynth is a real-time software synthesizer based on the
@@ -128,7 +129,7 @@ config BR2_PACKAGE_FLUIDSYNTH_READLINE
 
 endif # BR2_PACKAGE_FLUIDSYNTH
 
-comment "fluidsynth needs a toolchain w/ threads, wchar, dynamic library"
+comment "fluidsynth needs a toolchain w/ threads, wchar, dynamic library, C++"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
