Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EF7C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 19:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1490E404CB;
	Sat, 28 Oct 2023 19:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1490E404CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ammhofhq8Cmy; Sat, 28 Oct 2023 19:35:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5455741369;
	Sat, 28 Oct 2023 19:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5455741369
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 085AB1BF3C6
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89DD381AAC
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89DD381AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id efWfDgBVQt9x for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 19:34:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0CA883BED
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 19:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0CA883BED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A931785EFB; Sat, 28 Oct 2023 19:34:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 21:30:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4fc46f751c7cb3db3f4cbef10f67e5ab3d90135
X-Git-Newrev: cf2dcaa1ecede670a0bc54841652a0e3bea5c744
X-Patchwork-Hint: ignore
Message-Id: <20231028193446.A931785EFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/riscv64-elf-toolchain: add .hash
 file
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf2dcaa1ecede670a0bc54841652a0e3bea5c744
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host-riscv64-elf-toolchain package was missing a hash file, add it now.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
