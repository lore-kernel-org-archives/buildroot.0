Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1134BD30CC2
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1D5840C33;
	Tue, 13 Jan 2026 20:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zdy0ZE7q1iTy; Tue, 13 Jan 2026 20:59:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0764640C82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337941;
	bh=7rt+vYlwUG2Pym4oJu4h795WtrXiNOYJwf8esH/jbPA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d9ytGqkkTysPKp7jZuUxZBG2tVdaB5+nDPP3yvJ3oZxihhaoPoImcEeSnc4FnYLeK
	 JMDnJXXUV/Os8kOmb2dyDc+sh4q+rG0AfkD+fwlgiSKfuch9ZoCdpn7fkPCdkDpwnw
	 Tx2KiSYa7FA2+Q39hMSbKb6yyDOzbx3H/D/MBgRg8DqLECvtAdJNL5LHUZtn2dIYrF
	 UCyaYOtga9AvTOY2nN5Tv8EEkIMXJGHxBTQG32EXLky5E8zj/f4QOi/PAkpugxSNuv
	 TwoGaOtGSriYCaRvtP+KC5sX2wLA6b4mMqVjPT/1wc4JU3aI2f4vm1fQG6OKteaJfh
	 HE599G6DPmNDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0764640C82;
	Tue, 13 Jan 2026 20:59:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 297551CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2455280839
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ApxoV0EpEKqP for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C9D080FFB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C9D080FFB
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D4D880F55; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70d7bed695fdc12f0ddaa3248e697b9cd335e81f
X-Git-Newrev: cb760e4da06b1a412e224a87853183383f722987
X-Patchwork-Hint: ignore
Message-Id: <20260113205848.5D4D880F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xkbprint: bump version
 to 1.0.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cb760e4da06b1a412e224a87853183383f722987
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-October/003535.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xkbprint/xapp_xkbprint.hash | 6 +++---
 package/x11r7/xapp_xkbprint/xapp_xkbprint.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash b/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash
index 8ca7656b5c..180216139d 100644
--- a/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash
+++ b/package/x11r7/xapp_xkbprint/xapp_xkbprint.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003222.html
-sha256  99cc9404f7b90289ae04944c0d98a208cc8b158492ad6481386e31d4d09aa7b0  xkbprint-1.0.6.tar.xz
-sha512  a1c2401b2a2ef4c6bd2efc18923ecb176adcf38b6c5dfdce25f22f1f5ab21e25f494b25dac25b1765fb9a0f6acc24d191cd41b9a098a9e3c6eaf9a9df490be29  xkbprint-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-October/003535.html
+sha256  1c4f49c030329e0defd8c7bc3739e60f2aa1d2aabe0e2d7e63740ab629aa59cc  xkbprint-1.0.7.tar.xz
+sha512  52f803ba85b053408dfff400f47ae9461954430665a12257a99b9775e26dd7192a97b979de949b9c4532936c9bfcc181a773de41514a122973f05d676dee6476  xkbprint-1.0.7.tar.xz
 # Locally computed
 sha256  79b32f28f7f5063054a564e1fdeee56f82a525b6516303704a1f70e55fe7197e  COPYING
diff --git a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
index f374c18dae..680a1d9f67 100644
--- a/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
+++ b/package/x11r7/xapp_xkbprint/xapp_xkbprint.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKBPRINT_VERSION = 1.0.6
+XAPP_XKBPRINT_VERSION = 1.0.7
 XAPP_XKBPRINT_SOURCE = xkbprint-$(XAPP_XKBPRINT_VERSION).tar.xz
 XAPP_XKBPRINT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XKBPRINT_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
