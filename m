Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F46BC433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:22:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2892560187
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2892560187
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03FB3407B8;
	Fri,  5 Nov 2021 16:22:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rm8m3uDywha0; Fri,  5 Nov 2021 16:22:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 563F7407B0;
	Fri,  5 Nov 2021 16:22:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B9781BF2A5
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7CFB61585
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:20:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wdqdHy7Ach3C for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 16:20:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 251AC6173C
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 16:20:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6057D8A6B0; Fri,  5 Nov 2021 16:16:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 17:19:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5253000213b77e265cbf88c56c1d6a1fd9d3aa2
X-Git-Newrev: 2e0bebe9e6c0288db65eb8f08fb775c930e2ceeb
X-Patchwork-Hint: ignore
Message-Id: <20211105161640.6057D8A6B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libinput/libinput.mk: fix libx11
 dependency typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e0bebe9e6c0288db65eb8f08fb775c930e2ceeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libx11 -> xlib_libX11

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libinput/libinput.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 682209262e..055c4fc7a0 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -24,7 +24,7 @@ ifeq ($(BR2_PACKAGE_WAYLAND_PROTOCOLS),y)
 LIBINPUT_DEPENDENCIES += wayland-protocols
 endif
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
-LIBINPUT_DEPENDENCIES += libx11
+LIBINPUT_DEPENDENCIES += xlib_libX11
 endif
 else
 LIBINPUT_CONF_OPTS += -Ddebug-gui=false
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
