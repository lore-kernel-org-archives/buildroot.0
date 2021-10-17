Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0D5C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 07:49:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E0D061152
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 07:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E0D061152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14812607D8;
	Sun, 17 Oct 2021 07:49:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nwW5CFogkskG; Sun, 17 Oct 2021 07:49:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F73E607D1;
	Sun, 17 Oct 2021 07:49:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 610D71BF2F8
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 07:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 509048186E
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 07:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dc26Ba5YRd_t for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 07:49:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2A5181831
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 07:49:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CDC0695C4F; Sun, 17 Oct 2021 07:46:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 09:43:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5eedd33368eedc22bbc542e870af677d0b3da834
X-Git-Newrev: b5a48f3584e39e05041666009b43075607daea24
X-Patchwork-Hint: ignore
Message-Id: <20211017074649.CDC0695C4F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wf111: add missing comment about
 kernel dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5a48f3584e39e05041666009b43075607daea24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a comment when kernel is not enabled (missing since the addition of
the package in commit 5b13fc05b37386e64b9f46515b57b5887ee357d9)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wf111/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/wf111/Config.in b/package/wf111/Config.in
index 8dd20a7cc5..bb4b1a5d03 100644
--- a/package/wf111/Config.in
+++ b/package/wf111/Config.in
@@ -19,6 +19,10 @@ config BR2_PACKAGE_WF111
 
 	  https://www.silabs.com/wireless/wi-fi/bluegiga-legacy-modules/device.wf111
 
+comment "wf111 needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+	depends on BR2_ARM_CPU_ARMV5 || BR2_ARM_CPU_ARMV7A || BR2_i386
+
 comment "wf111 needs a glibc toolchain"
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_ARM_CPU_ARMV5 || BR2_ARM_CPU_ARMV7A || BR2_i386
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
