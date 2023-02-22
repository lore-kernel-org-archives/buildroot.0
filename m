Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8218C64EC7
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 17:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 889E3416FF;
	Wed, 22 Feb 2023 17:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 889E3416FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bsXUgdpSWRZt; Wed, 22 Feb 2023 17:11:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABA1641731;
	Wed, 22 Feb 2023 17:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABA1641731
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 03D151BF364
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA43F40545
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA43F40545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EVoZN1ZEsIgm for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D463C40CAF
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D463C40CAF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3A38867CA; Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:44:43 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 21691c1a49426e765ab5fb321ea7002d5b3bf6d5
X-Git-Newrev: 972ad2022e2757eb43d2cea328fc583fbfdaf408
X-Patchwork-Hint: ignore
Message-Id: <20230222170818.C3A38867CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
 toolchain/toolchain-buildroot: add comment about using virtual package
 infra
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

commit: https://git.buildroot.net/buildroot/commit/?id=972ad2022e2757eb43d2cea328fc583fbfdaf408
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
(cherry picked from commit abcecd737b198e8a1a48bf4533e5c2b8de8b8cf4)
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
