Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C92C0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 16:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4CF860B8C;
	Sat, 12 Aug 2023 16:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4CF860B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VZ-fSnSvltsf; Sat, 12 Aug 2023 16:19:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09AC4605E3;
	Sat, 12 Aug 2023 16:19:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09AC4605E3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B71CA1BF577
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 16:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 771AC812FF
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 16:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 771AC812FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bE9crCS-jyvl for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 16:19:13 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08D5A812F6
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 16:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08D5A812F6
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 4FDB235208B5; Sat, 12 Aug 2023 18:19:09 +0200 (CEST)
Date: Sat, 12 Aug 2023 18:19:09 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNew/asuEOItVTZZ@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691857149; bh=5DUFVSlDtOTO5Sp/WqgZMo7DPafbeRqPY8UXDS5cQ+A=;
 h=Date:From:To:Subject:From;
 b=HU89EbV/4cwe0/Yzq8wo+8wDi6L1QLyMrORjX/nApsR7Y2clo9BvEf7gUB/RBcunk
 sesYchxYfar03y1dNpSs7xE3nAJFwWIAmJdwUL5wraFJTtPwjOmorC6ooa8rwlXTPV
 e84XQdsVa0IyH/liAY4M5UgF/ek0ycb08JvZPg+4ee69/PJiI10VDeH0th9pKMrdqu
 A6a6d7un5I99Sh/X9OS+aUY9UJ588/+G5qMn72RnPMCgJjcoVqRQuvKrtz1nUytvGJ
 SyvZQ+xg3gpRT4tfhlxJmLbfVFKetMStG+t9ZrJ+Pdlq8rvKhXf6c4K1l7S+cFUh3i
 +RChYO/QdqQYw==
Subject: [Buildroot] [PATCH] board/qemu/ppc64le-powernv8: fixup example
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use full relative pathes for rootfs and kernel, like in other
readme's.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 board/qemu/ppc64le-powernv8/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/ppc64le-powernv8/readme.txt b/board/qemu/ppc64le-powernv8/readme.txt
index 059f55fbc9..b57c97464a 100644
--- a/board/qemu/ppc64le-powernv8/readme.txt
+++ b/board/qemu/ppc64le-powernv8/readme.txt
@@ -1,5 +1,5 @@
 Run the emulation with:
 
-qemu-system-ppc64 -M powernv9 -kernel vmlinux -append "console=hvc0 rootwait root=/dev/nvme0n1" -device nvme,bus=pcie.3,addr=0x0,drive=drive0,serial=1234 -drive file=./rootfs.ext2,if=none,id=drive0,format=raw,cache=none -device e1000e,netdev=net0,mac=C0:FF:EE:00:01:03,bus=pcie.1,addr=0x0  -netdev user,id=net0 -serial mon:stdio -nographic # qemu_ppc64le_powernv8_defconfig
+qemu-system-ppc64 -M powernv9 -kernel output/images/vmlinux -append "console=hvc0 rootwait root=/dev/nvme0n1" -device nvme,bus=pcie.3,addr=0x0,drive=drive0,serial=1234 -drive file=output/images/rootfs.ext2,if=none,id=drive0,format=raw,cache=none -device e1000e,netdev=net0,mac=C0:FF:EE:00:01:03,bus=pcie.1,addr=0x0  -netdev user,id=net0 -serial mon:stdio -nographic # qemu_ppc64le_powernv8_defconfig
 
 The login prompt will appear in the terminal window.
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
