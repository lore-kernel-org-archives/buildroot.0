Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF585C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:11:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79E7F61350
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79E7F61350
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48FD9402FC;
	Mon,  8 Nov 2021 16:11:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wvJ45PaGfUcz; Mon,  8 Nov 2021 16:11:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFF06402F0;
	Mon,  8 Nov 2021 16:11:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A931E1BF868
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 682BB402F5
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yv9ImS0fo5W2 for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 16:07:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A93DF402FA
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 16:07:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id ED0E28B6D5; Mon,  8 Nov 2021 16:03:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 17:06:29 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 8a46e128eb842f890f119b7b19359192d0f88aaf
X-Git-Newrev: 8c549af8a81c05c191e2d5dd266178412556f897
X-Patchwork-Hint: ignore
Message-Id: <20211108160323.ED0E28B6D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/weston: remove
 launcher-libseat meson option
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c549af8a81c05c191e2d5dd266178412556f897
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

This option only exists in main and is not in a release.

Fixes:
output/build/weston-9.0.0/meson.build:1:0: ERROR: Unknown options: "launcher-libseat"

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0f1bce7b73204a7abb85aa629e8704e08cbd0ce9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/weston/weston.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 69ee11d23c..6dd5439291 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -26,13 +26,6 @@ else
 WESTON_CONF_OPTS += -Dsimple-clients=
 endif
 
-ifeq ($(BR2_PACKAGE_SEATD),y)
-WESTON_CONF_OPTS += -Dlauncher-libseat=true
-WESTON_DEPENDENCIES += seatd
-else
-WESTON_CONF_OPTS += -Dlauncher-libseat=false
-endif
-
 ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_SYSTEMD),yy)
 WESTON_CONF_OPTS += -Dlauncher-logind=true
 WESTON_DEPENDENCIES += dbus systemd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
