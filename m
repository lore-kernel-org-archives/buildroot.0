Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72966C4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 13:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 256F88549A;
	Mon, 30 Oct 2023 13:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 256F88549A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JqILAP3-h_6y; Mon, 30 Oct 2023 13:09:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87FFD85410;
	Mon, 30 Oct 2023 13:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87FFD85410
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8E401BF2A9
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 13:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF52C85410
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 13:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF52C85410
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J998gLJQzLLa for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 13:09:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A4B48527E
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 13:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A4B48527E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 08DC0861A4; Mon, 30 Oct 2023 13:09:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 14:07:33 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 70cb03d1b0b03f7bd40016c52e7b02fb00179ab2
X-Git-Newrev: 33a967ed85c4a38a85e257a88fef5ef9b00e55cb
X-Patchwork-Hint: ignore
Message-Id: <20231030130901.08DC0861A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x]
 package/riscv64-elf-toolchain: add .hash file
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

commit: https://git.buildroot.net/buildroot/commit/?id=33a967ed85c4a38a85e257a88fef5ef9b00e55cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

The host-riscv64-elf-toolchain package was missing a hash file, add it now.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit cf2dcaa1ecede670a0bc54841652a0e3bea5c744)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/riscv64-elf-toolchain/riscv64-elf-toolchain.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/riscv64-elf-toolchain/riscv64-elf-toolchain.hash b/package/riscv64-elf-toolchain/riscv64-elf-toolchain.hash
new file mode 100644
index 0000000000..9f40da0941
--- /dev/null
+++ b/package/riscv64-elf-toolchain/riscv64-elf-toolchain.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  de2bb188300dc38d74103516ce5cfd1060dfd105e8a408e9e3991512cf27285e  riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-centos6.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
