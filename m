Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382B4CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0666F85594;
	Tue,  9 Jun 2026 13:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EL4ZnxadOPmA; Tue,  9 Jun 2026 13:02:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B47A2856D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010127;
	bh=vvpFEqOYWUCkodaSvISguGSjsBRpXpTBRPeeNYEoGDc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RgQiyCzYGIbGyrtIgWuJzwcsQqY8xbZHG/rfRemfZgiQqj2SfFn9uxZCD2dRtwTO6
	 QGFO3baIrMq6SulgZ12LRUmdjofYftpPv0a2gkh5lB3IG1knLLA8VTdQ94OrOwewXf
	 FFMIuZnuqbRLrjYij7LnnP2VTerdqhJUvsLlPyrV+SF48FpsL6cUSS58VJuDoGzUG3
	 HewUis28Sym8sKH1pG+5H4P00/MCOo/uWfDukydu1F5rOecAWTjgoI8tcdI7ossea8
	 oKwRkTNo0KdNt7yFxXkKmpd1PFmcRUllZkBhVADDS87lQKaUILGpiLkbwr5Gh2ISfr
	 zmV9PT6zWSfgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B47A2856D4;
	Tue,  9 Jun 2026 13:02:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C7342EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D7766F698
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cVHF_60MA9Yj for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FF526F691
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FF526F691
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F6BE87E68; Tue,  9 Jun 2026 13:01:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 May 2026 20:10:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9e5b93f78228c9bcaa210eaa99332000c9bf86d
X-Git-Newrev: 2d78ca8ad60e0988762f9b91e5102fae978c4de8
X-Patchwork-Hint: ignore
Message-Id: <20260609130118.4F6BE87E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/amlogic-boot-fip: bump version
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2d78ca8ad60e0988762f9b91e5102fae978c4de8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bump amlogic-boot-fip to the latest commit on the LibreELEC/amlogic-boot-fip
master branch.

Signed-off-by: Viacheslav Bocharov <v@baodeep.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/amlogic-boot-fip/amlogic-boot-fip.hash | 2 +-
 package/amlogic-boot-fip/amlogic-boot-fip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/amlogic-boot-fip/amlogic-boot-fip.hash b/package/amlogic-boot-fip/amlogic-boot-fip.hash
index 1a08341532..f9f0e8b018 100644
--- a/package/amlogic-boot-fip/amlogic-boot-fip.hash
+++ b/package/amlogic-boot-fip/amlogic-boot-fip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2cc06bc7d5647fd8c0025181fa42c4a8ef0ed16b918a1fa2060ea83c22e47b20  amlogic-boot-fip-e96b6a694380ff07d5a9e4be644ffe254bd18512.tar.gz
+sha256  dede20dd7666a33b33442252b994f4033cfafe3fb6d11c86019dc3ae61d55227  amlogic-boot-fip-42d372123631066fb77fbcbb612dc3eb41a3f6f9.tar.gz
 sha256  4255537f71b1cd0d487de0fa2b8eddf1eb96ed96d119507336dde8b3782b86e6  LICENSE
diff --git a/package/amlogic-boot-fip/amlogic-boot-fip.mk b/package/amlogic-boot-fip/amlogic-boot-fip.mk
index f98887cfcd..552e785066 100644
--- a/package/amlogic-boot-fip/amlogic-boot-fip.mk
+++ b/package/amlogic-boot-fip/amlogic-boot-fip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AMLOGIC_BOOT_FIP_VERSION = e96b6a694380ff07d5a9e4be644ffe254bd18512
+AMLOGIC_BOOT_FIP_VERSION = 42d372123631066fb77fbcbb612dc3eb41a3f6f9
 AMLOGIC_BOOT_FIP_SITE = $(call github,LibreELEC,amlogic-boot-fip,$(AMLOGIC_BOOT_FIP_VERSION))
 AMLOGIC_BOOT_FIP_LICENSE = PROPRIETARY
 AMLOGIC_BOOT_FIP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
