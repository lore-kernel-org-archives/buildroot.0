Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06246D30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0A1740D9B;
	Tue, 13 Jan 2026 21:00:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0sJsu-A09eP; Tue, 13 Jan 2026 21:00:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEBB740DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338017;
	bh=lSmAUHB/SMhp7FMNlnSTXg5+MS75YqEI/YSRiUBGwHk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J8XKagmodaC4HXKwzIOxFWgDXv0AKQLcMCRLpDq87jJjIsngj7lbCLXIvAUWxaBnS
	 7dJTI7qw2gjJL3Hmj6+fzuyUtdxjnIWPYqs3gMTCf+B0oj6nmGu1LjZBeaLc1ZNk9N
	 6kGS9L+L1rJYrctNLDu7hRXzf2ZQ9pcjtnEl7fxHNmDhHMgY6BXB9jLsdgA1lUBvxk
	 BVaeSHHaGeKjiHGx71ez8ORhAxDWfFenOixWPhYLB0G5mJy+L926AxgNGUIK6YykGO
	 mAqEdKBDKo9b5OSGUCNDpFgVxJThJCOjeCaZo7uwdGwJlirTkSOGkRBBbKSMntek5m
	 DHsb9e0kEi9yA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEBB740DF9;
	Tue, 13 Jan 2026 21:00:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 36F2F1CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7EF2407BC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gaD8SpQIMxVM for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB3FC407CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB3FC407CA
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9AFA81124; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 016e6041c012e32bc936c09b46f8a740c0aa8f3d
X-Git-Newrev: bf3c39af3423e38f80b09ddde4dcc6efe2c039bf
X-Patchwork-Hint: ignore
Message-Id: <20260113205849.C9AFA81124@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_listres: bump version
 to 1.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf3c39af3423e38f80b09ddde4dcc6efe2c039bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-March/003470.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_listres/xapp_listres.hash | 6 +++---
 package/x11r7/xapp_listres/xapp_listres.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_listres/xapp_listres.hash b/package/x11r7/xapp_listres/xapp_listres.hash
index 30fccec9d3..ae3e733c74 100644
--- a/package/x11r7/xapp_listres/xapp_listres.hash
+++ b/package/x11r7/xapp_listres/xapp_listres.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003142.html
-sha256  ce2a00bbe7d2eb8d75177006f343c80443a22d52570c48a43c6fe70ea074dc9d  listres-1.0.5.tar.xz
-sha512  caa3626773031fbf6d8bcc1f697afe6add64fe4a8d1d766c42d5c2346050869dd23a26a1718411134ab05c75835facf0786cab5595721a16df423cdc54dd813d  listres-1.0.5.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003470.html
+sha256  4d1c53efd69ba654f2877e1577e994c78874b0512fa1b0666cffcf452aee43ca  listres-1.0.6.tar.xz
+sha512  182919c8ba5569af3dbf59421de2dfd3e755b3bd2d6d548c6d2664c20b73f937e64dc73811821c19af93fffbc2d5c8d2db8d9cdd9bf1b93b0f29cb683e13ebe7  listres-1.0.6.tar.xz
 # Locally computed
 sha256  aefb540c54bc95c68702cd2ae668c559e63cc1a84f55ae5c0e78547e7d75d2d5  COPYING
diff --git a/package/x11r7/xapp_listres/xapp_listres.mk b/package/x11r7/xapp_listres/xapp_listres.mk
index e0d7487f68..e2585a3d98 100644
--- a/package/x11r7/xapp_listres/xapp_listres.mk
+++ b/package/x11r7/xapp_listres/xapp_listres.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_LISTRES_VERSION = 1.0.5
+XAPP_LISTRES_VERSION = 1.0.6
 XAPP_LISTRES_SOURCE = listres-$(XAPP_LISTRES_VERSION).tar.xz
-XAPP_LISTRES_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_LISTRES_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_LISTRES_LICENSE = MIT
 XAPP_LISTRES_LICENSE_FILES = COPYING
 XAPP_LISTRES_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xlib_libXt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
