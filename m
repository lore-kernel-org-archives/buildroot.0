Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D76DFF8875
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 13:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3396784C64;
	Thu, 30 Apr 2026 13:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wafksMC2ia5C; Thu, 30 Apr 2026 13:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EB3D84C4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777556189;
	bh=AZf6nG/RIwBSdwYAHkwinu3iPLTQeCw7E9cXlw5bpCE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BzNti0dXJpU6JQwYL4/ewwW3p9LyMWImrc6tpkXbvDnzFNjN08k1nSvHqr1VrI1C6
	 gXuJGqHZs9BmfnNMmstp6bKtvVNdCbIUr9WJ/LVrnG39SW6iRYo0pTS2tSzoTfh5vC
	 A9KcqxllZTGaQZwfxZxIJVy5EBf850V8mAl+Y4pWX/bzyg3juESWF9RlKlZ9s07+rR
	 hStx98sc3dguhrIG72/flH63c1XPLv+UNWFLSEeW+KcOsJNOXgGPTPEbS4zLbOOhaw
	 okBPxJT21HO2Qx02KjycFuUO845EkHdNo8eQ+SCQZozZGE7vnM/2f8gEbfscgZ6XsG
	 +7R4VNOkMgQBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EB3D84C4F;
	Thu, 30 Apr 2026 13:36:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 820DB192
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 13:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73AEE428B8
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 13:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wz7nBGa3JTpr for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 13:36:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 935CB427AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 935CB427AC
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 13:36:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50D8783C94; Thu, 30 Apr 2026 13:36:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 13:59:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7a7a35f58c48652fa8fc0d62812e1d9a1e81ad5
X-Git-Newrev: 7653e616f96241b04586ecb4b612a219885d52dd
X-Patchwork-Hint: ignore
Message-Id: <20260430133626.50D8783C94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "kmod: workaround for microblaze ld
 bug"
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7653e616f96241b04586ecb4b612a219885d52dd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This reverts commit 0d81107f021bf2a663f102bace1e3f9590641170. The bug
the workaround is for was fixed in binutils 2.29.51 (first release
listed in bfd/ChangeLog after the fix), which is by now far older than
any version supported by Buildroot.

Compile tested with qemu_microblazeel_mmu_defconfig plus
BR2_PACKAGE_KMOD=y.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/kmod/kmod.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index db9b3cdf21..bcf65fd9be 100644
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
