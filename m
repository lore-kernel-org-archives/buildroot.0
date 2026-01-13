Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFA4D30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 342C361077;
	Tue, 13 Jan 2026 21:00:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqu7Dlm69bAg; Tue, 13 Jan 2026 21:00:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 359BB61063
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338037;
	bh=ciEG8ROO9H76+cShsaWiPgomvamvag8bU5wGIVVrDdE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eNNlmB/RoUhtshzS+1PcHtcjoTdQjPDhVZke/Ab4QUZTkODfIuNa0rQBq+tSROuy6
	 wQ9yJbW59K/RvNPulfKcZfdt2dKxlFdvd1PkuAwVvNHDubuJUkS3Fy/sn7pgL8TNCE
	 undNt8csdjovw3qyjdLXi7fRmy1DwZSWJRsYTSdCRZFnwHSKIINOfvqXjYhrMiMH4v
	 C9V6Yto/yWwnaf3bu4dEPb5PEN4/0OS2AFIheLTA+hrPOPNCdj7ntcrxrraMxN0lix
	 nCAF827W1+IBuCnibSSfXFjLBhdCKLq44TfBNTL2eFQltg51Qe9rC5D38N0C+hMoRD
	 VNb9H+do7kVpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 359BB61063;
	Tue, 13 Jan 2026 21:00:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D37311CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 21:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3639407CD
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7b6AlJveIXLm for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37B44407D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37B44407D1
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35B1680E26; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 789649b2880a91930d0f90e012cea630e390da32
X-Git-Newrev: 025a32d63b7927da9c2098d1b3a0f0a3704bbbdb
X-Patchwork-Hint: ignore
Message-Id: <20260113205850.35B1680E26@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xmore: bump version to
 1.0.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=025a32d63b7927da9c2098d1b3a0f0a3704bbbdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-February/003451.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/xmore/-/commit/f1d979d7a304113ab5df35971c440e6a76761ad9

Switched tarball to xz.

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xmore/xapp_xmore.hash | 10 ++++------
 package/x11r7/xapp_xmore/xapp_xmore.mk   |  6 +++---
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xapp_xmore/xapp_xmore.hash b/package/x11r7/xapp_xmore/xapp_xmore.hash
index 960a1e5f92..5ebf7473f4 100644
--- a/package/x11r7/xapp_xmore/xapp_xmore.hash
+++ b/package/x11r7/xapp_xmore/xapp_xmore.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002964.html
-md5  8e1279352192e4142740c21db58f9be9  xmore-1.0.3.tar.bz2
-sha1  b57b92afd783d28c4c505e0c95556939f24c3ec9  xmore-1.0.3.tar.bz2
-sha256  644a1e0d5182d7708d413722d0579a587dc56b9a8cb60640df076d302e09251b  xmore-1.0.3.tar.bz2
-sha512  e3e44831cd87a54bb585f80ef0d87f69dc35f6c834a73241aad9f6e2b0999b53c51a0a3f915a94ae4d6dc9bdfb9f60b6576f0bdcec441443abd98efa6c51b1d3  xmore-1.0.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2024-February/003451.html
+sha256  7eb560dbc1de4e43c64fe491ad73907a29d734cca82a9ad82c7d3feb9cdb0a9a  xmore-1.0.4.tar.xz
+sha512  52ac9bca78431f5f830b4607ff2cc375ab90e11380e0d4d3e591689359806cc7c7ec92c713d4d65742f40407e4f407c372759e5d03e30a30dfd866e6d5c6f6f7  xmore-1.0.4.tar.xz
 # Locally computed
-sha256  27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
+sha256  eaba8f94ecdc70f7d0f7a7c44544abd198f8ef034d1c45d3b915d52194f3ee3f  COPYING
diff --git a/package/x11r7/xapp_xmore/xapp_xmore.mk b/package/x11r7/xapp_xmore/xapp_xmore.mk
index f8a3ba8c1f..ac58ce35d3 100644
--- a/package/x11r7/xapp_xmore/xapp_xmore.mk
+++ b/package/x11r7/xapp_xmore/xapp_xmore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XMORE_VERSION = 1.0.3
-XAPP_XMORE_SOURCE = xmore-$(XAPP_XMORE_VERSION).tar.bz2
-XAPP_XMORE_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XMORE_VERSION = 1.0.4
+XAPP_XMORE_SOURCE = xmore-$(XAPP_XMORE_VERSION).tar.xz
+XAPP_XMORE_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XMORE_LICENSE = MIT
 XAPP_XMORE_LICENSE_FILES = COPYING
 XAPP_XMORE_DEPENDENCIES = xlib_libXaw
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
