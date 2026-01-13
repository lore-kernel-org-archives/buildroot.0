Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBCFD30CC4
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFE7C60BB3;
	Tue, 13 Jan 2026 20:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Z-xveabGkiC; Tue, 13 Jan 2026 20:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E96B960DB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337942;
	bh=xAfap2CuHtTNtbCEdWBJ40zI3pEU6NjggB7X3pUZEUs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QaISSqJ4q3CxtgwWQDdo7lbGpfk7ydTyH1UHLyH/SBWIQi2SUFPJS5kRaFuOmtzY7
	 D7rWr2kckXKdqv/DHV1BB9qh4DsmfS1g6EBuStAWrAPIZPvFKeUGoSq+Ks4PKzaouj
	 ogJ6mj3IR6da7DTq2dVwM1IC3D7AzcPTxxH/MUq5Cebr8KyHs08auJ235mAHjWv8pt
	 mye+CHoSZNcUCt4r/CXeKbLnH4XB+7EVadqkO/ywk3YnRitHlgaePTnkkwRRyvevyr
	 6n/1UrYu4IGeCvpI6sWsSGtW1BFRHWPKuEwHNKS6J2rmUguBGrzMGOytnwdo+pDPij
	 /+AzcXORJ8cCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E96B960DB5;
	Tue, 13 Jan 2026 20:59:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D62C61CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCF2A40C46
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jGVAZwwcheMB for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8756C40C2E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8756C40C2E
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78C2687F77; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ac3cddf7b6af137fb819ca928043973eb1fdc4c
X-Git-Newrev: 53ec417e40aea0057de037e3bb46bdc3b596effb
X-Patchwork-Hint: ignore
Message-Id: <20260113205848.78C2687F77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXi: bump version to
 1.8.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=53ec417e40aea0057de037e3bb46bdc3b596effb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-September/003530.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libXi/xlib_libXi.hash | 6 +++---
 package/x11r7/xlib_libXi/xlib_libXi.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXi/xlib_libXi.hash b/package/x11r7/xlib_libXi/xlib_libXi.hash
index 545d4881f6..a806235976 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.hash
+++ b/package/x11r7/xlib_libXi/xlib_libXi.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-May/003390.html
-sha256  89bfc0e814f288f784202e6e5f9b362b788ccecdeb078670145eacd8749656a7  libXi-1.8.1.tar.xz
-sha512  a30b1a07e6d710f5196e7477415d68074736f89d954e8f2d5ccc9b5f349e7d1d440c90fb512508176b5db5ecad55608cfb540872936b731963fd83343db3a0b9  libXi-1.8.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-September/003530.html
+sha256  d0e0555e53d6e2114eabfa44226ba162d2708501a25e18d99cfb35c094c6c104  libXi-1.8.2.tar.xz
+sha512  6348aae8f595217e26f348184dd594d83af800949f649bfd11b6aef7387faa5624ed18551fe2c3a38c8deab9d7473f72fd7e3e8472cff3ff30d4bb3fb2e6dc31  libXi-1.8.2.tar.xz
 # Locally computed
 sha256  9392174bc86e291369fd2f61f3ed325962735a5f5c585ce8d7ebd365e2a5639f  COPYING
diff --git a/package/x11r7/xlib_libXi/xlib_libXi.mk b/package/x11r7/xlib_libXi/xlib_libXi.mk
index 6ae5ec8be8..f5b0c81a99 100644
--- a/package/x11r7/xlib_libXi/xlib_libXi.mk
+++ b/package/x11r7/xlib_libXi/xlib_libXi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXI_VERSION = 1.8.1
+XLIB_LIBXI_VERSION = 1.8.2
 XLIB_LIBXI_SOURCE = libXi-$(XLIB_LIBXI_VERSION).tar.xz
 XLIB_LIBXI_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXI_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
