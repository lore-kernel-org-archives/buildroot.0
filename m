Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AC6C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 19:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03586812D3;
	Tue,  2 Jul 2024 19:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3gB4sIdFNW1q; Tue,  2 Jul 2024 19:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6F3281DE6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6F3281DE6;
	Tue,  2 Jul 2024 19:44:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11EF21BF97D
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D885741518
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDDh9RPwjiyp for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 19:44:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7B5E4150E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7B5E4150E
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 19:44:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A319783B27; Tue,  2 Jul 2024 19:44:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 21:32:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31135a07b6ca5d305d1c3f0010bfe838c4cdc0c6
X-Git-Newrev: 328721a6e053043043309ddc8eb23f9aae36bb72
X-Patchwork-Hint: ignore
Message-Id: <20240702194447.A319783B27@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnfs: update the patches to be
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
Content-Type: multipart/mixed; boundary="===============8041833814115406448=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8041833814115406448==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=328721a6e053043043309ddc8eb23f9aae36bb72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, libnfs fails to build with output:

    Applying 0001-Fix-include-sys-time.h.patch using patch:
    patching file include/nfsc/libnfs.h
    Hunk #1 FAILED at 24.
    1 out of 1 hunk FAILED -- saving rejects to file include/nfsc/libnfs.h.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libnfs/0001-Fix-include-sys-time.h.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libnfs/0001-Fix-include-sys-time.h.patch b/package/libnfs/0001-Fix-include-sys-time.h.patch
index c3779f13a2..03193d6d71 100644
--- a/package/libnfs/0001-Fix-include-sys-time.h.patch
+++ b/package/libnfs/0001-Fix-include-sys-time.h.patch
@@ -16,6 +16,8 @@ Upstream: https://github.com/sahlberg/libnfs/issues/272
 Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
 [Fabrice: update for 5.0.2]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  include/nfsc/libnfs.h | 5 -----
  1 file changed, 5 deletions(-)
@@ -24,8 +26,8 @@ diff --git a/include/nfsc/libnfs.h b/include/nfsc/libnfs.h
 index 09dcf1c..b6db58c 100755
 --- a/include/nfsc/libnfs.h
 +++ b/include/nfsc/libnfs.h
-@@ -24,12 +24,7 @@
- #define _LIBNFS_H_
+@@ -28,12 +28,7 @@
+ #endif
  
  #include <stdint.h>
 -#if defined(__ANDROID__) || defined(AROS) || defined(__PPU__) \

--===============8041833814115406448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8041833814115406448==--
