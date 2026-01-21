Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89316C44506
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 18:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 407454710A;
	Wed, 21 Jan 2026 18:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QWXRgzmGot_y; Wed, 21 Jan 2026 18:17:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CF2846FD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769019440;
	bh=38z5V007jT7hpVWT0cUuTcqIVG9mxLM5FwAqXPWLAwI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jiA+uTiWy9z9I1w3xaOUYcZmoYlo/74izkPDjDEgjiMv4p2VJ4kp+AFqZr3bj06Xw
	 HlfS5LBqdvI892IWm9OKX6MFPn5W9ofEPNYt9W39W8WCCL8fQEazQPf9te2njNfXmV
	 2dndnQCpqPvCv4UedlIURzvqenAYnCyDu4L8D9ieNDUsLWuvF14JE/5bQ75LS/gL23
	 xwZn3dmbDqGHfXkVHHDmjLKguPM25nrxpGL9lUJ7vxosLZ4rRAJ0wR6ffkCO2bJRzf
	 EdHCljQlWGabN0STJ56sOM/QK4D3Zq2IxCdBpEzY9FPtmzHt01J6CyBY+2JAknT9GS
	 3s7f1lQH58QMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CF2846FD7;
	Wed, 21 Jan 2026 18:17:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 936A8160
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 745CB45FD7
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EhfIBYHjPLlX for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 18:17:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64B4440C62
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64B4440C62
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:17:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50632873EC; Wed, 21 Jan 2026 18:17:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Jan 2026 19:13:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4fa6ab7b8f3091652af03093e48e9c1bd1291b96
X-Git-Newrev: f9a40c726f54df86382b10bcc74e81c487d7410f
X-Patchwork-Hint: ignore
Message-Id: <20260121181716.50632873EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: fix 'architectures' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9a40c726f54df86382b10bcc74e81c487d7410f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 96efbe5678..3a1852c7e9 100644
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
