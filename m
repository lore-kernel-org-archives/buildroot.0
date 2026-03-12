Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123B4106ACD6
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 18:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D036E405D8;
	Thu, 12 Mar 2026 18:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PS-jcR2wqkG; Thu, 12 Mar 2026 18:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 106B44058A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773340830;
	bh=KVVlN0fh074yF5gOqIzTvU/N4kG11yN8i3eBIbLMcOU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=osCVMAf9Zy9ILMamSTqCMoV5zO8GdT2QHw8xOP9J3KGXROUh1LApciDTZfY2kwDDd
	 eOigbYXsvDTIzmGk9xWFuQJMy7mWuhyRgoYYPpHFkwQYmPvO+i6lvIGK5ZESzQQRZD
	 ynF2rE8SeqdNQKoxT5bJZbGis54RJPCFf3DwPEuYtlFcYsZe1hr3DXShq46s2woILn
	 HY5EczlB5Pe2cHlPPqh5gtcn9Ac3I+iKuXagM6X/OLqigU+c78fyH4v6338fRvrsS+
	 o0Pbv2PJoi+MLN53Y32/YG1OmeS4RA3ZCDO/VQZKDgD7BZ2FOJHAx2OkZpjm1QxhbB
	 LohHhYMUS0EqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 106B44058A;
	Thu, 12 Mar 2026 18:40:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 40C5B786
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 18:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 265BA40532
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 18:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id klLffS_ntrKL for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 18:40:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 793F340528
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 793F340528
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 18:40:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88C3287191; Thu, 12 Mar 2026 18:40:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Mar 2026 19:39:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cb77b494020ebf7f0572526a3bb12256029495e
X-Git-Newrev: 42a29e88648d1faafcb5718f42d47407a848c2ab
X-Patchwork-Hint: ignore
Message-Id: <20260312184028.88C3287191@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/aarch64-efi/genimage-efi.cfg: use
 readable partition type
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/42a29e88648d1faafcb5718f42d47407a848c2ab
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

genimage has an alias for the root-arm64 uuid [1].

[1] https://github.com/pengutronix/genimage/blob/v19/image-hd.c#L284

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/aarch64-efi/genimage-efi.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/aarch64-efi/genimage-efi.cfg b/board/aarch64-efi/genimage-efi.cfg
index 158deab87d..207fc3e3bc 100644
--- a/board/aarch64-efi/genimage-efi.cfg
+++ b/board/aarch64-efi/genimage-efi.cfg
@@ -24,7 +24,7 @@ image disk.img {
 	}
 
 	partition root {
-		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
+		partition-type-uuid = root-arm64
 		image = "rootfs.ext2"
 	}
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
