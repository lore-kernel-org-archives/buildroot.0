Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28723CA100F
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 21:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE307606E9;
	Mon, 22 Sep 2025 21:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTIt1CsK4L2b; Mon, 22 Sep 2025 21:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A2DA606DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A2DA606DF;
	Mon, 22 Sep 2025 21:07:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 28A71498
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 21:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A758606BD
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 21:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ulaAghDMccbm for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 21:07:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AC50606B6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AC50606B6
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 21:07:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5965686211; Mon, 22 Sep 2025 21:07:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Sep 2025 22:25:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4655cfd8f306be2f1421e070b5686c6637bf4c5a
X-Git-Newrev: 7f620c7a057b4d2c8ba418282519da196006cfaa
X-Patchwork-Hint: ignore
Message-Id: <20250922210750.5965686211@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/loongarch64-efi: fix typo in grub
 config
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f620c7a057b4d2c8ba418282519da196006cfaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/loongarch64-efi/grub.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/loongarch64-efi/grub.cfg b/board/loongarch64-efi/grub.cfg
index 2006f6d60d..c84a7f646b 100644
--- a/board/loongarch64-efi/grub.cfg
+++ b/board/loongarch64-efi/grub.cfg
@@ -1,4 +1,4 @@
-/set default="0"
+set default="0"
 set timeout="5"
 
 menuentry "Buildroot" {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
