Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F0CC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:17:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9F6C60524
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9F6C60524
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 865FE60B4B;
	Wed,  4 Aug 2021 01:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EZ--CdhkBbEr; Wed,  4 Aug 2021 01:17:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F333E60B33;
	Wed,  4 Aug 2021 01:17:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23E391BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DC1D4057E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PeTA7xxur7G3 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:17:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30299404ED
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:17:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 765D38B451; Tue,  3 Aug 2021 21:17:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 23:16:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a484c19721f2591b41062b87356a3c7ff1c969e2
X-Git-Newrev: 53b25aa393bfefc9487b814af0f55a8a4235c3df
X-Patchwork-Hint: ignore
Message-Id: <20210803211722.765D38B451@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: add libdrm dependency
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=53b25aa393bfefc9487b814af0f55a8a4235c3df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libcamera option requires libdrm, require and depend on it
when available for libcamera plugin.

Fixes:
 - http://autobuild.buildroot.net/results/e3bc1d9aa69af1d2cdeee7709df318fccbaa5476

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pipewire/pipewire.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index b316d482d9..2317398088 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -95,9 +95,9 @@ else
 PIPEWIRE_CONF_OPTS += -Dv4l2=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_LIBCAMERA)$(BR2_PACKAGE_HAS_UDEV),yy)
+ifeq ($(BR2_PACKAGE_LIBCAMERA)$(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_HAS_UDEV),yyy)
 PIPEWIRE_CONF_OPTS += -Dlibcamera=enabled
-PIPEWIRE_DEPENDENCIES += libcamera
+PIPEWIRE_DEPENDENCIES += libcamera libdrm
 else
 PIPEWIRE_CONF_OPTS += -Dlibcamera=disabled
 endif
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
