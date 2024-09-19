Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26643CE8D7A
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 11:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7B27412D1;
	Thu, 19 Sep 2024 11:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jM_d-UR-8lZR; Thu, 19 Sep 2024 11:30:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95D62412A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95D62412A9;
	Thu, 19 Sep 2024 11:30:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AD9E1BF97E
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 11:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1940381656
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 11:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5dc0oawziiVM for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 11:30:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D5D281425
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D5D281425
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 11:30:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CC3683CEC; Thu, 19 Sep 2024 11:30:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 13:19:05 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f7aa9aa70832ec51b0a4fc7e80de2b4d1d4e9240
X-Git-Newrev: 79b102c0f1614e7490b7bbdf52acef72417e7a4c
X-Patchwork-Hint: ignore
Message-Id: <20240919113031.3CC3683CEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package: move wireplumber
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

commit: https://git.buildroot.net/buildroot/commit/?id=79b102c0f1614e7490b7bbdf52acef72417e7a4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
index 33039331f7..36a3584c64 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -63,6 +63,7 @@ menu "Audio and video applications"
 	source "package/vlc/Config.in"
 	source "package/vorbis-tools/Config.in"
 	source "package/wavpack/Config.in"
+	source "package/wireplumber/Config.in"
 	source "package/yavta/Config.in"
 	source "package/ympd/Config.in"
 	source "package/zynaddsubfx/Config.in"
@@ -1718,7 +1719,6 @@ menu "Graphics"
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
