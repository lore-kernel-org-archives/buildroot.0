Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9B5CDB46B
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 23:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11DA06FA0A;
	Fri, 19 Jun 2026 23:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LYHoa2KQn84z; Fri, 19 Jun 2026 23:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38D906FA03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781910099;
	bh=mMHzb42foCL4mXZbCAPUtvrkgV9nocXeOPzvSc0e9Nk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XDvC3Vt7iMMgdfOmoXHcjSx6yLJxrpmSf+J7x5iejzCe9pRmQg9lXtc5iwZNryTZG
	 m2w3SknzF9qHCuEoOTiMFKHUUXPxxHm+xmCJM5WVe0gV83iL/qgbVcfSOwhJ1+PETw
	 0ryIoGAlP7UYxQfEevdskg8d4eg8nJrNBgQaDRM6X/CdmYLMWogUh81TqZIO2/lIrv
	 XGMY5/wBAkF7pkutbPKTnelqlEY3z5QFyIpI8i+vN9N+xCahnsAGaabg22LI+rzZtH
	 +zwEgr1uEUScuN0XOyWLgDNehr7/E/JrYZy8riMQYlQV1zvrDTQSxMww3oIUYxEEMt
	 0Y1xWkU76r/WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38D906FA03;
	Fri, 19 Jun 2026 23:01:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E82B2D06
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 23:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA2854004B
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 23:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wn7mdE4VKcuv for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 23:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B25CC42AE3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B25CC42AE3
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 23:01:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD8CC81931; Fri, 19 Jun 2026 23:01:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Jun 2026 00:57:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d06e45b67bb573f6ed5bf45ea0bef4acd01f2fb0
X-Git-Newrev: 33345d5bef081fdf912a422cdcd4279b82d34f04
X-Patchwork-Hint: ignore
Message-Id: <20260619230111.DD8CC81931@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/usbutils: fix comment
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/33345d5bef081fdf912a422cdcd4279b82d34f04
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit b94ada76083824475e92c51b14042dc8f2a66717 added "wchar,
dynamic library" to the package comment displayed when the package is not
available although the package does not depend on these features.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/usbutils/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
index fb37b8a9e3..4a54626991 100644
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_USBUTILS
 
 	  http://linux-usb.sourceforge.net/
 
-comment "usbutils needs libudev and a toolchain w/ threads, wchar, dynamic library, gcc >= 4.9"
+comment "usbutils needs libudev and a toolchain w/ threads, gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_PACKAGE_HAS_LIBUDEV || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
