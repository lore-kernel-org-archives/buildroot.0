Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01226E83828
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 19:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAE4F83BB7;
	Mon, 16 Feb 2026 19:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1hWmpAuNg4p8; Mon, 16 Feb 2026 19:48:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0B8E83BBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771271280;
	bh=IuTTKXeSgaRPRxAtiH4zpblDaC57E7IfnTvkTmm33ak=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ca8zpYzuCL5831R/y0sX4Eixph8bjljbhFsc5zp1Yj0c9UgADYAOrgINw/fSu8M00
	 9Yz+HVSmSM5O+F2oPPeErtBuHqcVYSaC6LRHmsCnJANNXKSNi20sEq4wgo5dIu0eVq
	 nrqJmMmYXhw3dOqrH4EhaD3TA0EXClN0JTBR8zzxAceN7eRnImZHx+Qcmxt4Dwtsei
	 YVTPkgQ90JAcyoOGmxgMe+awRynK16y7ET+X4JUJJkdMln8Oe8D1NSrz5ZM9JVj+MQ
	 2Vz5qb+EI3ciEltrHNWOLfIfd8qKNfTBvcPc+WNNYkemG//sC3FSNgkKuVgTGe+w6/
	 7J0Ophznm50/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0B8E83BBA;
	Mon, 16 Feb 2026 19:48:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40448395
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 254CE60DE3
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ilmbaLUmTyMJ for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 19:47:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24D6760DE2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24D6760DE2
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 19:47:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0790E86F19; Mon, 16 Feb 2026 19:47:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 20:47:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 541986065a4cb8e6edcff4ddafac85f4a88e33c7
X-Git-Newrev: 9900ba6208ce286ca6531e1dc93b8a5cc322d408
X-Patchwork-Hint: ignore
Message-Id: <20260216194757.0790E86F19@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: make license option visible for
 _CUSTOM_VERSION as well
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9900ba6208ce286ca6531e1dc93b8a5cc322d408
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit 50958bcdac ("linux: Add support for custom license files") added a
default value for the license files and made the option visible (E.G.
editable) when a custom VCS or tarball version is used, but it is also
needed for users of an older _CUSTOM_VERSION (E.G.  mainline release), as
the referenced files were only added in Linux 4.16 with commit e00a844aca
("LICENSES: Add Linux syscall note exception"), so change that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 9d96b346d5..c136084afd 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -152,7 +152,7 @@ config BR2_LINUX_KERNEL_VERSION
 
 config BR2_LINUX_KERNEL_LICENSE_FILES
 	string "Kernel license files" if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || \
-		BR2_LINUX_KERNEL_CUSTOM_SVN || BR2_LINUX_KERNEL_CUSTOM_TARBALL
+		BR2_LINUX_KERNEL_CUSTOM_SVN || BR2_LINUX_KERNEL_CUSTOM_VERSION || BR2_LINUX_KERNEL_CUSTOM_TARBALL
 	default "COPYING LICENSES/preferred/GPL-2.0 LICENSES/exceptions/Linux-syscall-note"
 	help
 	  A space-separated list of license files related to the Linux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
