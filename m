Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8A0FED3F0
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B60984D95;
	Fri, 24 Apr 2026 16:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Y9Asu81kQUc; Fri, 24 Apr 2026 16:25:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B44AC84D85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777047947;
	bh=5pg035/QJd5+I49O7WwtWE2gTPLWoY+VEj9JZA0eBkE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cyhAnkdf9ZWQHMwxh05pGJNx6rmnQWfqm9Qn+dprELA4IzRNzXlf8YjEb/wyMjLzS
	 wgY8cllhmkujuFHcqP9X+Yu1mPOPKKaPBszbZ9Gvy12WRQIuAtfCQ3bmnuSoROsmBd
	 oUNu8sdueE9tLqx5HSuCrwlSLMhhzJygfwZ3TRvGL92SRW8nciVbEMbTvyHNbb+FuE
	 DZ5Jpp6DNgFXlHq6jWsKB6/7XLWBgc5TOeyOj+4mT0CyrGWunLFBPantjcahjlRqJf
	 ibTVi44UGU6W9zcS8g7tHSawpQ5Ipv/JXw6/YXuPfeqXvXQ6gkHiwIft9nXl98uR3m
	 XSegsyX78kqIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B44AC84D85;
	Fri, 24 Apr 2026 16:25:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 65600206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 542AF61C31
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_GPub750V6C for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D5BA61C32
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D5BA61C32
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3555682AFB; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:20:43 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1b019bf8de0a29b8cf8083b8a090f3ad2bc26150
X-Git-Newrev: d7f6575d2663d8b69ec39a20b1f1f23db9a60b18
X-Patchwork-Hint: ignore
Message-Id: <20260424162539.3555682AFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/x11r7/xwayland:
 security bump version to 24.1.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d7f6575d2663d8b69ec39a20b1f1f23db9a60b18
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://lists.x.org/archives/xorg-announce/2026-April/003679.html

Updated license hash due to upstream commits:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/e5c6a5ab905e0158ec22877b4117f10bef6e4140
https://gitlab.freedesktop.org/xorg/xserver/-/commit/89f82cce4a4ca480501c130231968a72cafa952d

Fixes the following CVEs:

* CVE-2026-33999: XKB Integer Underflow in XkbSetCompatMap()
* CVE-2026-34000: XKB Out-of-bounds Read in CheckSetGeom()
* CVE-2026-34001: XSYNC Use-after-free in miSyncTriggerFence()
* CVE-2026-34002: XKB Out-of-bounds read in CheckModifierMap()
* CVE-2026-34003: XKB Buffer overflow in CheckKeyTypes()

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 40f8603e6a3c1c027ee80073a25a5853e03eb822)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/x11r7/xwayland/xwayland.hash | 8 ++++----
 package/x11r7/xwayland/xwayland.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
index 0d1df29b43..ba84d20b9f 100644
--- a/package/x11r7/xwayland/xwayland.hash
+++ b/package/x11r7/xwayland/xwayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg/2025-October/062148.html
-sha256  f297af27a84508db9b80d1cbbcc69c3801da38eb64c72f3b5b50f582459afdd0  xwayland-24.1.9.tar.xz
-sha512  7438a572651dc77c1fd749879abccdc9a245c7b75143668d5561a8e99d41063f042a8eb3f9b931a2a12be1fc3cb9d197eee6794d0702a19e56c20f55acb35a26  xwayland-24.1.9.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-April/003679.html
+sha256  459762be8ea046c94386687d77a87add6073868bee14f02913eafebb945b7aa0  xwayland-24.1.10.tar.xz
+sha512  bceba1db7f4d7ac92d2b2a3c8f6f7ab0cc093f396fe89406f8dba25e32ffc3edfa552df246cbfb3b0708c1d28b3e179694d11870b063d5b8f9ab2db9fb861a8f  xwayland-24.1.10.tar.xz
 
 # Locally calculated
-sha256  abbb7969df55e399e91104ded4d0a20a1b67de7c01138e63d61b7ed4f81fec0d  COPYING
+sha256  c9f90a6669109aad6c9a7c3b46cc2c574221a73b792afa419336816b49da5c11  COPYING
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 59d607fb5b..ef96a9b75e 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XWAYLAND_VERSION = 24.1.9
+XWAYLAND_VERSION = 24.1.10
 XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
 XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XWAYLAND_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
