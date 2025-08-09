Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B86C87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 14:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C75AA80AA8;
	Sat,  9 Aug 2025 14:04:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ylkPXJdkOsdN; Sat,  9 Aug 2025 14:04:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDA0D80AB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDA0D80AB2;
	Sat,  9 Aug 2025 14:04:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F74031
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 14:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 004AA60BD9
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 14:04:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y4V1jPAcnUoy for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 14:04:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1353B60C12
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1353B60C12
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 14:04:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1AA886E85; Sat,  9 Aug 2025 14:04:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 9 Aug 2025 16:01:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2640f5dcd03d93966244b1501c457b11d2fd3568
X-Git-Newrev: ab470fbc8eb1053548c3d33e807db84fd5af1445
X-Patchwork-Hint: ignore
Message-Id: <20250809140431.F1AA886E85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: add missing hash for linux 6.1.147
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab470fbc8eb1053548c3d33e807db84fd5af1445
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building a toolchain with kernel headers 6.1.x, the build fail
due to missing hash for linux-6.1.147.tar.xz

The hash was removed by mistake when bumping kernel 6.{6, 12, 15}.x
series.

Fixes: 51b27bad915c95499877c8bf9a16a221c904bf82

Cc: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/linux.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux/linux.hash b/linux/linux.hash
index dd6febc25c..f5e2d663d1 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -3,6 +3,7 @@ sha256  1a4be2fe6b5246aa4ac8987a8a4af34c42a8dd7d08b46ab48516bcc1befbcd83  linux-
 sha256  e94f3af85492302f7a819441458f80bca0ad9912e5a4c83c699ff3c63c52957d  linux-6.15.9.tar.xz
 sha256  6b19a3ae99423de2416964d67251d745910277af258b4c4c63e88fd87dbf0e27  linux-6.12.41.tar.xz
 sha256  8c4ff2869736538b9b0d88ea8dbf0332b79c6ecc40a32066768a754df1fae1c0  linux-6.6.101.tar.xz
+sha256  218f25663a41e3d811e84fa1c4acec50684898b2f6d0c8c0deb531d937e466f7  linux-6.1.147.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  e3d0025b87278e14733cb326700f17c7cceb54d920622b0d5fcd58a88c6850c3  linux-5.15.189.tar.xz
 sha256  8d88c3977226d666554b75f480d1e6c5f4e4d2acdf2a3462840c6bac88634d13  linux-5.10.240.tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
