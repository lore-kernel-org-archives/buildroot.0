Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D81C61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 13:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B811C40477;
	Mon,  6 Feb 2023 13:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B811C40477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eQCRaBjuUkJE; Mon,  6 Feb 2023 13:24:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB5B640459;
	Mon,  6 Feb 2023 13:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB5B640459
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18D651BF2A7
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F170381B3E
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F170381B3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QH_bdyG7kheX for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 13:23:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A82581BB2
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A82581BB2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4803983C23; Mon,  6 Feb 2023 13:23:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 14:22:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29c9b4435503d1b3130ce37dcab88c89156b1481
X-Git-Newrev: abcecd737b198e8a1a48bf4533e5c2b8de8b8cf4
X-Patchwork-Hint: ignore
Message-Id: <20230206132305.4803983C23@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/toolchain-buildroot: add comment
 about using virtual package infra
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

commit: https://git.buildroot.net/buildroot/commit/?id=abcecd737b198e8a1a48bf4533e5c2b8de8b8cf4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit "9a8ec9195c toolchain/toolchain-buildroot: migrate to virtual
package infrastructure" made the packages toolchain and
toolchain-buildroot to use the virtual package infra even they being
generic packages.
This works because on package/pkg-virtual.mk when a package do not
define neither _PROVIDES_ or _HAS_ symbols, only _IS_VIRTUAL is set to
YES and _VERSION and _SOURCE are set to empty before relaying the call
to inner-generic-package.

Add a comment explaining why the virtual package infra is used in these
cases.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-buildroot/toolchain-buildroot.mk | 3 +++
 toolchain/toolchain/toolchain.mk                     | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
index b30cc332d2..6da64b7c77 100644
--- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
@@ -14,4 +14,7 @@ TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-gcc-final
 
 TOOLCHAIN_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
 
+# Not really a virtual package, but we use the virtual package infra here so
+# both the build log and build directory look nicer (toolchain-buildroot-virtual
+# instead of toolchain-buildroot-undefined)
 $(eval $(virtual-package))
diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index 18f1dbea1a..ac60a7b248 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -47,4 +47,7 @@ endef
 TOOLCHAIN_POST_INSTALL_TARGET_HOOKS += TOOLCHAIN_GLIBC_COPY_NSSWITCH_FILE
 endif
 
+# Not really a virtual package, but we use the virtual package infra here so
+# both the build log and build directory look nicer (toolchain-virtual instead
+# of toolchain-undefined)
 $(eval $(virtual-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
