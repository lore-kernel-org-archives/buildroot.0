Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C16C44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1843E607C7;
	Fri, 10 Jul 2026 13:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8xygNcqpvei; Fri, 10 Jul 2026 13:43:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 901836074D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783690982;
	bh=+RDYy39YMC5uNFnrybSrCPPMhVnNZ27eIR5957aGdF4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mbPh5SV22zOI67I9gQtXFK2hxiomUIH1zfwV0NmOQEUkywePnuavTXHYmINdW69hz
	 bRqO8KeqAkOMbdiEoC9Z4FuSllN5d1+mwkoxbPCe7x2taBUKvVlJsieqCM1SUO2I7M
	 1+5K2PuCLCRUE7yiiuVyhbFzo8qh0Jd0fAPfwlAv9EiEP+XcV1dxd+Dn4SVL+eLmNd
	 rd193Z86fXcitu43MDVTbQ4O+ou+57+DeFFSly7jMy86jCIa/2k+XR+XDuc+ET4DA4
	 nIHo0k+6lNA2PwAAD47s7FgZxt7/Ib6ZewAn+Pdazm2/e3hmbbnNTQC8QNBeN5BN4r
	 KzfHYZRNnqVVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 901836074D;
	Fri, 10 Jul 2026 13:43:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D63CD108E
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB28B810B3
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFLxG-OWhdDY for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:42:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3D7B810B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3D7B810B5
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 155E188675; Fri, 10 Jul 2026 13:42:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 13:50:16 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 33c43cb2279899c32509de6b0c5343a7b96e78e5
X-Git-Newrev: 0c13eee22f40f40a407bb88410c90989583fc02e
X-Patchwork-Hint: ignore
Message-Id: <20260710134217.155E188675@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/shadow: needs
 host-pkgconf
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0c13eee22f40f40a407bb88410c90989583fc02e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Since version 4.14.0 and upstream commit 2a5b8810bb17, shadow has
required pkgconfig to find libbsd.

Add a dependency on host-pkgconf.

Fixes: https://autobuild.buildroot.org/results/90f/90ff13ff4c519b0606888eaa90acbd8cd0c0f73a/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
[Fiona: fix typo in commit message]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 9030c9a81dc8763b89a4fb9df220dd1aa013cdbc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/shadow/shadow.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index bb61fed82e..5191dc42c7 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -10,9 +10,12 @@ SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
 SHADOW_LICENSE = BSD-3-Clause
 SHADOW_LICENSE_FILES = COPYING
 SHADOW_CPE_ID_VENDOR = debian
-SHADOW_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 SHADOW_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
+SHADOW_DEPENDENCIES = \
+	host-pkgconf \
+	$(TARGET_NLS_DEPENDENCIES)
+
 SHADOW_CONF_OPTS = \
 	--disable-man \
 	--without-btrfs \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
