Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37D0C001E0
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 08:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAA578209B;
	Sat, 29 Jul 2023 08:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAA578209B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gIEKVjO8-lAz; Sat, 29 Jul 2023 08:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41189820C0;
	Sat, 29 Jul 2023 08:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41189820C0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E9BF1BF3FC
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 08:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0725F41583
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 08:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0725F41583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qZbzqi5-PNOJ for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 08:52:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BABE74156C
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 08:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BABE74156C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A253D828C2; Sat, 29 Jul 2023 08:52:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 10:51:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff14f0ee5ac461b7b9cfd267c9230df1a63dac17
X-Git-Newrev: 9214f2872a9111340688d199e5b2fef9beb6b097
X-Patchwork-Hint: ignore
Message-Id: <20230729085205.A253D828C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mono: allow building for aarch64
 targets
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

commit: https://git.buildroot.net/buildroot/commit/?id=9214f2872a9111340688d199e5b2fef9beb6b097
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add aarch64 to BR2_PACKAGE_MONO_ARCH_SUPPORTS to allow building for
aarch64 targets.

Compiles successfully and runs on the actual target (imx8mp based
board)

Signed-off-by: Stefan Mayrhofer <stefan@familie-mayrhofer.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mono/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mono/Config.in b/package/mono/Config.in
index 76178bcf9b..0152df8268 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -5,8 +5,8 @@ config BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS
 
 config BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	bool
-	default y if (BR2_arm || BR2_armeb || BR2_i386 || \
-		      BR2_powerpc || BR2_x86_64)
+	default y if (BR2_aarch64 || BR2_arm || BR2_armeb || \
+		      BR2_i386 || BR2_powerpc || BR2_x86_64)
 	depends on BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
