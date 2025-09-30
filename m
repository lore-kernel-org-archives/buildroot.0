Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2019DCCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 21:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8CF4614C7;
	Wed,  1 Oct 2025 21:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bAgwBYGUe1TK; Wed,  1 Oct 2025 21:00:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 119CF614CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 119CF614CE;
	Wed,  1 Oct 2025 21:00:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F3A672
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 561E641482
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0byRluem01WF for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 21:00:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98E1341460
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98E1341460
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8953B8129B; Wed,  1 Oct 2025 21:00:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 11:28:27 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 205eee9a6a32a253c2270eac71d2cb129fe5c3bd
X-Git-Newrev: bed14dbc3ee9ae0e441cdf2735b0d0ba2dca819e
X-Patchwork-Hint: ignore
Message-Id: <20251001210010.8953B8129B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] board/loongarch64-efi:
 fix typo in grub config
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bed14dbc3ee9ae0e441cdf2735b0d0ba2dca819e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7f620c7a057b4d2c8ba418282519da196006cfaa)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
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
