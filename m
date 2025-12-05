Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2ED1D374A1
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 20:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1304605DD;
	Fri,  5 Dec 2025 20:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D-YynW2dM_Sr; Fri,  5 Dec 2025 20:53:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2884605EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764967981;
	bh=Czaxe3cedWk/LvRpECPPmvuL8/USbFGC2SVZU2i7x5U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QM3Z6pGobzKAKdHR5N47I1UEj7GE9kDA9jhlvlPKrF45Yxw5yoypgKNP/wT4TOHIX
	 tJwdMjV2uw+v1+Z9eZApOHOurEU8fDBuoVfRcyrrjI2wy/APk7D/8JUBFJiUhfEcWl
	 0Sx8dTedzt7B2xa6lKYq2VgBZxGSGEO5jPFUcLu+8BkxuHQ9K0RCJ7NOBGxacFX0J3
	 t6y2vuoVnAsD79yzDMOX1NFZLACmE2X23YqRJCmUbBSHnRaxX9FVe+AHNwotGHtZLl
	 pjytBSR7q+INx0sqWf0js1aDiNPXnxWgTAoXJ6bSdx6Uchik4hiz4X7kbVHJ8AnRD3
	 TDlhsKSz7qJDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2884605EE;
	Fri,  5 Dec 2025 20:53:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A9BEFE7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98AF240417
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0SFc9HvU4AtC for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 20:52:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B808240010
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B808240010
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:52:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3E59865CD; Fri,  5 Dec 2025 20:52:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Dec 2025 21:50:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77e4a8858c05c6829aac154a07566926dd3e4e00
X-Git-Newrev: 78513ff979f457a7e817ea27fa600fbe3835aff0
X-Patchwork-Hint: ignore
Message-Id: <20251205205258.A3E59865CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server:
 security bump to version 21.1.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=78513ff979f457a7e817ea27fa600fbe3835aff0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://lists.x.org/archives/xorg/2025-October/062147.html
https://lists.x.org/archives/xorg/2025-October/062150.html

This commit also updates the COPYING license file hash, after year
update in upstream commit:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/7cd443c610e5186ff09f0038d0d615600bd9a1e5

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-62229
https://www.cve.org/CVERecord?id=CVE-2025-62230
https://www.cve.org/CVERecord?id=CVE-2025-62231

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
[Julien: fix COPYING license file hash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 8 ++++----
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 7d373850d0..92030d4307 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg/2025-June/062065.html
-sha256  c8591ceb70b177440062406542fe52ba60212f217f27f8f802dd20373ca9e74b  xorg-server-21.1.18.tar.gz
-sha512  d0cd176e4c7273b6870999a3d008ed282fd5609acb2e0919c16447af3a5b2228d8592424388a8ace67acf216cdfae3a2d52f7a7ba81f6071467c61d57f32f314  xorg-server-21.1.16.tar.gz
+# From https://lists.x.org/archives/xorg/2025-October/thread.html
+sha256  a51aea1cbb29cb8122e39c1c8728469d4fd8db71a538565fbf017df11841bf04  xorg-server-21.1.20.tar.gz
+sha512  dabe7e637df4b964a1ff04a15587157b9596851a722a753447c257253ad0422007078b74053e1a51bdfd2178e3140a52f94dff0f205242a8589b6fe02d27e8a8  xorg-server-21.1.20.tar.gz
 # Locally calculated
-sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
+sha256  abbb7969df55e399e91104ded4d0a20a1b67de7c01138e63d61b7ed4f81fec0d  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 2ce02ade36..c9456c66b5 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.18
+XSERVER_XORG_SERVER_VERSION = 21.1.20
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.gz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
