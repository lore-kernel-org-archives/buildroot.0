Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB10CC433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:21:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83AA361245
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83AA361245
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 549C24076F;
	Fri,  5 Nov 2021 16:21:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GmF5FP_mosXe; Fri,  5 Nov 2021 16:21:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8F1F4073E;
	Fri,  5 Nov 2021 16:21:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C94791C1162
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B944D40770
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:20:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RJCetZYCgIyW for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 16:20:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F20D40763
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 16:20:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4D6D28AC58; Fri,  5 Nov 2021 16:16:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 17:19:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c82676211ee57b238ce688fa5753ae23f368d08
X-Git-Newrev: 70195ea004214d468487b830b041cba772dd0609
X-Patchwork-Hint: ignore
Message-Id: <20211105161640.4D6D28AC58@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/espeak: don't override dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=70195ea004214d468487b830b041cba772dd0609
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't override ESPEAK_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
