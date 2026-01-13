Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DF7D30CC4
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DA2340C4E;
	Tue, 13 Jan 2026 20:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XIIKmxpQQFq7; Tue, 13 Jan 2026 20:58:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A487940C2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337937;
	bh=QrZaY2NARON3kycQUzR8fNo/uskPWSriLrUtg6Xv9Q4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H6DrPp5d3GPfOZkOZu09y/SvQCe6jxqc9Pv21FWI1q6dBn1fV7W7s0q2Qcb/LewyP
	 JOoVybleVi8nsMeOtEoYUoogSQljCnqs5RF51IdVZhuTsTdr9X4AL2e1SNcKIlDNcP
	 9t4BWvAcpNEae+BP8gJ0CEvx7qc/u0Grq6GRWAC/4SY4/9qdg3xTh/EJccd55eDI7K
	 4wUq75qsdjTWgNkiOfvbekF0gKaYxAz1bG2FhiGsrQYjZJKGmo5c2I7kG9HAwCa4v/
	 bl4Yz0hNHSZsEYS5gImOGbD6FLMe6KPxZbVxc5ct/ScGAbLox2Xt4vWT4QJXh8Lhrx
	 03zJwRSA7ut0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A487940C2A;
	Tue, 13 Jan 2026 20:58:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6649F231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5339260D72
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xss9bRmrwo_J for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5950B60D6D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5950B60D6D
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53CD988573; Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ccb6eb87e5833b6b2324b8b65997749d1b26f22b
X-Git-Newrev: 3a6ea017acad756e5c3afd45d3b7a0e2c55eb534
X-Patchwork-Hint: ignore
Message-Id: <20260113205845.53CD988573@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xauth: bump version to
 1.1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a6ea017acad756e5c3afd45d3b7a0e2c55eb534
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2025-December/003653.html
https://lists.x.org/archives/xorg-announce/2025-March/003589.html
https://lists.x.org/archives/xorg-announce/2024-March/003472.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xauth/xapp_xauth.hash | 6 +++---
 package/x11r7/xapp_xauth/xapp_xauth.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xauth/xapp_xauth.hash b/package/x11r7/xapp_xauth/xapp_xauth.hash
index 966c3ba028..bde3c2ef9f 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.hash
+++ b/package/x11r7/xapp_xauth/xapp_xauth.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003158.html
-sha256  78ba6afd19536ced1dddb3276cba6e9555a211b468a06f95f6a97c62ff8ee200  xauth-1.1.2.tar.xz
-sha512  ac23fcd166b45abf7b030994ff3332c9906023dc1ddfa9b9d3000e6a914dc5e0213c4a2aa409cb3ddb93e1f9f4f6374376109241a95ef8c36af842de1f6f76e8  xauth-1.1.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-December/003653.html
+sha256  a4000e2f441facebf569026bedecc23ba262cc6927be52070abe0002625cfbe0  xauth-1.1.5.tar.xz
+sha512  df94b59de49ced2490351b7ab42d56d3ef92077891b8ba7a73c53b6babb1facd250d934b82f36ee1ddc355dffefb8f52914d30893c9d578711264f82e9bf3cb9  xauth-1.1.5.tar.xz
 # Locally computed
 sha256  dcdf5fa36a652efbe61a21def1301739b0010334ae3f049f1cff433221a8c7a5  COPYING
diff --git a/package/x11r7/xapp_xauth/xapp_xauth.mk b/package/x11r7/xapp_xauth/xapp_xauth.mk
index 248a66e3a0..978a20e690 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.mk
+++ b/package/x11r7/xapp_xauth/xapp_xauth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XAUTH_VERSION = 1.1.2
+XAPP_XAUTH_VERSION = 1.1.5
 XAPP_XAUTH_SOURCE = xauth-$(XAPP_XAUTH_VERSION).tar.xz
-XAPP_XAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XAUTH_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XAUTH_LICENSE = MIT
 XAPP_XAUTH_LICENSE_FILES = COPYING
 XAPP_XAUTH_DEPENDENCIES = xlib_libX11 xlib_libXau xlib_libXext xlib_libXmu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
