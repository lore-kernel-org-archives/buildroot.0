Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE978C001E0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 19:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E22341C54;
	Thu, 10 Aug 2023 19:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E22341C54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gqgaFejAl04y; Thu, 10 Aug 2023 19:49:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7F3F4037A;
	Thu, 10 Aug 2023 19:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7F3F4037A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A337F1BF5A6
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 19:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 898B3821C5
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 19:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 898B3821C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R1Kbd_uyxRAe for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 19:49:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFCF5821A7
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 19:49:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFCF5821A7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE59885697; Thu, 10 Aug 2023 19:49:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Aug 2023 21:49:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 83671f395c68b5f0f6c7553c23649c34c8743255
X-Git-Newrev: 5cf69468751c0343a24d90e626265ef9306036d4
X-Patchwork-Hint: ignore
Message-Id: <20230810194923.AE59885697@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/musl: enable m68k with
 MMU
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

commit: https://git.buildroot.net/buildroot/commit/?id=5cf69468751c0343a24d90e626265ef9306036d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Support for m68k with MMU in musl was added in 2018 with
commit f81e44a0d96c88e052e51982f9fdd6fe0a212b46.

Tested with qemu_m68k_q800_defconfig.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/musl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/musl/Config.in b/package/musl/Config.in
index 34ffe8324a..5495ed3371 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_MUSL_ARCH_SUPPORTS
 	default y if BR2_arm
 	default y if BR2_armeb
 	default y if BR2_i386
+	default y if BR2_m68k_m68k
 	default y if BR2_microblaze
 	default y if BR2_mips
 	default y if BR2_mipsel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
