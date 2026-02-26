Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D7FFD9E10
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F17F60747;
	Thu, 26 Feb 2026 20:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fhw0ao53f1bC; Thu, 26 Feb 2026 20:44:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B4CA60724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138648;
	bh=Vz+dkFiuzpaI912qGovvRIcSkc6wE8jDMUHVC8fnFKc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I410kwV4Nf4gbRLP4bEmYKdyVcY38xjXlkY1kx8Z3aRTnH7ACzclhDaUaO/AWR6m9
	 wcpqZDDhHZjy4+cFjHNXa3tfN0K2J7V0M6cwwtfnvfbgoXbIxnuTxOtl31Ezeg+sPD
	 ruNGrgmWUSlMRkc8vnU3WKa0FLcqEjkPRyhlMUn9JeBXBgflFMQ0eEoguwYR0wDN7L
	 Xe1Pq8J8t/alWg6qlJTXZeVt/JXIUbMTnwrVh8ZVKcCjrS8z7zoDYG6rVVmZkRHRE1
	 PIRKz7aj2TvKcJTrcGLUPWqgNmjludjTAyg5hRTYSnCw/2gSS4nXa6bVxMesNJjof5
	 axaMZACmpoJbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B4CA60724;
	Thu, 26 Feb 2026 20:44:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A180272
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2EF560719
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K2SObcR8trcg for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13BDB6064C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13BDB6064C
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D1618750D; Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 10:24:39 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4e294ae91078e46f104d997d22748afb896fbc92
X-Git-Newrev: 1c3edc704680863d3f64e290bb8a709b83a24fe9
X-Patchwork-Hint: ignore
Message-Id: <20260226204356.9D1618750D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] linux: make license
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1c3edc704680863d3f64e290bb8a709b83a24fe9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 0dc2b6a729..976892aba4 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -148,7 +148,7 @@ config BR2_LINUX_KERNEL_VERSION
 
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
