Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EA6C7619A
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 21:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B62B81E45;
	Sun, 26 Mar 2023 21:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B62B81E45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3GAtM4PE9IkC; Sun, 26 Mar 2023 21:11:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A111181E2A;
	Sun, 26 Mar 2023 21:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A111181E2A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B1341BF309
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 21:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52E8881E2A
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 21:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52E8881E2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MaUPIlkmEnFm for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 21:11:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74B7A81E22
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 21:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74B7A81E22
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63F0683233; Sun, 26 Mar 2023 21:11:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Mar 2023 23:10:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5e94221974326685dba526397747658c28bba4e
X-Git-Newrev: 7ad6dd20ffe6cfb57133cef5f1fdd0716339172f
X-Patchwork-Hint: ignore
Message-Id: <20230326211147.63F0683233@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/multipath-tools: enable with musl
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7ad6dd20ffe6cfb57133cef5f1fdd0716339172f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now LVM2 can be built using musl drop the toolchain config
restriction.

Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/multipath-tools/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/multipath-tools/Config.in b/package/multipath-tools/Config.in
index fc4b01b2ac..222f78b86c 100644
--- a/package/multipath-tools/Config.in
+++ b/package/multipath-tools/Config.in
@@ -1,14 +1,12 @@
-comment "multipath-tools needs udev and a uClibc or glibc toolchain w/ threads, dynamic library"
+comment "multipath-tools needs udev and a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || !BR2_PACKAGE_HAS_UDEV
 
 config BR2_PACKAGE_MULTIPATH_TOOLS
 	bool "multipath-tools"
 	depends on !BR2_STATIC_LIBS
-	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
