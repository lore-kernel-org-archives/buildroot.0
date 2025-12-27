Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D655E92724
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 23:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11074607EC;
	Sat, 27 Dec 2025 23:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-vk95vdpYeN; Sat, 27 Dec 2025 23:40:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E74D607E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766878802;
	bh=4s0toLYO+Ddv4vMbFaW2iPf6Jjlurgbkk9RSIfyjqmE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c+ezTvSFG+HFaU8i7Koh123G4AGGuU0RYdjHXZesgdgP9DVSik1LQS39EpNnPHD0m
	 Hn6MzZBTge6nRX1ohsPGbqUHmn209u4E5wr0uKptraTKVu3R8AOAqgiaXe8aR+tIFJ
	 WLC07qomYvu8L7CH8Rsd2vQVcPzIPg0GUDMJT+NYvRwSkZenoSqa8M9SLREoRO5lqz
	 Bu5DWoBnu965lKqyvVWtJUorKtsHN3mgBTO/ZVOleaUtKS6Yf7IA1SRHI895/Rupsh
	 oaQbnmLfuYLSrouVw6MmwGTEoohGO2Djthi4GiHAYnd3f2tNXTPmbDCDX/CX5CD6HU
	 L7P7RuXsBjTBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E74D607E8;
	Sat, 27 Dec 2025 23:40:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B8B6119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DEED607BE
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AfqJm-axIdXi for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88343607C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88343607C2
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E88B87901; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 00:39:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3d5f2c25480693bc6915b44b36e99b9febc371b
X-Git-Newrev: b42bfbc5e11c638955e2f0619ee888754eb2c627
X-Patchwork-Hint: ignore
Message-Id: <20251227233954.6E88B87901@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ddrescue: bump version to 1.29.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b42bfbc5e11c638955e2f0619ee888754eb2c627
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release announces, see:
1.29: https://lists.gnu.org/archive/html/info-gnu/2025-01/msg00003.html
1.29.1: https://lists.gnu.org/archive/html/info-gnu/2025-03/msg00011.html

This commit switches _SITE from savannah to use BR2_GNU_MIRROR.
At the time of this commit, the savannah mirror does not include the
1.29.1 archive. This will also use https by default.

This commit also updates the license hash, after the FSF address update.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ddrescue/ddrescue.hash | 6 +++---
 package/ddrescue/ddrescue.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ddrescue/ddrescue.hash b/package/ddrescue/ddrescue.hash
index 4103d4fd6f..716f6e4cfd 100644
--- a/package/ddrescue/ddrescue.hash
+++ b/package/ddrescue/ddrescue.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2024-01/msg00014.html
-sha256  6626c07a7ca1cc1d03cad0958522c5279b156222d32c342e81117cfefaeb10c1  ddrescue-1.28.tar.lz
+# From https://lists.gnu.org/archive/html/info-gnu/2025-03/msg00011.html
+sha256  ddd7d45df026807835a2ec6ab9c365df2ef19e8de1a50ffe6886cd391e04dd75  ddrescue-1.29.1.tar.lz
 # Locally computed
-sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
+sha256  022e9c2e9cc1aac3622313df6f971fbb39c1d1b0cb45324c16b8a1fe231c5ea6  COPYING
diff --git a/package/ddrescue/ddrescue.mk b/package/ddrescue/ddrescue.mk
index 13798bb4bb..20070d763a 100644
--- a/package/ddrescue/ddrescue.mk
+++ b/package/ddrescue/ddrescue.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DDRESCUE_VERSION = 1.28
+DDRESCUE_VERSION = 1.29.1
 DDRESCUE_SOURCE = ddrescue-$(DDRESCUE_VERSION).tar.lz
-DDRESCUE_SITE = http://download.savannah.gnu.org/releases/ddrescue
+DDRESCUE_SITE = $(BR2_GNU_MIRROR)/ddrescue
 DDRESCUE_LICENSE = GPL-2.0+
 DDRESCUE_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
