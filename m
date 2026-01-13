Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FB1D30CC2
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D03F40D2D;
	Tue, 13 Jan 2026 20:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7S7CJMYCFKDb; Tue, 13 Jan 2026 20:59:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1025640CB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337970;
	bh=7skSIlRMT4y5A6FgKf7qY+VravHHEoYkNPqdJat7gfQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PR+Ng/RApnobWHk0C5h2U74F0jcGROINiUraZS2HaqDv1Mxz+WRLTuT1nzCcdX0Is
	 bUvFJaTZGEi4Kk2yAo44yQwBaf9GgkM27Bt+3dthZQJQbgKKaOukR/wrOAga2y8O2W
	 T8+sMFEbgEAsNMDpSbJxq/r8+135qTs1YB9KjDAW+kKMlkQXypWltyj52RWHSj5Z4w
	 QoYVBtnAk2kLCsmLGrC5sRuvytntE1gWAxOYktS+mwLY/Vljme59VCJ/G4nPJcbrvV
	 E6YHnRsTm+6m2CGzIPa+0POn52d35Txq5qHNni0uRrE5PWRFc+TySzsyQ9Yq6RZnmW
	 aqmKOSI+fZZvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1025640CB7;
	Tue, 13 Jan 2026 20:59:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10D681CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5CDE407C7
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cvZvwnGcqdBR for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFE034078B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFE034078B
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCD99819E3; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22890ed8f0e663688f5a2e9faeb08954bfed1fbf
X-Git-Newrev: 7ff11fc71f57fca3dcfafbbb9fede30c174dccd8
X-Patchwork-Hint: ignore
Message-Id: <20260113205846.BCD99819E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libSM: bump version to
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ff11fc71f57fca3dcfafbbb9fede30c174dccd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2025-March/003592.html
https://lists.x.org/archives/xorg-announce/2024-December/003569.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/lib/libsm/-/commit/e0628f5ca2168a413b8b39f20ec62ae4f725bc63

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libSM/xlib_libSM.hash | 8 ++++----
 package/x11r7/xlib_libSM/xlib_libSM.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libSM/xlib_libSM.hash b/package/x11r7/xlib_libSM/xlib_libSM.hash
index 3068c85b93..63a2684742 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.hash
+++ b/package/x11r7/xlib_libSM/xlib_libSM.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003307.html
-sha256  fdcbe51e4d1276b1183da77a8a4e74a137ca203e0bcfb20972dd5f3347e97b84  libSM-1.2.4.tar.xz
-sha512  7f1d41b7b6c5dd456c49ccad7740c3ba9791a2793fa50fd94814a4164ce2e20c4a0a0ad42a87708e494ed5c23f611be6d3ccd9ef1e9add6d46ac545e2b0f6f86  libSM-1.2.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-March/003592.html
+sha256  be7c0abdb15cbfd29ac62573c1c82e877f9d4047ad15321e7ea97d1e43d835be  libSM-1.2.6.tar.xz
+sha512  e544a1dc49a03390f76af35837bfd01f749b806d88d3ee806f20311c47ff53d0aeea4744feb875958031b17d50b57a89dcc41d81241c09333c88b268c44653a7  libSM-1.2.6.tar.xz
 # Locally computed
-sha256  af7926a14d85ad367622688636e8c9c6f7807c8a6867536af1c530b5c262bfba  COPYING
+sha256  136fb258a67a2810302c6cd99525b068e6f875b8f1031a93b34edad3ffc740a5  COPYING
diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
index 8e5c90127a..6e3c59796f 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.mk
+++ b/package/x11r7/xlib_libSM/xlib_libSM.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBSM_VERSION = 1.2.4
+XLIB_LIBSM_VERSION = 1.2.6
 XLIB_LIBSM_SOURCE = libSM-$(XLIB_LIBSM_VERSION).tar.xz
 XLIB_LIBSM_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBSM_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
