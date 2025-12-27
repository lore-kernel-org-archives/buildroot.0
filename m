Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C4EE92722
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 23:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 039B960879;
	Sat, 27 Dec 2025 23:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M-l5MzwjIZYo; Sat, 27 Dec 2025 23:40:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3389B6084A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766878809;
	bh=97S9VIlkZpGVDR+qfBGmp4YYLKJE0oldO2P4IwTOseI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ER2EQA2whEhPFZv4vkHi0FdQN41mEyHpadhuhe7g5p9iNa9b74KKy/naqkIdZ/7D2
	 lnzVJA3SIFi1oljb1J64grQ9yRZTZk5AdKIvrwWBTQTsvhQaaNAvSPQeNp6JhYMt5M
	 LAZAaZ8CtZo7d4U/MERpJNTB7LbZmqPWr+jLqlyF0Y22Ot+5OnmilCCpIY579eKoEG
	 MMovtA4oio6D41/3ve+zG7CCyftqgBcjo2p9HDdX34Z32Piff7hdoWC1JA7SPddSAo
	 jW4455Ku1hALLmz7/dvrSD3xr2fEI4GXIknL1htThklVhMEuPC1/zu8swEvVAxl1Yu
	 yYggHhvlsQdLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3389B6084A;
	Sat, 27 Dec 2025 23:40:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98D41119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8757980F90
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDoex3DWoXjt for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E09980FAE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E09980FAE
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 602A187902; Sat, 27 Dec 2025 23:39:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 00:39:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4fc6e8637bd771478f132e1e5e23c6d0c483331e
X-Git-Newrev: 289b5aab18d68521c4faac1208066c8947aa6070
X-Patchwork-Hint: ignore
Message-Id: <20251227233954.602A187902@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: ddrescue: bump test
 kernel to 6.18.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=289b5aab18d68521c4faac1208066c8947aa6070
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_ddrescue.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_ddrescue.py b/support/testing/tests/package/test_ddrescue.py
index 042431eb7b..eb3f63ae53 100644
--- a/support/testing/tests/package/test_ddrescue.py
+++ b/support/testing/tests/package/test_ddrescue.py
@@ -17,7 +17,7 @@ class TestDdrescue(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.15"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.2"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
