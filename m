Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962E6EE57CF
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 19:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5575740FD5;
	Wed, 11 Sep 2024 19:42:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVw02W2lc_H5; Wed, 11 Sep 2024 19:42:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1C0D40FC2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1C0D40FC2;
	Wed, 11 Sep 2024 19:42:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A4BDA1BF369
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0EB04197F
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EnFO_cxZjkyk for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 19:41:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C69CA41980
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C69CA41980
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 19:41:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B030386FB9; Wed, 11 Sep 2024 19:41:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 21:41:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ae3c6f2ad5fb8bbc46ebe3b7a4bc0d3194d25f2
X-Git-Newrev: 14b1b8ca8dc92851aa7400af432874621cfdb776
X-Patchwork-Hint: ignore
Message-Id: <20240911194152.B030386FB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package: move wireplumber from Graphics to
 Audio/Video
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

commit: https://git.buildroot.net/buildroot/commit/?id=14b1b8ca8dc92851aa7400af432874621cfdb776
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

WirePlumber is a PipeWire session manager, essential to the operation
of PipeWire in most use cases. It is not a graphical application,
nor does it support graphics in any way. It is only there to support
PipeWire and it should be kept together with PipeWire in the menus.

Signed-off-by: George Kiagiadakis <george.kiagiadakis@collabora.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 17855fed30..8f8f1ff8ee 100644
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
@@ -1762,7 +1763,6 @@ menu "Graphics"
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
