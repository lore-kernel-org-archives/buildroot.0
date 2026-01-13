Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F068FD30CC2
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C471A60D8F;
	Tue, 13 Jan 2026 20:59:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XjlZhaHy2cDw; Tue, 13 Jan 2026 20:59:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE5C160E1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337967;
	bh=SvyKnrvcvhEDo+u/C3QTD7rlTDCOZigZM/Bjm+jVNxQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ayTJvJb9maPdq/CfSqBPdncsBKoku17A30C+uKe+e6FZpB64J5HP0WIK5A4qNBDx/
	 UX5jaUSVSwRZCZMPi9ltCp4mORVEH8ot+AmRpUVYAOENDBgxmg2QgThwJjBIkNG2HI
	 k9/u/0FTjf6/Z0Fa44mt7Uq2fME5rfwp0FTj/md/Is4jtHyh5pNqrXCwdR8rtC/28Q
	 L4IKIdVmZT7OXUBEKAD+9WNGyFa5M99K4z5wq4bWqeK4xLc7u5bti352RmU4icIsBj
	 cuZAx4bZLx2rAGJtyMHixjtiWKEu6xJAM8p4V5rep4xWcsGa5tanHs/uRExljADPyp
	 M/NqqyXS03jFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE5C160E1E;
	Tue, 13 Jan 2026 20:59:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64068231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91A32407C5
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NgAp9DjOAjnr for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B522A40759
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B522A40759
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B37BD88573; Tue, 13 Jan 2026 20:58:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f824e8fcb64ab6a8a2ada313ccfee70debf7de2d
X-Git-Newrev: 7ae757762c32b5a3d0cd259fc196f9d8d515f168
X-Patchwork-Hint: ignore
Message-Id: <20260113205845.B37BD88573@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXpresent: bump
 version to 1.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ae757762c32b5a3d0cd259fc196f9d8d515f168
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2025-September/003627.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libXpresent/xlib_libXpresent.hash | 6 +++---
 package/x11r7/xlib_libXpresent/xlib_libXpresent.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libXpresent/xlib_libXpresent.hash b/package/x11r7/xlib_libXpresent/xlib_libXpresent.hash
index e7f6ac9e5a..ae0dc6916d 100644
--- a/package/x11r7/xlib_libXpresent/xlib_libXpresent.hash
+++ b/package/x11r7/xlib_libXpresent/xlib_libXpresent.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003225.html
-sha256  b964df9e5a066daa5e08d2dc82692c57ca27d00b8cc257e8e960c9f1cf26231b  libXpresent-1.0.1.tar.xz
-sha512  a4551f49a68f4487eb70dc5b50b7f745fbc8b6842cfa60422afe3834af41c504a37bcfddb4e7e9ee084b250df256034290776c8eb7d8838e392eb626fff55d25  libXpresent-1.0.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-September/003627.html
+sha256  4e5b21b4812206a4b223013606ae31170502c1043038777a1ef8f70c09d37602  libXpresent-1.0.2.tar.xz
+sha512  7e12c386e5d1404db359f8004a141223b4c08a138a5589d087537ca667e9dd5cdc190f170a5fa991c1f8dd022896bb07bff540e262a0d30d542a3faea06d8c93  libXpresent-1.0.2.tar.xz
 
 # Locally calculated
 sha256  d64e671ffeb483d4543f98c842788ab34c77427e27d83d6b082065a4438d4885  COPYING
diff --git a/package/x11r7/xlib_libXpresent/xlib_libXpresent.mk b/package/x11r7/xlib_libXpresent/xlib_libXpresent.mk
index 4cb4fd193a..4caa0f544d 100644
--- a/package/x11r7/xlib_libXpresent/xlib_libXpresent.mk
+++ b/package/x11r7/xlib_libXpresent/xlib_libXpresent.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXPRESENT_VERSION = 1.0.1
+XLIB_LIBXPRESENT_VERSION = 1.0.2
 XLIB_LIBXPRESENT_SOURCE = libXpresent-$(XLIB_LIBXPRESENT_VERSION).tar.xz
-XLIB_LIBXPRESENT_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXPRESENT_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXPRESENT_LICENSE = MIT
 XLIB_LIBXPRESENT_LICENSE_FILES = COPYING
 XLIB_LIBXPRESENT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
