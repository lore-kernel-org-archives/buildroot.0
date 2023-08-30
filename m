Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D9BC6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 11:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76AD641C03;
	Wed, 30 Aug 2023 11:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76AD641C03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nPderiyn17dZ; Wed, 30 Aug 2023 11:05:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F20241DD0;
	Wed, 30 Aug 2023 11:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F20241DD0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E43561BF282
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB558611C1
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB558611C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vUPl7-N5l7bW for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 11:03:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48190611A5
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 11:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48190611A5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3729D86585; Wed, 30 Aug 2023 11:03:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 12:49:10 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: f264dc796ca166d23662cdb0e3741dde722a0b38
X-Git-Newrev: 6695c97334d4be52370d78774eb39223257298de
X-Patchwork-Hint: ignore
Message-Id: <20230830110347.3729D86585@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/wolfssl: disable
 asm on armv4
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

commit: https://git.buildroot.net/buildroot/commit/?id=6695c97334d4be52370d78774eb39223257298de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Quoting
https://developer.arm.com/documentation/dui0489/i/arm-and-thumb-instructions/clz
"This ARM instruction is available in ARMv5T and above."

Fixes:
- armeb
  http://autobuild.buildroot.net/results/ea9/ea9b19e872b4b20b97fceec3f7e0a6a1109c4f12/
  /tmp/ccdRCOaB.s:27: Error: selected processor does not support `clz r5,r2' in ARM mode
- arm
  http://autobuild.buildroot.net/results/cb1/cb1c7ac68b3379d3f4b5efc897198bea0a904217/
  /tmp/cc72ECAj.s:6764: Error: selected processor does not support `clz r5,r0' in ARM mode
  /tmp/cc72ECAj.s:7110: Error: selected processor does not support `clz r5,lr' in ARM mode
  /tmp/cc72ECAj.s:8934: Error: selected processor does not support `clz r5,fp' in ARM mode

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4c663675646264e9bb1e72f014195081a1582d19)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wolfssl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wolfssl/Config.in b/package/wolfssl/Config.in
index c41bdb6888..9d173412fe 100644
--- a/package/wolfssl/Config.in
+++ b/package/wolfssl/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_WOLFSSL_ASM_SUPPORTS
 	bool
 	default y if BR2_aarch64
-	default y if BR2_arm || BR2_armeb
+	default y if (BR2_arm || BR2_armeb) && !BR2_ARM_CPU_ARMV4 # clz
 	default y if BR2_powerpc
 	default y if BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_mips64 && !BR2_MIPS_CPU_MIPS32R6
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
