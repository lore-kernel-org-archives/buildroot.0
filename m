Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845DAD30CC2
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 589A260DC0;
	Tue, 13 Jan 2026 20:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLmnai7t4eU5; Tue, 13 Jan 2026 20:59:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 746BD60DD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337948;
	bh=lpXSJssGa0OGkalRF1ePIK1IQFpKaofqVjRAVnMEo4Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ndY3MNUBUgCtyL9iUwkhjrqbm33rgOubeR/pTPCUDJDMKrODF3pWQaHkQU361YfLs
	 6qdvHt74eTYkihEhAjq1kOeuLNojv8ybuRIEKeU3HkBzEsLiKQJRfE0KkWAmD37idZ
	 N+XVC6csL7YVAg2XO4sJc64GyIIVw50YnM/5HBF4donUS9aLRJ+KluByubBJ1wHf8e
	 mlBY3hWwE0TaNknYTkH0tmCSKYKgLjjpoVx0RLaqHwfC2Xyr8xAMtvkuYw40Brbed9
	 I+YBLpkjkMnEu5gjM5CzdADbOS31ChmqSPzCG6NxokfHeG+rFdtceaJF0r058e56jy
	 yDXjOfsUaKj6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 746BD60DD6;
	Tue, 13 Jan 2026 20:59:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 778831CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66BF481109
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oy64k0loUvtV for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A03C481195
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A03C481195
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EB2A7FCC5; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e828e6a9261d50b6729618c5e558ae95e9cbf8c1
X-Git-Newrev: b66fb7264ef4a1413c4b5dc90cc9970069b54d94
X-Patchwork-Hint: ignore
Message-Id: <20260113205850.8EB2A7FCC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-libinput:
 bump version to 1.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b66fb7264ef4a1413c4b5dc90cc9970069b54d94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-October/003543.html
https://lists.x.org/archives/xorg-announce/2023-August/003417.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash    | 6 +++---
 .../xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk      | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index cca2639dc3..2f6622ed58 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-April/003378.html
-sha256  1446ba20a22bc968b5a4a0b4dbc3b8e037c50d9c59ac75fa3f7fc506c58c1abb  xf86-input-libinput-1.3.0.tar.xz
-sha512  f81f408b37e5f98ee97337dc4da6e78449e554e0ab2a3c6791b089d2cb6d645d0206ddf9babbc2120ab8bfe3b1489314fe42503ee015cec41775024538f3a34f  xf86-input-libinput-1.3.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-October/003543.html
+sha256  2524c35f196554ea11aef3bba1cf324759454e1d49f98ac026ace2f6003580e6  xf86-input-libinput-1.5.0.tar.xz
+sha512  03090beb7c162fdf55e9bb9da41ffb8601b20047e4a53895bad27de47b3197fc920e710f26fa23e7322b367ab65fa56ba5f9a195ec69801529af3958632c2d6e  xf86-input-libinput-1.5.0.tar.xz
 # Locally computed
 sha256  4114220b281561e80f3422f0e7ae8d3e1fc85131ffc2e3b6265119e66f1adb27  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index 381df31fee..4e2f48c947 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 1.3.0
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 1.5.0
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.xz
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
