Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82383EE57C2
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 22:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5979060BD6;
	Tue, 30 Dec 2025 22:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Io2S2_Q_lXG8; Tue, 30 Dec 2025 22:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EBCF60C05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767133605;
	bh=1+SAYkNIUh4lCnWth927pKnc9ROCsfUfM1qtAOmQtBk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j/65rN6dusz7q6XpiWvtNA+BYIUbQt5XuvVJeMI46cLpEtFRLzt6+Ar3etePqqbN6
	 WSBgPGIREq8XA2NW6cPyREln0JCYlg3HDOgFc/qn9rN2TSz+OHoP1NwAEnmTaAuEDt
	 IZLtpZajQZPB7o9B60L4kMibnk04lUZSbgYjRSipF0+84S18U3qPmFAlst87LGOIvY
	 zG5nWa7Dk2nOYe60cy1TXqz+AHYFXiYYf2nMuTeBt1wes15ZHezntfuOoCBrEQBCcd
	 Ob29C7njgSvVt8IyCyMqkipcxko3hANBIwPLGruza7H2EWdVQofuNDocyU/+sWhUoA
	 eW5iE7JZOtObg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EBCF60C05;
	Tue, 30 Dec 2025 22:26:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B547277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B77F4028B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xtPBrUhb1eeC for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86B0240424
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86B0240424
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82DBC80714; Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 23:22:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53d83008325541bb04db0d1876cf1053629fa66c
X-Git-Newrev: 5f2ad897f14c103b208aea6e37f3149dbfa02ef4
X-Patchwork-Hint: ignore
Message-Id: <20251230222628.82DBC80714@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpv: drop rpi-userland support
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f2ad897f14c103b208aea6e37f3149dbfa02ef4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove the rpi-userland package, drop support for it
from package/mpv.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpv/mpv.mk | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 8832b68ece..a6e0641bd0 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -24,7 +24,8 @@ MPV_CONF_OPTS = \
 	-Dopensles=disabled \
 	-Drubberband=disabled \
 	-Duchardet=disabled \
-	-Dvapoursynth=disabled
+	-Dvapoursynth=disabled \
+	-Drpi=disabled
 
 ifeq ($(BR2_REPRODUCIBLE),y)
 MPV_CONF_OPTS += -Dbuild-date=false
@@ -162,14 +163,6 @@ else
 MPV_CONF_OPTS += -Dsdl2=disabled
 endif
 
-# Raspberry Pi support
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-MPV_CONF_OPTS += -Drpi=enabled -Dgl=enabled
-MPV_DEPENDENCIES += rpi-userland
-else
-MPV_CONF_OPTS += -Drpi=disabled
-endif
-
 # va-api support
 ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_MPV_SUPPORTS_VAAPI),yy)
 MPV_CONF_OPTS += -Dvaapi=enabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
