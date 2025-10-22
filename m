Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C774ACCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DADB613D4;
	Wed, 22 Oct 2025 16:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdtGcxDYkjsL; Wed, 22 Oct 2025 16:37:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D48A61395
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D48A61395;
	Wed, 22 Oct 2025 16:37:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AA1FDE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99C8C4115A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQ1LYTkETPUF for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:36:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12B8B4118F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12B8B4118F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:36:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10B7987722; Wed, 22 Oct 2025 16:36:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:35:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8b2b392f9d2d681244596ed540fc6389b608df93
X-Git-Newrev: 00f3ab0c75255150827ee1dba1ad9fd5f40b24c0
X-Patchwork-Hint: ignore
Message-Id: <20251022163635.10B7987722@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/micropython: use
 append-assignment in conditional code
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=00f3ab0c75255150827ee1dba1ad9fd5f40b24c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since its inception in 9646e80fca28 (micropython: new package), the
ppc-specific CFLAGS are simply assigned, and since 9fd9f4e6752f
(package/micropython: define MICROPY_NLR_SETJMP for xtensa), the same
goes for the xtensa CFLAGS.

Although they are mutually exclusive (different archs) and that there is
no prior assignment, the customs are to use append assignment in
conditional blocks, to avoid accidentally overwriting a valure set
previously.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit be4fb117bc7dc078c2097fe0eae6bbbfab0c465b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/micropython/micropython.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index e1e1f88d51..826247069e 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -21,12 +21,12 @@ MICROPYTHON_IGNORE_CVES += CVE-2024-8947
 # Use fallback implementation for exception handling on architectures that don't
 # have explicit support.
 ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb),)
-MICROPYTHON_CFLAGS = -DMICROPY_GCREGS_SETJMP=1
+MICROPYTHON_CFLAGS += -DMICROPY_GCREGS_SETJMP=1
 endif
 
 # xtensa has problems with nlr_push, use setjmp based implementation instead
 ifeq ($(BR2_xtensa),y)
-MICROPYTHON_CFLAGS = -DMICROPY_NLR_SETJMP=1
+MICROPYTHON_CFLAGS += -DMICROPY_NLR_SETJMP=1
 endif
 
 # https://github.com/micropython/micropython/issues/14115
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
