Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4EBF5A8A3
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 17:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 330796103C;
	Mon, 20 Apr 2026 17:23:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BvMk9EJK6_Qe; Mon, 20 Apr 2026 17:23:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51F076107E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776705784;
	bh=6mKFkSAPYXaJASqpeteTbkW+nEcihXgKyvzO7YMhOfI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H9ZdiiQmZ7oNzqm94PQ/hy5yvLJ9VtzLhUAy65DR7T7wnkrJ269FppwFAE3Ceb6SR
	 bk0kBvaJ7vQl57Cb5xeWi+/2tUQy8qmcq/WOPO4zbLD7thILqxAb6AN153byKvKusR
	 hNfGeAMpetRTXkmme6uXMxMkyrC3KXXbRMwMBtmL3DpnBDa/s7FZKHdm60QGRZ/Sur
	 I3QA/FCDESpFjxK/vCh5t/xYDEfjBCA4PQYmDSvZVQ35B67goaFlSYU68Njnruy972
	 ZhjWeeGmT5aC8W8stGmpJnbD404TGOsZHiDOZaG2096WvQxeza2UakI9jRTdHM9vM7
	 hs+wLc7w6X6jA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51F076107E;
	Mon, 20 Apr 2026 17:23:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 053CA257
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE87582CAC
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:23:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n016n1fLeWeV for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 17:23:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E1E882BA1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E1E882BA1
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:23:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AAAA281F78; Mon, 20 Apr 2026 17:23:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Apr 2026 19:21:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b8d8e34e3ae87de081e931b1986d396f19627909
X-Git-Newrev: cd52acda141d621b6c5774defe1427be29fe6ac1
X-Patchwork-Hint: ignore
Message-Id: <20260420172301.AAAA281F78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: security bump to 2.41.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cd52acda141d621b6c5774defe1427be29fe6ac1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Security fixes:

 CVE-2026-27456 - mount(8) TOCTOU symlink attack via loop device.
   The SUID mount follows symlinks when resolving loop backing file
   paths. On systems where non-root users are permitted to mount loop
   devices (via 'user' option in fstab), this allows access to
   arbitrary files.

 CWE-190 - Integer overflow in libblkid parse_dos_extended().
   A crafted MBR disk image can cause uint32_t wraparound in EBR
   chain processing, causing reported partitions to not match the
   on-disk layout. Tools like udisks may then register a partition
   at logical sector 0.

Full release notes: https://www.kernel.org/pub/linux/utils/util-linux/v2.41/v2.41.4-ReleaseNotes

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/util-linux/util-linux.hash | 2 +-
 package/util-linux/util-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index eab8a0c3b5..5a5656212c 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/sha256sums.asc
-sha256  3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b50ec2b5799e58b  util-linux-2.41.3.tar.xz
+sha256  a8c213cc06048862602a42b2d299b340001f6d05c4407b549f3e03521df83688  util-linux-2.41.4.tar.xz
 # License files, locally calculated
 sha256  4c2db318192bda62f3f8fcf71488bb5e602ae4385eba281d711b46cc13a40bb3  README.licensing
 sha256  527f738966ca396cd5a68c1509390de2a780c6b614d9ee57f7544a6161938ed1  Documentation/licenses/COPYING.BSD-2-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 7617041a46..1271bc7dc0 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -8,7 +8,7 @@
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
 UTIL_LINUX_VERSION_MAJOR = 2.41
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).3
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).4
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
