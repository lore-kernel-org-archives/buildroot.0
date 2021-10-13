Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE33BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 16:15:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09A03611AD
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 16:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 09A03611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3D1760AD8;
	Wed, 13 Oct 2021 16:15:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_gizBhUvEDN; Wed, 13 Oct 2021 16:15:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4660E60AC6;
	Wed, 13 Oct 2021 16:15:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 289971BF2F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 16:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 253C1406F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 16:15:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N-RPcH32WB0R for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 16:15:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F1FE406E8
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 16:15:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1D0829557E; Wed, 13 Oct 2021 16:12:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 18:15:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ece6be60b8147d05c7c51fd49f64e0140399727
X-Git-Newrev: b00b9c865d21627a3059cdb95f977558d86ba22f
X-Patchwork-Hint: ignore
Message-Id: <20211013161235.1D0829557E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dtbocfg: depends on kernel
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

commit: https://git.buildroot.net/buildroot/commit/?id=b00b9c865d21627a3059cdb95f977558d86ba22f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit 9fc7b49ab193da55b0a72d27b5e0ea33245b4df0:

Makefile:587: *** linux is in the dependency chain of dtbocfg that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/449a731c0a1394c28f519e341ea145cb42af012d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dtbocfg/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dtbocfg/Config.in b/package/dtbocfg/Config.in
index c1e8318e5c..862dc0ccc5 100644
--- a/package/dtbocfg/Config.in
+++ b/package/dtbocfg/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DTBOCFG
 	bool "dtbocfg"
+	depends on BR2_LINUX_KERNEL
 	help
 	  dtbocfg, which stands for Device Tree Blob Overlay
 	  Configuration File System, was developed to serve
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
