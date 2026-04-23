Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C48FED3F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED9DD42976;
	Fri, 24 Apr 2026 16:38:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c62q9jwsvEwn; Fri, 24 Apr 2026 16:38:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D98D542964
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048714;
	bh=lNAi8Lh3WefLjKDKvoWLqF464dGI67zllLntj+G2eKU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CVQ+NjuGVf2tlWwIbMThqzgobpwqyu060kgYEiUbmXgbshLBqL3y4gCq79g4Bkc6r
	 GupWJc0/xiYeApq05ShfdO617asHgvNLx0AfhokqSgpCdmNQE34D+w8Ox8JJ4mLBtS
	 U49DgF8PqF2OiDevUNP//BXisglzJ76jQjKBPD2g5bH37CN2MZI8r73lUKybkWhRXN
	 M4ePZb99HdU6+lB3FTIwRuG5wqI/OeVzCfmKi3yaEtDG8922bQ+Q7/PNi2Pg51UeRu
	 /jdXNCyLgIDv6a3WrFnm2/UJWyFWPuSBeX+y8/fPtuY1RP4nC+hGqt3RodcuTBrwk0
	 89o9Q7/jaUQrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D98D542964;
	Fri, 24 Apr 2026 16:38:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D2F624D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59455423E6
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eBQiN3ynLFnK for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84CFC423E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84CFC423E9
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E7DE82B2E; Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 14:16:36 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: ed0266aa51462adecc70c3d5a12ad52919dc4033
X-Git-Newrev: 460d0ebf95e0197d36a5b5812aa01d3dbffbeca9
X-Patchwork-Hint: ignore
Message-Id: <20260424163825.2E7DE82B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/x11r7/xwayland:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/460d0ebf95e0197d36a5b5812aa01d3dbffbeca9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
index 98bc74200a..8fa5260f47 100644
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
