Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35E1FD9E0A
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA68960771;
	Thu, 26 Feb 2026 20:45:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hJ_lNxjRUmEC; Thu, 26 Feb 2026 20:45:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC342607C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138744;
	bh=nUDf6yc65TcLjQ7rPMHC3K/wlmrq93P4+E5W5gIY/WU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Uk1hZlPx1ecYPWHjJ411s/tTm/Sm+bGFHGA3dVEhQXnEx2O/BLj/kzL5+XKn2dHXm
	 cA65JoXs+6urFe0lHAz0GUJOQD4mLa/X8ziI9XX9vJg93VNzA8N1wfnhZPNvUQ9hBv
	 xlpHpA/YvZzll3qLaqrvlkwiFcdvblLXHO3DK46PJEC6YjOf9jyCWnSVxGQJfAVdnG
	 j7NssagCMHFGvL5RLV4TRAeL+wOkyRJreYzroicptpVjgM9fimOaoWCohDWHIj3UDH
	 9stjZq/e1E1KEQP1kXHpd40yA2vHa/JzTultE6XmwjlhMTmudk8+1b1TGWbZ2FEfLt
	 ena884pUCrcDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC342607C4;
	Thu, 26 Feb 2026 20:45:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A6411F3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB69181191
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NHWujvbnoi8k for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:45:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5FB681192
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5FB681192
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:45:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC0B687558; Thu, 26 Feb 2026 20:45:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 10:24:42 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: fd7f102936bd2232014e21f494b32935fd48f9e6
X-Git-Newrev: 1d55ef00a12634b187da394b49f7f8a0ded610f7
X-Patchwork-Hint: ignore
Message-Id: <20260226204529.AC0B687558@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] linux: make license
 option visible for _CUSTOM_VERSION as well
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1d55ef00a12634b187da394b49f7f8a0ded610f7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Commit 50958bcdac ("linux: Add support for custom license files") added a
default value for the license files and made the option visible (E.G.
editable) when a custom VCS or tarball version is used, but it is also
needed for users of an older _CUSTOM_VERSION (E.G.  mainline release), as
the referenced files were only added in Linux 4.16 with commit e00a844aca
("LICENSES: Add Linux syscall note exception"), so change that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9900ba6208ce286ca6531e1dc93b8a5cc322d408)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 300252986b..7dec707b8a 100644
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
