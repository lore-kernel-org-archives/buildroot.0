Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E8FD43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5427D8239A;
	Thu, 11 Dec 2025 19:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ir5A4IIFgqF4; Thu, 11 Dec 2025 19:27:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C2CB82410
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481279;
	bh=r8rQ/p6/1tdVfRE3Bsb1KCnAyuulUNHiClGzrz3ihuY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZkbhllPKmdQZhreV8xznI+KaUkmlAKPaVCMbrnVQV4DeARwXp2n1G4DeK9hMM3u1s
	 ycKuLpJIm3C44JmVsAmmTDfnfWvDjIwgH+/bPSmebd+RvNkvSdeLRRTvEVurcC71sU
	 snvY9VRBGkSdKV7EM/7QjEiRzyX/ICDAOQX7XFa7L6TzdhZG+b2IQh8zPU8LK225/G
	 1FRLjWgYmmBtl4y6BNrNlPiHJspDrzQsgJulPtUOkq+hjA+ycx5Li5R94Ppsq1pAks
	 bgww0+laE7IZM9Sz/MF7GWqPL+tLthpo7jOsdQi/qoPfGnj/+dYBXNDDub8AQCtvZF
	 NPHIhJTwPJ2Qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C2CB82410;
	Thu, 11 Dec 2025 19:27:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8019B2C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71AA960087
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0HZ6Zou5AYx for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C17516072C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C17516072C
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B36CC86B4C; Thu, 11 Dec 2025 19:27:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:21:47 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cc1ddb77fe8ce50ce650363f4839c5994c0d81bf
X-Git-Newrev: 64f6f2d06ef7e56c72438117de0e644b15cde1b8
X-Patchwork-Hint: ignore
Message-Id: <20251211192746.B36CC86B4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/xwayland:
 security bump to version 24.1.9
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=64f6f2d06ef7e56c72438117de0e644b15cde1b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes the following security issues:

1) CVE-2025-62229: Use-after-free in XPresentNotify structures creation

    Using the X11 Present extension, when processing and adding the
    notifications after presenting a pixmap, if an error occurs, a dangling
    pointer may be left in the error code path of the function causing a
    use-after-free when eventually destroying the notification structures
    later.

    Introduced in: Xorg 1.15
    Fixed in: xorg-server-21.1.19 and xwayland-24.1.9
    Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/5a4286b1
    Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiative.

2) CVE-2025-62230: Use-after-free in Xkb client resource removal

    When removing the Xkb resources for a client, the function
    XkbRemoveResourceClient() will free the XkbInterest data associated
    with the device, but not the resource associated with it.

    As a result, when the client terminates, the resource delete function
    triggers a use-after-free.

    Introduced in: X11R6
    Fixed in: xorg-server-21.1.19 and xwayland-24.1.9
    Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/99790a2c
         https://gitlab.freedesktop.org/xorg/xserver/-/commit/10c94238
    Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiative.

3) CVE-2025-62231: Value overflow in Xkb extension XkbSetCompatMap()

    The XkbCompatMap structure stores some of its values using an unsigned
    short, but fails to check whether the sum of the input data might
    overflow the maximum unsigned short value.

    Introduced in: X11R6
    Fixed in: xorg-server-21.1.19 and xwayland-24.1.9
    Fix: https://gitlab.freedesktop.org/xorg/xserver/-/commit/475d9f49
    Found by: Jan-Niklas Sohn working with Trend Micro Zero Day Initiative.

https://lists.x.org/archives/xorg-announce/2025-October/003635.html

Changelog:
https://lists.x.org/archives/xorg/2025-October/062148.html

Also update the COPYING hash for a change of copyright year.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
[Peter: Mark as security bump, extend commit message, fix COPYING hash]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e11cac64a27d3be4a9cb7f1313276e6f386bb6e8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/x11r7/xwayland/xwayland.hash | 8 ++++----
 package/x11r7/xwayland/xwayland.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
index 6cbbea8af5..0d1df29b43 100644
--- a/package/x11r7/xwayland/xwayland.hash
+++ b/package/x11r7/xwayland/xwayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg/2025-June/062066.html
-sha256  c8908d57c8ed9ceb8293c16ba7ad5af522efaf1ba7e51f9e4cf3c0774d199907  xwayland-24.1.8.tar.xz
-sha512  b6dcc87f5c4d880cb23216518171a704c2a501803ac2efd9d01760895d755a617cd82313c6516f27a888b0581c64d74e3f8db5c238e1ae0d13da6cc1a547c02f  xwayland-24.1.6.tar.xz
+# From https://lists.x.org/archives/xorg/2025-October/062148.html
+sha256  f297af27a84508db9b80d1cbbcc69c3801da38eb64c72f3b5b50f582459afdd0  xwayland-24.1.9.tar.xz
+sha512  7438a572651dc77c1fd749879abccdc9a245c7b75143668d5561a8e99d41063f042a8eb3f9b931a2a12be1fc3cb9d197eee6794d0702a19e56c20f55acb35a26  xwayland-24.1.9.tar.xz
 
 # Locally calculated
-sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
+sha256  abbb7969df55e399e91104ded4d0a20a1b67de7c01138e63d61b7ed4f81fec0d  COPYING
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index e3b6727c19..59d607fb5b 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XWAYLAND_VERSION = 24.1.8
+XWAYLAND_VERSION = 24.1.9
 XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
 XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XWAYLAND_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
