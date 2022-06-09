Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D49C43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BB7360687;
	Thu,  9 Jun 2022 20:50:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l-xnZ27jQva8; Thu,  9 Jun 2022 20:50:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6084160672;
	Thu,  9 Jun 2022 20:50:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 725901BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E32B60672
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:50:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XIEjSum6Qjts for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:50:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2CF96060A
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:50:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D6A3E86F36; Thu,  9 Jun 2022 20:38:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Jun 2022 22:49:09 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c29660ff2c0b2606097fdc6ada645527052dafb1
X-Git-Newrev: 4e5544983d53c902b7bbac65b89720fb665b721c
X-Patchwork-Hint: ignore
Message-Id: <20220609203815.D6A3E86F36@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] boot/at91dataflashboot:
 disable on armeb
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e5544983d53c902b7bbac65b89720fb665b721c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

at91dataflashboot fails to build on armeb:

/nvmedata/autobuild/instance-6/output-1/per-package/at91dataflashboot/host/bin/armeb-buildroot-linux-uclibcgnueabi-ld -T elf32-littlearm.lds -Ttext 0 -n -o DataflashBoot-1.05.out objs/cstartup_ram.o objs/at45.o objs/com.o objs/dataflash.o objs/div0.o objs/init.o objs/main.o objs/stdio.o objs/asm_isr.o objs/jump.o objs/_udivsi3.o objs/_umodsi3.o objs/led.o
/nvmedata/autobuild/instance-6/output-1/per-package/at91dataflashboot/host/bin/armeb-buildroot-linux-uclibcgnueabi-ld: objs/cstartup_ram.o: compiled for a big endian system and target is little endian

Fixes:
 - http://autobuild.buildroot.org/results/e44c042abc1dfb97b4f8a17389d27f842e9dd311

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 6008e96cbb34d28d35077dddde8cd8951d0893d0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/at91dataflashboot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/at91dataflashboot/Config.in b/boot/at91dataflashboot/Config.in
index 4055f96410..8b37d84409 100644
--- a/boot/at91dataflashboot/Config.in
+++ b/boot/at91dataflashboot/Config.in
@@ -1,3 +1,3 @@
 config BR2_TARGET_AT91DATAFLASHBOOT
 	bool "AT91 DataFlashBoot"
-	depends on BR2_arm926t
+	depends on BR2_arm && BR2_arm926t
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
