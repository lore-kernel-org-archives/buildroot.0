Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8B7C4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 16:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45D5860ADA;
	Sun, 14 Jan 2024 16:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45D5860ADA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IX1aAur46vbt; Sun, 14 Jan 2024 16:40:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A273E60ABE;
	Sun, 14 Jan 2024 16:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A273E60ABE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 283E91BF41F
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 16:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0198241696
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 16:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0198241696
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RX32yfwXB-Wg for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 16:40:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E78E41692
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 16:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E78E41692
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BEBC8613F; Sun, 14 Jan 2024 16:40:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 17:38:57 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 7fe875886f7ecf27b9c820c148a1f4499b734d75
X-Git-Newrev: 67501521431c7b793497d0d74b9132bedfbf2b3f
X-Patchwork-Hint: ignore
Message-Id: <20240114164035.2BEBC8613F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/pipewire: fix
 webrtc-audio-processing condition
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

commit: https://git.buildroot.net/buildroot/commit/?id=67501521431c7b793497d0d74b9132bedfbf2b3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

The condition checking whether the webrtc-audio-processing package is
enabled, added in commit
3ccd3b4c384e98703841b12f7309362957f8f17d ("package/pipewire: bump to
version 0.3.32") is obviously incorrect, and can never be true.

Fix the condition to use the correct variable instead.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 52f8db409fade387f0f90940c0b32acb27317017)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pipewire/pipewire.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 628c69ff8a..f0f3cd847c 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -225,7 +225,7 @@ else
 PIPEWIRE_CONF_OPTS += -Dcompress-offload=disabled
 endif
 
-ifeq ($(WEBRTC_AUDIO_PROCESSING),y)
+ifeq ($(BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING),y)
 PIPEWIRE_CONF_OPTS += -Decho-cancel-webrtc=enabled
 PIPEWIRE_DEPENDENCIES += webrtc-audio-processing
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
