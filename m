Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AEEC25B47
	for <buildroot@archiver.kernel.org>; Fri, 27 Oct 2023 08:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADDAC4333B;
	Fri, 27 Oct 2023 08:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADDAC4333B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LGT3WNApEnki; Fri, 27 Oct 2023 08:42:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8EC643342;
	Fri, 27 Oct 2023 08:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8EC643342
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B5541BF2C8
 for <buildroot@lists.busybox.net>; Fri, 27 Oct 2023 08:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5F914EED8
 for <buildroot@lists.busybox.net>; Fri, 27 Oct 2023 08:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5F914EED8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5tcb6cNY3zIx for <buildroot@lists.busybox.net>;
 Fri, 27 Oct 2023 08:42:06 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D9B44EEE4
 for <buildroot@buildroot.org>; Fri, 27 Oct 2023 08:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D9B44EEE4
Received: by mail.gandi.net (Postfix) with ESMTPSA id EAD0320004;
 Fri, 27 Oct 2023 08:42:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@48ers.dk>)
 id 1qwIPq-007ix6-2W; Fri, 27 Oct 2023 10:42:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 Oct 2023 10:41:59 +0200
Message-Id: <20231027084159.1841045-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH] package/riscv64-elf-toolchain: add .hash file
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The host-riscv64-elf-toolchain package was missing a hash file, add it now.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/riscv64-elf-toolchain/riscv64-elf-toolchain.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/riscv64-elf-toolchain/riscv64-elf-toolchain.hash

diff --git a/package/riscv64-elf-toolchain/riscv64-elf-toolchain.hash b/package/riscv64-elf-toolchain/riscv64-elf-toolchain.hash
new file mode 100644
index 0000000000..9f40da0941
--- /dev/null
+++ b/package/riscv64-elf-toolchain/riscv64-elf-toolchain.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  de2bb188300dc38d74103516ce5cfd1060dfd105e8a408e9e3991512cf27285e  riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-centos6.tar.gz
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
