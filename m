Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BD5C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 13:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B342611ED;
	Tue,  6 Feb 2024 13:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B342611ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F-1Osd4GZ_V9; Tue,  6 Feb 2024 13:20:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61A3461203;
	Tue,  6 Feb 2024 13:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61A3461203
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6AA591BF5AD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65826822F1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:20:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wRsODYydS7ZV for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 13:20:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC28F822E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC28F822E6
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 13:20:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 962628705A; Tue,  6 Feb 2024 13:20:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 14:19:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b95111c2d47bfdb42ee20396f4722491fa27ffdd
X-Git-Newrev: e3b99c79d9dc5325f33353d3f66e7b0fb2c1cc15
X-Patchwork-Hint: ignore
Message-Id: <20240206132021.962628705A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: added marleen.vos@mind.be for
 boards/configs based on stm32mp15
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

commit: https://git.buildroot.net/buildroot/commit/?id=e3b99c79d9dc5325f33353d3f66e7b0fb2c1cc15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The buildroot manual says this kind of commit should be done together
with the actual changes made to a config/board. But since a number of
changes will follow for some boards and configs, it seemed more
logical to make a separate commit for this.

Signed-off-by: Marleen Vos <marleen.vos@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7a943d1762..94952f72a8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2089,6 +2089,12 @@ F:	board/qemu/riscv64-virt/
 F:	configs/qemu_riscv32_virt_defconfig
 F:	configs/qemu_riscv64_virt_defconfig
 
+N:	Marleen Vos <marleen.vos@mind.be>
+F:	board/stmicroelectronics/common/stm32mp157/
+F:	configs/avenger96_defconfig
+F:	configs/stm32mp157a_dk1_defconfig
+F:	configs/stm32mp157c_dk2_defconfig
+
 N:	Martin Bark <martin@barkynet.com>
 F:	board/raspberrypi/
 F:	configs/raspberrypi3_defconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
