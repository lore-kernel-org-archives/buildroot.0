Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBB8CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7BAA842C7;
	Fri, 15 May 2026 13:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDDdbR_7orn6; Fri, 15 May 2026 13:30:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B92BF842A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851813;
	bh=L2RU9QTM0ChInYwmy3AcX8yuNeacRix5YxouTQXyh1Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MZJ5SBFwCim+IE/w/SOA3B3oqGEEuzVfJHoAYXx7LgcW5s1n6t5rMTbJeJ5r27Den
	 As4AGzLCtVX5qSXe6WZVu1HKkzWAXzknbrG4+g41xawimD7nKg19kBH8DGrOMNj9yS
	 piWCYjvlu5C+q+tyL6U0GgPqH205XLQ3nuWAtBIOOvD+Bz66ahxjBeiRrhTmv/B6/r
	 PjeX77ogxPite5jrHTvRZUtxsNpRB6v9+MYW3vul/4YziefCSZ277dqVWFDrN6XR+Y
	 OBEdeMYw5jQj83riY9SfntY6Xs3Tm3rFAZDLZUpnXzAX4hViCmeDZVwXQewqIwScF7
	 8jdyqLLDjOuqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B92BF842A0;
	Fri, 15 May 2026 13:30:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 161AF42B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9257361558
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81xZ2f6BacgM for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 454106156D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 454106156D
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9949B86354; Fri, 15 May 2026 13:29:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 15:42:11 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 36bc94ee79df2219bec22dec6ccbf152ba953e11
X-Git-Newrev: aa938fe6977dabc070d2da01b30f17b3aa3d4012
X-Patchwork-Hint: ignore
Message-Id: <20260515132948.9949B86354@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] Revert "kmod: workaround
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aa938fe6977dabc070d2da01b30f17b3aa3d4012
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
index cbf89bca9d..e1d88af18f 100644
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
