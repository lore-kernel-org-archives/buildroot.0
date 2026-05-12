Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA834CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92B7541ABD;
	Fri, 15 May 2026 13:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nUtdppQoyGd7; Fri, 15 May 2026 13:28:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC03041ABB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851724;
	bh=KOqRSfXg+8c3RnNJO4W6aHwMzNjttY8Q7VJxXOAcKeg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=knMabht69Nuh7yXkNHe0BVSqGQ+Ium2yFcmRhkIVD1VFaAJNkwpWecogS8+oI7hRX
	 v21QnXFO/4WJpXK80BDzpy4tw9BRHgEvTCMWvvTcnnecKz6a3WYEyq6VrINmbwsHPD
	 gxAiQZipRBWDPIahTdtgsqc+rol9vYQY6qs4l6W4srA/QFIYg7Ef54YbuNMKtYicb4
	 /MLLzzVxKGFxPn7Z9bwUMGt3Ubf83UTbqGtTqelibeeqMppdgcIAL7pgW90U8hOuA4
	 c7DPgQYVpz/cR/sbKnKRn+26Qoko61AvRkTxqKOvfkFwaxEcJn+VgPaiScu/HAQZ+f
	 njvXfOHTnbspQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC03041ABB;
	Fri, 15 May 2026 13:28:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DC7E36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3F8C61563
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFCF-eWvd5rX for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:28:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD1C161557
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD1C161557
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C06786356; Fri, 15 May 2026 13:28:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 15:42:08 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9a5119629d110d3992e221b93034ee959b3d50b9
X-Git-Newrev: 7f7e1848773042d3f28bddccc9dd7e0b26e84044
X-Patchwork-Hint: ignore
Message-Id: <20260515132816.1C06786356@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Revert "kmod: workaround
 for microblaze ld bug"
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7f7e1848773042d3f28bddccc9dd7e0b26e84044
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This reverts commit 0d81107f021bf2a663f102bace1e3f9590641170. The bug
the workaround is for was fixed in binutils 2.29.51 (first release
listed in bfd/ChangeLog after the fix), which is by now far older than
any version supported by Buildroot.

Compile tested with qemu_microblazeel_mmu_defconfig plus
BR2_PACKAGE_KMOD=y.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 7653e616f96241b04586ecb4b612a219885d52dd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/kmod/kmod.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index dfdd17b955..6cf2bcc4a7 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -17,12 +17,6 @@ KMOD_LICENSE_FILES = libkmod/COPYING
 
 KMOD_CPE_ID_VENDOR = kernel
 
-# --gc-sections triggers binutils ld segfault
-# https://sourceware.org/bugzilla/show_bug.cgi?id=21180
-ifeq ($(BR2_microblaze),y)
-KMOD_CONF_ENV += cc_cv_LDFLAGS__Wl___gc_sections=false
-endif
-
 # static linking not supported, see
 # https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=b7016153ec8
 KMOD_CONF_OPTS = --disable-static --enable-shared
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
