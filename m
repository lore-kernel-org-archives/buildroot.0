Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206E7C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B54FA40118;
	Tue,  4 Jan 2022 17:17:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9J23BD8yHPU9; Tue,  4 Jan 2022 17:17:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A709C40166;
	Tue,  4 Jan 2022 17:17:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7033C1BF9B2
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B1BE827A1
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vhqf--heqoyB for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:17:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 971CD81412
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:17:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0DD4C82E00; Tue,  4 Jan 2022 17:11:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 4 Jan 2022 17:52:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee6477095a61a46ad66209f4fd14eaca12b51576
X-Git-Newrev: 7c1c0de0bdb6b2ff618cbebf9e5b8070bf561562
X-Patchwork-Hint: ignore
Message-Id: <20220104171106.0DD4C82E00@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kexec: bump to version 2.0.23
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c1c0de0bdb6b2ff618cbebf9e5b8070bf561562
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://www.spinics.net/lists/kexec/msg27693.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ls-Remove-duplicate-definition-of-ramdisk.patch | 32 ----------------------
 package/kexec/kexec.hash                           |  2 +-
 package/kexec/kexec.mk                             |  2 +-
 3 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/package/kexec/0001-kexec-tools-Remove-duplicate-definition-of-ramdisk.patch b/package/kexec/0001-kexec-tools-Remove-duplicate-definition-of-ramdisk.patch
deleted file mode 100644
index 173323bff8..0000000000
--- a/package/kexec/0001-kexec-tools-Remove-duplicate-definition-of-ramdisk.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 5e7ce27626a44428c01e0e5ab3fe60ef98ca788c Mon Sep 17 00:00:00 2001
-From: Petr Tesarik <ptesarik@suse.cz>
-Date: Mon, 26 Apr 2021 15:29:51 +0200
-Subject: kexec-tools: Remove duplicate definition of ramdisk
-
-The ramdisk variable is defined in kexec/arch/ppc/kexec-ppc.c. This
-other definition is not needed and breaks build with -fno-common.
-
-Signed-off-by: Petr Tesarik <ptesarik@suse.com>
-Signed-off-by: Simon Horman <horms@verge.net.au>
-[Retrieved from:
-https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=5e7ce27626a44428c01e0e5ab3fe60ef98ca788c]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- kexec/arch/ppc/kexec-elf-ppc.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/kexec/arch/ppc/kexec-elf-ppc.c b/kexec/arch/ppc/kexec-elf-ppc.c
-index ad43ad1..4a4886e 100644
---- a/kexec/arch/ppc/kexec-elf-ppc.c
-+++ b/kexec/arch/ppc/kexec-elf-ppc.c
-@@ -33,7 +33,6 @@
- static const int probe_debug = 0;
- 
- unsigned char reuse_initrd;
--const char *ramdisk;
- int create_flatten_tree(struct kexec_info *, unsigned char **, unsigned long *,
- 			char *);
- 
--- 
-cgit 1.2.3-1.el7
-
diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index 1cf860d85e..05eb9e3d02 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
-sha256  96c97f49ed86049f8b72722cb53e7fe3693e5a4f31e78a3a6249e3d18dac49c2  kexec-tools-2.0.22.tar.xz
+sha256  aa63cd6c7dd95b06ceba6240a7fdc6792789cada75a655e6714987175224241b  kexec-tools-2.0.23.tar.xz
 # locally calculated
 sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  COPYING
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 81d35815d8..b3b4e56546 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.22
+KEXEC_VERSION = 2.0.23
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
