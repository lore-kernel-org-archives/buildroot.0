Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510AEC4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 16:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08D0260EE8;
	Sun, 14 Jan 2024 16:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08D0260EE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ve4dpDwR5XhF; Sun, 14 Jan 2024 16:43:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D58D60ED9;
	Sun, 14 Jan 2024 16:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D58D60ED9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43B081BF41F
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 16:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3436160648
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 16:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3436160648
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P8lJxo0gwwRK for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 16:43:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 633486058B
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 16:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 633486058B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5193583233; Sun, 14 Jan 2024 16:43:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 17:39:02 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: f092de882dd9a87723842272fb33078e57f1cea9
X-Git-Newrev: 89b9a7d38b59803809a43cf1908366f78a2c303a
X-Patchwork-Hint: ignore
Message-Id: <20240114164315.5193583233@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/pipewire: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=89b9a7d38b59803809a43cf1908366f78a2c303a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
index f71979db22..c3e7514984 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -216,7 +216,7 @@ else
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
