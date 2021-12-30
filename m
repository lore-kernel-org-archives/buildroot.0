Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56618C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 17:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F54660BE7;
	Thu, 30 Dec 2021 17:51:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tL0f9mM_CE49; Thu, 30 Dec 2021 17:51:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81C6D60B8A;
	Thu, 30 Dec 2021 17:51:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4FC161C1135
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AB5940537
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 17:51:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0B4fDvoUGMOQ for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 17:51:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 787E5404FA
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 17:51:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2A23482B97; Thu, 30 Dec 2021 17:45:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 18:43:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 65d2f04c012af492a9b9da04dfa3b3cbd20347f1
X-Git-Newrev: bbfcb19c556d618fd024458cda28fb1d3096f199
X-Patchwork-Hint: ignore
Message-Id: <20211230174512.2A23482B97@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/gen-bootlin-toolchains:
 handle RISC-V 64-bit toolchain change
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

commit: https://git.buildroot.net/buildroot/commit/?id=bbfcb19c556d618fd024458cda28fb1d3096f199
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

toolchains.bootlin.com no longer provides a LP64 RISC-V 64-bit
toolchain, but a more useful LP64D RISC-V 64-bit toolchain. Of course,
the old tarballs remain available, but no new versions of the LP64
toolchain will be produced.

This commit reflects this change in the gen-bootlin-toolchains script.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/gen-bootlin-toolchains | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 902b7795ee..f160a44152 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -158,8 +158,8 @@ arches = {
         'conditions': ['BR2_riscv', 'BR2_riscv_g', 'BR2_RISCV_32', 'BR2_RISCV_ABI_ILP32D'],
         'prefix': 'riscv32',
     },
-    'riscv64': {
-        'conditions': ['BR2_riscv', 'BR2_riscv_g', 'BR2_RISCV_64', 'BR2_RISCV_ABI_LP64'],
+    'riscv64-lp64d': {
+        'conditions': ['BR2_riscv', 'BR2_riscv_g', 'BR2_RISCV_64', 'BR2_RISCV_ABI_LP64D'],
         'prefix': 'riscv64',
     },
     'sh-sh4': {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
