Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F18E9D41B
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C98AE611EE;
	Wed,  4 Feb 2026 17:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GGWrvKqCK-dd; Wed,  4 Feb 2026 17:08:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4AE9611FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224900;
	bh=QvPWPWt3/k/4U2Dqh2SxTIq/O7CL+vPGg/dxBB/LpgI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pi0uqY2ZMEZIVQKtJra65b7tTj5mXT2lnT/p7zSkHIclvBEA3J3ziSJGt4m8jku+E
	 NByGVtIO4bLuRGpYLk/YxmiUMkl/EaBvqMVwAVKK8dUpSPlaoUprGkLY5C0zSdWA/R
	 GTQY8UUvaXEmEmzoyx1zE9P5hzHsrI8Av4cVyRdTzw7lZ5mOTjZxBxDNdpNouVerj7
	 7pbHhdo/H5nnrbcE6j6jaMzCFKffi1RqIA01WQ92ccV7KsU1DnV2d0CARVXdw5NSpt
	 uwKIBrYfNsm6U2hrdZZ2G+OMQ0ahRO61UOb9HQgUZNvCzC7ybzfI02EvUDFpyGeU43
	 PSRXIqiPcD7tQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4AE9611FD;
	Wed,  4 Feb 2026 17:08:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88F8D2ED
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68F6D83C6B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ua8MkfquBt0O for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DF4B83C43
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DF4B83C43
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C87E8697E; Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:27:42 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: aa94a00b94c77313b8317f451e1a6c13b278473b
X-Git-Newrev: f08922568a0163c94dd1c54ac9d99465ad6f6760
X-Patchwork-Hint: ignore
Message-Id: <20260204170747.6C87E8697E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] linux: fix
 'architectures' typo
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f08922568a0163c94dd1c54ac9d99465ad6f6760
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f9a40c726f54df86382b10bcc74e81c487d7410f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index db74f4c337..a06cc9e650 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -473,7 +473,7 @@ config BR2_LINUX_KERNEL_CUSTOM_DTS_DIR
 	  match the vendor subdirectory used by the board in the kernel
 	  (e.g. arch/arm64/boot/dts/rockchip/).
 
-	  While most architechtures make use of vendor subdirectories,
+	  While most architectures make use of vendor subdirectories,
 	  like arm, arm64 and riscv, some architectures like powerpc
 	  and xtensa do not.
 	  In this case, BR2_LINUX_KERNEL_CUSTOM_DTS_DIR should point to
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
