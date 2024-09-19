Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA59CE8D7A
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 11:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D9764011A;
	Thu, 19 Sep 2024 11:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NrryEtw0Vj04; Thu, 19 Sep 2024 11:29:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE2BF404CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE2BF404CF;
	Thu, 19 Sep 2024 11:29:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 74B861BF33B
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 11:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7060484777
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 11:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1bsGRCLpT_zW for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 11:29:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3531840EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3531840EE
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 11:29:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A085B83CC2; Thu, 19 Sep 2024 11:29:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 13:19:21 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: c04b02323c7274f78f77c2665618793c2c3eb98d
X-Git-Newrev: 618b1b056c624f397530f64ff4c932bf83cf59e0
X-Patchwork-Hint: ignore
Message-Id: <20240919112922.A085B83CC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package: move wireplumber
 from Graphics to Audio/Video
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

commit: https://git.buildroot.net/buildroot/commit/?id=618b1b056c624f397530f64ff4c932bf83cf59e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

WirePlumber is a PipeWire session manager, essential to the operation
of PipeWire in most use cases. It is not a graphical application,
nor does it support graphics in any way. It is only there to support
PipeWire and it should be kept together with PipeWire in the menus.

Signed-off-by: George Kiagiadakis <george.kiagiadakis@collabora.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 14b1b8ca8dc92851aa7400af432874621cfdb776)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index f33c4780f8..74e63419d6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -61,6 +61,7 @@ menu "Audio and video applications"
 	source "package/vlc/Config.in"
 	source "package/vorbis-tools/Config.in"
 	source "package/wavpack/Config.in"
+	source "package/wireplumber/Config.in"
 	source "package/yavta/Config.in"
 	source "package/ympd/Config.in"
 	source "package/zynaddsubfx/Config.in"
@@ -1760,7 +1761,6 @@ menu "Graphics"
 	source "package/waylandpp/Config.in"
 	source "package/webkitgtk/Config.in"
 	source "package/webp/Config.in"
-	source "package/wireplumber/Config.in"
 	source "package/wlroots/Config.in"
 	source "package/woff2/Config.in"
 	source "package/wpebackend-fdo/Config.in"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
