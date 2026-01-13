Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEF7D30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9071F40DCB;
	Tue, 13 Jan 2026 21:00:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tfaXZUnCAX98; Tue, 13 Jan 2026 21:00:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2B6140DCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338004;
	bh=Q2QnTwk8GP69X/bjKEPDfpI0kkAh7LbJK8s6ssqd+gw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q7XaqFGVMFCVQVnmkJwaa5aj7sOg2nipdJ+HI+jGV2etxIt0+oaxGm/pXwF+/XlyV
	 U5MkS7aGOPshe1yAZgzxHhD01qgBks7uVJ2hRPuRGIunt78KkdykXHSD1TZmFXe1Pr
	 kkSxIBrOevlfEKyh4/cNN6KiIRBwAxgum1eeoYqUlZ0sJ3Gva6QvGIhIcmJayeQt0E
	 ZPWrlGUlY26fm/R/ww0B9WHMsdDlHcdxNX1CTe6Xjq46sjGr1n3r1sHvEmgdQ8cy40
	 gns67dM/2xZS9Bk2Rd+PfjO8A7UQK+zPhgBo8heW84ga2vQHbQUnn2KOtOIDcBmDpD
	 wIoh90xW9uRMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2B6140DCA;
	Tue, 13 Jan 2026 21:00:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B98891CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1683407B3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kw404VgkYOWJ for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F2A44076C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F2A44076C
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D7E182242; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5fe3770c8ec7a7ce6b0e863cfa804ad68e2f4fd
X-Git-Newrev: 6576a349bf06e5eb2a8200520ba9e4907af66be1
X-Patchwork-Hint: ignore
Message-Id: <20260113205848.3D7E182242@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xwud: bump version to
 1.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=6576a349bf06e5eb2a8200520ba9e4907af66be1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-October/003537.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xwud/xapp_xwud.hash | 6 +++---
 package/x11r7/xapp_xwud/xapp_xwud.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xwud/xapp_xwud.hash b/package/x11r7/xapp_xwud/xapp_xwud.hash
index c47d6d881e..45bfe2710e 100644
--- a/package/x11r7/xapp_xwud/xapp_xwud.hash
+++ b/package/x11r7/xapp_xwud/xapp_xwud.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003179.html
-sha256  64048cd15eba3cd9a3d2e3280650391259ebf6b529f2101d1a20f441038c1afe  xwud-1.0.6.tar.xz
-sha512  a7b964d9ef13e4726b2ef84dcc1040cdf510c8031c3e6e1dc1c711e65d9e56f1fc5921a7af3dbbd898b861c79e9da6242da23c2e73816e39152ae719052293e9  xwud-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-October/003537.html
+sha256  e55cbedab36d7a5f671abf8e594888afc48caa116d51d429ea53ea317ec0c61e  xwud-1.0.7.tar.xz
+sha512  3c910fc170f6f6373d426aa5532bd3ede6d83efab06a77c3a43a92aa9cfae9a5324d5a6ca1dfcc8941be6895b6769b3a7beee8081815000b57f93aa1b4e7c420  xwud-1.0.7.tar.xz
 # Locally computed
 sha256  be3db9aa060c462490a8c1ed44a4d059b32bba359f4688b1ecf3f794d363539e  COPYING
diff --git a/package/x11r7/xapp_xwud/xapp_xwud.mk b/package/x11r7/xapp_xwud/xapp_xwud.mk
index 0ad001d970..8926576acf 100644
--- a/package/x11r7/xapp_xwud/xapp_xwud.mk
+++ b/package/x11r7/xapp_xwud/xapp_xwud.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XWUD_VERSION = 1.0.6
+XAPP_XWUD_VERSION = 1.0.7
 XAPP_XWUD_SOURCE = xwud-$(XAPP_XWUD_VERSION).tar.xz
-XAPP_XWUD_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XWUD_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XWUD_LICENSE = MIT
 XAPP_XWUD_LICENSE_FILES = COPYING
 XAPP_XWUD_DEPENDENCIES = xlib_libX11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
