Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33844E8FDA7
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F409A60B45;
	Fri, 26 Dec 2025 18:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1p7WHwqWQtVb; Fri, 26 Dec 2025 18:21:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AD0F60BAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773272;
	bh=Nn7aiLt+a9dLSYnM5j+FX4nSapWlIp2J2H1HJVqkJWM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y3aoUHTVQ9NalEV02Lr+dXE4gvP9VOkwSYRbcEAtZmVIEz/lA32CaWcENxelgp6jb
	 6UDp+yepVAklH6YNzR8ZAJlWhex7+9Uk2z1ihocps56VEKSeZ/XXZCOJyoWjhq7tD0
	 eoxJuyqooSY8ZW2OGgTt3GYKUbzhhGgPedmHgjPZVpIdqYvb4zaXrOe4/K18BPglsP
	 cCSDXAM8Q2jbDoMi/J+UWcvo8qfLcA69NcoxJHF81bq/Kr0iGkeFlf3TBjgVXCBYs2
	 4N+myBbRG0Dl2gE3INJR4PjgBA+MGzkBVZ4PqKwTbHY7wzvScjQOxDAvcVUZ879/e/
	 W3S1ZqJqDY6VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AD0F60BAE;
	Fri, 26 Dec 2025 18:21:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD747EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DA4280B29
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BRrbZURSgHKE for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99E4880AB0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99E4880AB0
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 971B78461E; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79adde0180e834f839c770caa14d5253544d9719
X-Git-Newrev: 66f3eb88c103ec53f8a2d776c57e62201f43cbe8
X-Patchwork-Hint: ignore
Message-Id: <20251226182055.971B78461E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xinput-calibrator: bump
 version to 0.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=66f3eb88c103ec53f8a2d776c57e62201f43cbe8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched _SITE to freedesktop.org:
https://github.com/tias/xinput_calibrator/commit/92c40faea5ce899754490738e5cb24469c566d16

Use xz tarball instead of gz.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash | 2 +-
 package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash
index b8fcaed039..a55b9b8c6e 100644
--- a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash
+++ b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  baa4ddca49ec94c27ba4c715bfa26692fec1132103e927213c3169e475d3d971  xinput_calibrator-0.7.5.tar.gz
+sha256  0508bf9705c0945f746b8c81bfc8d583a347dd067b58fa76b1aed4225e4b8b40  xinput_calibrator-0.8.0.tar.xz
 sha256  ba6f260bba7d9640cfedfde3a6ae1790583ab8b9ee7c547233ecc0a214d1a6d3  COPYING
diff --git a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk
index be86608b85..9c5b8e235b 100644
--- a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk
+++ b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XINPUT_CALIBRATOR_VERSION = 0.7.5
-XAPP_XINPUT_CALIBRATOR_SOURCE = xinput_calibrator-$(XAPP_XINPUT_CALIBRATOR_VERSION).tar.gz
-XAPP_XINPUT_CALIBRATOR_SITE = https://github.com/downloads/tias/xinput_calibrator
+XAPP_XINPUT_CALIBRATOR_VERSION = 0.8.0
+XAPP_XINPUT_CALIBRATOR_SOURCE = xinput_calibrator-$(XAPP_XINPUT_CALIBRATOR_VERSION).tar.xz
+XAPP_XINPUT_CALIBRATOR_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XINPUT_CALIBRATOR_LICENSE = MIT
 XAPP_XINPUT_CALIBRATOR_LICENSE_FILES = COPYING
 XAPP_XINPUT_CALIBRATOR_DEPENDENCIES = xlib_libX11 xlib_libXi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
