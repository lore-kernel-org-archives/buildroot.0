Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307A2E9D41A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F077460E03;
	Wed,  4 Feb 2026 17:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6XqgsrvoFy8C; Wed,  4 Feb 2026 17:06:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB1EE60EBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224809;
	bh=QnrgE+hRHeMqQ9w6JB747GuhYFoIqEsWwpEp7+D+EDk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=h8t9Vcx3uQbimlfmpeQF3lz5q7odMkQUYgewt4kl4PZ+7vjOEsUQlOIgAdVdHqTB2
	 UoGJBKXTSknAsCDtPGq2+jqO6FN+1PMYOrBZUnOwjsNFzWgaKH57/KaduPSPp0Pnpp
	 Gqzg6lTZ68vCcmfQQimkq1SUQsn+ihsQHeEIgz4XPh10HydCjcD/tkbqUpsA+gbi4+
	 KcLG3pv/j6hSswogwoyl8XcNZmTf/3bUMhqXMW/c3CULXrjnW75IiHYoAT9SrW9Ikt
	 ckZHI7mKR4d45EFkOqeLSbbcGxjn6onAAePextKssJCnlsqcO981eP8cZ0mx92gIW5
	 Ow08qMV9gLrdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB1EE60EBD;
	Wed,  4 Feb 2026 17:06:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B895173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CC2D60FA3
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dX_K281dljnQ for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75EFD605A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75EFD605A6
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4362486977; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:27:42 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 717fe4cf60cb00addcee6ab25da9b90862d0175f
X-Git-Newrev: 9741729c8af80397c98a92c1ba5f45b9e02f5aac
X-Patchwork-Hint: ignore
Message-Id: <20260204170637.4362486977@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] linux: fix
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9741729c8af80397c98a92c1ba5f45b9e02f5aac
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f9a40c726f54df86382b10bcc74e81c487d7410f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index fb21c3f513..7e2207e995 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -461,7 +461,7 @@ config BR2_LINUX_KERNEL_CUSTOM_DTS_DIR
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
