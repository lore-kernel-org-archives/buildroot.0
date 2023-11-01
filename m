Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D71C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 10:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CC758135E;
	Wed,  1 Nov 2023 10:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CC758135E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CuRh3qGKb4SI; Wed,  1 Nov 2023 10:36:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CFFC814BA;
	Wed,  1 Nov 2023 10:36:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CFFC814BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EB1A1BF296
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 10:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAE484ECE1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 10:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAE484ECE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fh1qQeQ0jllm for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 10:36:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAB434ECE0
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 10:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAB434ECE0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C30AC862E8; Wed,  1 Nov 2023 10:36:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 11:35:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62b5ef354e66c5425636dd4fd849897f26bc995f
X-Git-Newrev: 8c16914c00e2f40b4e4addfb0d354f375b56d2de
X-Patchwork-Hint: ignore
Message-Id: <20231101103600.C30AC862E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/qemu/arm-vexpress-tz: fix info
 regarding Qemu enable=on
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c16914c00e2f40b4e4addfb0d354f375b56d2de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Qemu 6.0.0, a warning appear in the log if a short-form boolean
option is used. This was fixed by Romain for the main cmdline description
(see 04afe86cd7e8 ("board/qemu/arm-vexpress-tz: use enable=on")) but was
not updated in the alternate cmdlines for when using a dual console or
a GDB debug setup.

By the way, fix description mentioning qemu-system-arm command line option
-S that is an uppercase S, not a lower case s.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/qemu/arm-vexpress-tz/readme.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/qemu/arm-vexpress-tz/readme.txt b/board/qemu/arm-vexpress-tz/readme.txt
index 3036dd54ca..3e84fe6391 100644
--- a/board/qemu/arm-vexpress-tz/readme.txt
+++ b/board/qemu/arm-vexpress-tz/readme.txt
@@ -62,7 +62,7 @@ consoles over telnet connections:
 	-serial telnet:127.0.0.1:1235,server \
 	-serial telnet:127.0.0.1:1236,server \
 	-netdev user,id=vmnic -device virtio-net-device,netdev=vmnic \
-	-semihosting-config enable,target=native \
+	-semihosting-config enable=on,target=native \
 	-bios flash.bin
 
 QEMU is now waiting for the telnet connection. From another shell, open a
@@ -91,7 +91,7 @@ From a first shell:
 	-smp 1 -s -m 1024 -d unimp \
 	-serial stdio \
 	-netdev user,id=vmnic -device virtio-net-device,netdev=vmnic \
-	-semihosting-config enable,target=native \
+	-semihosting-config enable=on,target=native \
 	-bios flash.bin \
 	-S
 
@@ -123,7 +123,7 @@ Emulation has started, TF-A has loaded OP-TEE and U-boot images in memory and
 has booted OP-TEE. Emulation stopped at OP-TEE core entry.
 
 Note: QEMU hosts a GDB service listening to TCP port 1234, as set through
-qemu-system-arm command line option -s.
+qemu-system-arm command line option -S.
 
 Note: To build the GDB server, the following extra options have to be added to
 the Buildroot configuration:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
