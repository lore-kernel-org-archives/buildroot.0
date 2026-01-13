Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED761D30CC0
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE59960D87;
	Tue, 13 Jan 2026 21:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2EU4HS6taZyF; Tue, 13 Jan 2026 21:00:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE8AE6104B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338028;
	bh=ptA2LheOITYMAW0WY6/8kKrEf26NNsNaKWWDv3taRlE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B1/u5llIfZGxIARyygCCyUsD7pndbFXd9kKWQl4Ic+uua8NVY/xbnSFa7YJoMCCsU
	 +X9/rBWQ4IsLsD72DvcZOyPpWPDyFqNJ41dE1i4NXYZLL33s5EUXnedfcGIPdNMn7v
	 jeVqdcpyJRtdbMjlZkh6Bn2TceB5EjVfTq06r28nXV9UQgzc63B1p4KgrY/8ST1vXQ
	 ppYLntF45Jpm7/K1pJh7Qj5Y+3MBEtgeRMn4afZjh5QkWFd9MnScGYNKxZ+RuliUZe
	 Oi0p+gkI4x79duOrYzGLMMknLBHG0DTjtEP3gGZSRVBMGyOcUc/haw2oMUSYj8ANtp
	 ww7m12JNSLPCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE8AE6104B;
	Tue, 13 Jan 2026 21:00:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BE7C231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 21:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BCCF407AF
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GuoOLo5j7NEt for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACF934078B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACF934078B
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB31A81382; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4dbca7a9ce6da2ad953194f14bd557f23b386e9
X-Git-Newrev: 86177c0682990ea99497bfb58102130842d0f9ac
X-Patchwork-Hint: ignore
Message-Id: <20260113205849.AB31A81382@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xev: bump version to
 1.2.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=86177c0682990ea99497bfb58102130842d0f9ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-March/003473.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xev/xapp_xev.hash | 6 +++---
 package/x11r7/xapp_xev/xapp_xev.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xev/xapp_xev.hash b/package/x11r7/xapp_xev/xapp_xev.hash
index 9449781360..73788a5648 100644
--- a/package/x11r7/xapp_xev/xapp_xev.hash
+++ b/package/x11r7/xapp_xev/xapp_xev.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003185.html
-sha256  c9461a4389714e0f33974f9e75934bdc38d836a0f059b8dc089c7cbf2ce36ec1  xev-1.2.5.tar.xz
-sha512  9fbfb78c9547974c2256a678948bf4a694a40b1c2bd5c5dec5f365a713e6d938c6039f055a9629f49de27f02f3d7cb912f07c035df129798a4b2ddc20febe66a  xev-1.2.5.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003473.html
+sha256  61e1c5e008ac9973aca7cdddf36e9df7410e77083b030eb04f4dc737c51807d7  xev-1.2.6.tar.xz
+sha512  aaabb635622abfbf0b7ef2a1978070a918ea94480f375dd0798375274cf378ddb25007cc42426bb2292ed65c8af922f88e6a04c5a2f6cff3fadb0194b53eb7e7  xev-1.2.6.tar.xz
 # Locally computed
 sha256  9b840f2e1900889124cc999f3158da2b6b07bf6d0d77bdbb01ce65d2e702dc83  COPYING
diff --git a/package/x11r7/xapp_xev/xapp_xev.mk b/package/x11r7/xapp_xev/xapp_xev.mk
index 0f29a731e7..9e1fd42302 100644
--- a/package/x11r7/xapp_xev/xapp_xev.mk
+++ b/package/x11r7/xapp_xev/xapp_xev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XEV_VERSION = 1.2.5
+XAPP_XEV_VERSION = 1.2.6
 XAPP_XEV_SOURCE = xev-$(XAPP_XEV_VERSION).tar.xz
-XAPP_XEV_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XEV_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XEV_LICENSE = MIT
 XAPP_XEV_LICENSE_FILES = COPYING
 XAPP_XEV_DEPENDENCIES = xlib_libX11 xlib_libXrandr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
