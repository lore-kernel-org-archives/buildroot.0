Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3C8CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A10C96163D;
	Fri, 29 May 2026 08:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUdFb2_91Tfm; Fri, 29 May 2026 08:47:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ED7061612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780044476;
	bh=5qzt5VXAhwFcRntu01wN471kPcYBRnM/iY5uJBD/gtQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZPx+6B4lA8Bn8Z++5Lc0MwscVAJTA3FFplS2xb92Y2SWhZg93WT5WO22hesZfI2Mq
	 tAINWeqkKgOi2b47w5WNDuvpIPjIHSLV4csOdlTQdyqmiNkF8vT7oCnFYy2MHwVgP7
	 xQfkFUisZ53cN3pRiX3oH8zgiZAm2Svugb5u2t6SrYtc0CP8Cy7Wj1DVFbhsi1JnrC
	 KbBKLS5zXp7WkpBYmt+4JEr78Xlwfb6qXV5dGyTqvf/jaQnkj/HmWd5XkmCeoZi24w
	 xdZxnATSwtFCkMGYV3M5wYya7dytn+lFiRnbAdLjZjIoAm4gwKsOfR00oRJ0HcIqfL
	 3Ju4ruzJy5u3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ED7061612;
	Fri, 29 May 2026 08:47:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A97E288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 696F2421EB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E6W9o_vtIRzJ for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:47:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D0FB421EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D0FB421EE
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2617B873AC; Fri, 29 May 2026 08:47:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:43:36 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c154dcd6c35864c23365f236851e57c92d0da7bc
X-Git-Newrev: b12c9d3ccccab56c32857c6424a0617d70e613c9
X-Patchwork-Hint: ignore
Message-Id: <20260529084739.2617B873AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/petitboot: remove lvm2
 !BR2_STATIC_LIBS reason
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b12c9d3ccccab56c32857c6424a0617d70e613c9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Signed-off-by: Andreas Mohr <and@gmx.li>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/petitboot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
index 76cbbe9c6d..3a0ee4bc8e 100644
--- a/package/petitboot/Config.in
+++ b/package/petitboot/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PETITBOOT
 	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS || BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # lvm2, agetty
 	depends on BR2_USE_WCHAR # elfutils, kexec-lite
-	depends on !BR2_STATIC_LIBS # elfutils, kexec-lite, lvm2, nvme
+	depends on !BR2_STATIC_LIBS # elfutils, kexec-lite, nvme
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, kexec-lite, lvm2
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 || !BR2_PACKAGE_KEXEC_ARCH_SUPPORTS # kexec
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
