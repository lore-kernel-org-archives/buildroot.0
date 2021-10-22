Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12D2C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 18:50:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EE0D6103D
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 18:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7EE0D6103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56BD360F63;
	Fri, 22 Oct 2021 18:50:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16wyv06Xz6qi; Fri, 22 Oct 2021 18:50:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5FF160F5F;
	Fri, 22 Oct 2021 18:50:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BF6B1BF29D
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 18:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 390AF60640
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 18:49:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h2nLb1dUELP0 for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 18:49:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8038E60619
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 18:49:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0AC11884A4; Fri, 22 Oct 2021 18:46:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 20:42:11 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 372cc4e9f1c4befdc0e855fc7204f23d939e0800
X-Git-Newrev: 789a012d435ee8a775bad1d3ab258a5e3462acb2
X-Patchwork-Hint: ignore
Message-Id: <20211022184640.0AC11884A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x]
 package/wireguard-linux-compat: add missing comment about kernel dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=789a012d435ee8a775bad1d3ab258a5e3462acb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Add a comment when kernel is not enabled (missing since the addition of
the package in commit de591c5c3a93a40d049a32bd79c30cc66daf5fb2)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5eedd33368eedc22bbc542e870af677d0b3da834)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-linux-compat/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/wireguard-linux-compat/Config.in b/package/wireguard-linux-compat/Config.in
index 5a323a35e5..4e8e95bdc3 100644
--- a/package/wireguard-linux-compat/Config.in
+++ b/package/wireguard-linux-compat/Config.in
@@ -21,6 +21,9 @@ config BR2_PACKAGE_WIREGUARD_LINUX_COMPAT
 
 	  https://www.wireguard.com
 
+comment "wireguard-linux-compat needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
 comment "wireguard-linux-compat needs a toolchain w/ headers >= 3.10"
 	depends on BR2_LINUX_KERNEL
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
