Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755DAC28B2F
	for <buildroot@archiver.kernel.org>; Tue, 18 Mar 2025 15:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE53B84022;
	Tue, 18 Mar 2025 15:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ae6kMrDxSHC1; Tue, 18 Mar 2025 15:06:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCBC584010
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCBC584010;
	Tue, 18 Mar 2025 15:06:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 290F4D8C
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E93B407FC
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5CaXeqABiMdt for <buildroot@buildroot.org>;
 Tue, 18 Mar 2025 15:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2AF24088C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2AF24088C
 for <buildroot@buildroot.org>; Tue, 18 Mar 2025 15:02:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BECED880EC; Tue, 18 Mar 2025 15:02:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Mar 2025 21:45:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b81b594a9afaf88113d3411a54b8853845153f0
X-Git-Newrev: 6dc177bee8b7fe1ae1607bd7c0819b0dc63397d7
X-Patchwork-Hint: ignore
Message-Id: <20250318150244.BECED880EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] system: add catatonit as init system
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6dc177bee8b7fe1ae1607bd7c0819b0dc63397d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like the existing tini, catatonit can be used as minimal init to be
used as PID-1.

Add it to the list of init systems, like was done for tini in
24cac9c4e6a3 (system: add tini as init system) and tinyinit in
c1daa35cd950 (package/tinyinit: new package).

Unlike the "main" init systems, there is no historical preference for
those minimalist init systems, so just keep them alphabetically
ordered.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 system/Config.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/system/Config.in b/system/Config.in
index 8f3579b7e0..8ff6c7213e 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -149,6 +149,16 @@ comment "systemd highly recommends Linux >= 4.15"
 
 comment "Special purpose (read help)"
 
+config BR2_INIT_CATATONIT
+	bool "catatonit"
+	select BR2_PACKAGE_CATATONIT
+	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
+	help
+	  A container init that is so simple it's effectively
+	  brain-dead.
+
+	  https://github.com/openSUSE/catatonit
+
 config BR2_INIT_TINI
 	bool "tini"
 	depends on BR2_USE_MMU  # tini
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
