Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F8FFC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:11:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A84261075
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A84261075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 440D2402CD;
	Mon,  8 Nov 2021 16:11:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kj1LgghSd_sd; Mon,  8 Nov 2021 16:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 615DA40154;
	Mon,  8 Nov 2021 16:10:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 924BE1BF868
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27697402F3
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jEGfDTnnCbNa for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 16:07:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D8A7402F6
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 16:07:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B646D8B6D5; Mon,  8 Nov 2021 16:03:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 16:10:06 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 4efa622580e7a0eb1845893ee3e5e723856f11b5
X-Git-Newrev: e69735f48a3bf1c50106710551765f32ec49bd96
X-Patchwork-Hint: ignore
Message-Id: <20211108160323.B646D8B6D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/espeak: don't
 override dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=e69735f48a3bf1c50106710551765f32ec49bd96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Don't override ESPEAK_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 70195ea004214d468487b830b041cba772dd0609)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/espeak/espeak.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/espeak/espeak.mk b/package/espeak/espeak.mk
index aa0b5b0716..347fcb607d 100644
--- a/package/espeak/espeak.mk
+++ b/package/espeak/espeak.mk
@@ -13,11 +13,11 @@ ESPEAK_LICENSE_FILES = License.txt
 
 ifeq ($(BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA),y)
 ESPEAK_AUDIO_BACKEND = portaudio
-ESPEAK_DEPENDENCIES = portaudio
+ESPEAK_DEPENDENCIES += portaudio
 endif
 ifeq ($(BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_PULSEAUDIO),y)
 ESPEAK_AUDIO_BACKEND = pulseaudio
-ESPEAK_DEPENDENCIES = pulseaudio
+ESPEAK_DEPENDENCIES += pulseaudio
 endif
 
 define ESPEAK_EXTRACT_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
