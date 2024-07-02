Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B67AC3065C
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48BCB80F41;
	Tue,  2 Jul 2024 07:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1QvwMivPws7d; Tue,  2 Jul 2024 07:59:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 322B5810C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 322B5810C9;
	Tue,  2 Jul 2024 07:59:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 208521BF365
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A0F0405A7
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yS7W2d0zzHhd for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE1BD40581
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE1BD40581
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:59:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E73CC83ACB; Tue,  2 Jul 2024 07:59:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 09:54:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3fb44cc367b47e9d3eb15eba5e77d624f709d60e
X-Git-Newrev: e987d16478a87f9a7cd0c376b977459b28661486
X-Patchwork-Hint: ignore
Message-Id: <20240702075919.E73CC83ACB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ficl: update the patches to be
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

commit: https://git.buildroot.net/buildroot/commit/?id=e987d16478a87f9a7cd0c376b977459b28661486
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, ficl fails to build with output:

    Applying 0002-Makefile.linux-pass-LDFLAGS.patch using patch:
    patching file Makefile.linux
    Hunk #1 FAILED at 14.
    1 out of 1 hunk FAILED -- saving rejects to file Makefile.linux.rej

This commit refreshes the package patch on the current package version.

While we're at it, fix the usage of the Upstream: tag and update
.checkpackageignore accordingly.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                                 | 1 -
 package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch | 7 ++++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d4a4b47274..76b1c3c49b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -615,7 +615,6 @@ package/ffmpeg/0002-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch li
 package/ffmpeg/0003-libavutil-Fix-mips-build.patch lib_patch.Upstream
 package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch lib_patch.Upstream
 package/ficl/0001-fix-Makefile.patch lib_patch.Upstream
-package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch lib_patch.Upstream
 package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch lib_patch.Upstream
 package/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch lib_patch.Upstream
 package/flex/0002-build-make-it-possible-to-disable-the-build-of-the-f.patch lib_patch.Upstream
diff --git a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch b/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
index 2138089b0e..dd9e16412c 100644
--- a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
+++ b/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
@@ -12,7 +12,9 @@ Fixes:
  - http://autobuild.buildroot.org/results/bf041723ed813746c61892262630a3ac2bc43b14
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: upstream is dead]
+Upstream: upstream is dead
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  Makefile.linux | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -21,8 +23,7 @@ diff --git a/Makefile.linux b/Makefile.linux
 index 5f1a41f..df887e6 100644
 --- a/Makefile.linux
 +++ b/Makefile.linux
-@@ -14,7 +14,7 @@ MAJOR = 4
- MINOR = 0.31
+@@ -14,6 +14,6 @@ MINOR = 1.0
  
  ficl: main.o $(HEADERS) libficl.a
 -	$(CC) main.o -o ficl -L. -lficl -lm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
