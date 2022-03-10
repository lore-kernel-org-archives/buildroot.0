Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19951C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 21:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA1B381455;
	Thu, 10 Mar 2022 21:28:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uK-wypNEIzw5; Thu, 10 Mar 2022 21:28:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 009BA813E5;
	Thu, 10 Mar 2022 21:28:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 482A31C113E
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BA6040B8E
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 21:27:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hgFw8L6YwbZX for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 21:27:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4391540132
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 21:27:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AC8FA83C1A; Thu, 10 Mar 2022 21:18:43 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 22:09:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cec0fabf14527716c55f8d5496829667bfef8c6a
X-Git-Newrev: 249ce1c584815c42a52a3c4932a9546fd5b980a0
X-Patchwork-Hint: ignore
Message-Id: <20220310211843.AC8FA83C1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/gen-bootlin-toolchains:
 add s390x toolchain
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

commit: https://git.buildroot.net/buildroot/commit/?id=249ce1c584815c42a52a3c4932a9546fd5b980a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

s390x support has been added since toolchain-builder release
2021.05 [1].

[1] https://github.com/bootlin/toolchains-builder/commit/4bbb52a6a30a340a30722bc170467aa6fa4adbe6

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/gen-bootlin-toolchains | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index dc173fa949..f9dd9da9a8 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -162,6 +162,10 @@ arches = {
         'conditions': ['BR2_riscv', 'BR2_riscv_g', 'BR2_RISCV_64', 'BR2_RISCV_ABI_LP64D'],
         'prefix': 'riscv64',
     },
+    's390x-z13': {
+        'conditions': ['BR2_s390x', 'BR2_s390x_z13'],
+        'prefix': 's390x',
+    },
     'sh-sh4': {
         'conditions': ['BR2_sh', 'BR2_sh4'],
         'prefix': 'sh4',
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
