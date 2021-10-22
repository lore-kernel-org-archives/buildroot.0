Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42EAC433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 18:50:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67AC06103E
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 18:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67AC06103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0703660F70;
	Fri, 22 Oct 2021 18:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PIJTQanuegsQ; Fri, 22 Oct 2021 18:50:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E5C860F6E;
	Fri, 22 Oct 2021 18:50:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 553D21C1127
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 18:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4071E4069F
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 18:49:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bj5IJRLAXqPc for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 18:49:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B00B4019B
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 18:49:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 15A8D884A5; Fri, 22 Oct 2021 18:46:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 20:42:49 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 789a012d435ee8a775bad1d3ab258a5e3462acb2
X-Git-Newrev: 13d499c3b01aaceecf6f3536c9683cf03bad8b4d
X-Patchwork-Hint: ignore
Message-Id: <20211022184640.15A8D884A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/wf111: add
 missing comment about kernel dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=13d499c3b01aaceecf6f3536c9683cf03bad8b4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Add a comment when kernel is not enabled (missing since the addition of
the package in commit 5b13fc05b37386e64b9f46515b57b5887ee357d9)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b5a48f3584e39e05041666009b43075607daea24)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
