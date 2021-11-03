Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F75C433FE
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:56:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 264356109F
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 20:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 264356109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5AAF60AF5;
	Wed,  3 Nov 2021 20:56:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UsdjBxOtBbIL; Wed,  3 Nov 2021 20:56:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B8E760AE4;
	Wed,  3 Nov 2021 20:56:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 460641BF9BA
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 438EA8101B
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8J6VXVU4UbIX for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 20:56:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9341781013
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 20:56:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EF3B28A3B7; Wed,  3 Nov 2021 20:52:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 20:47:25 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: e0518531f693af12829b94fcb1a3377e812b778e
X-Git-Newrev: cf696504ca4143712a631fe3023364bbcd163801
X-Patchwork-Hint: ignore
Message-Id: <20211103205251.EF3B28A3B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/gstreamer1/gst1-plugins-bad: fix meson options
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf696504ca4143712a631fe3023364bbcd163801
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix teletextdec name and remove vdpau which is no longer available.

Fixes:
output/build/gst1-plugins-bad-1.18.5/meson.build:1:0: ERROR: Unknown options: "teletextdec, vdpau"

(WARNING for now, but will be an error in meson 0.60.0).

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 87505ba9478fa039a72eaa984c07733cdd5ea280)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index d8b2e2a5d3..d3f089bfed 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -59,12 +59,11 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	-Dofa=disabled \
 	-Dopenexr=disabled \
 	-Dopenni2=disabled \
-	-Dteletextdec=disabled \
+	-Dteletext=disabled \
 	-Dwildmidi=disabled \
 	-Dsmoothstreaming=disabled \
 	-Dsoundtouch=disabled \
 	-Dgme=disabled \
-	-Dvdpau=disabled \
 	-Dspandsp=disabled \
 	-Dsvthevcenc=disabled \
 	-Dtranscode=disabled \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
