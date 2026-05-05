Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E38ECD3427
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 21:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BFFD60B5B;
	Tue,  5 May 2026 21:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6tMBi11cERXW; Tue,  5 May 2026 21:20:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4037B60B63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778016031;
	bh=C0+maLAvLym0WYWUiaf0MbkLl/r3x7e51Mc94ZZ3ARA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M7nYuz68VeVBF9J3Ba18BIhzNUpH1xWcjcnDAHeNIcYUvIlWZ/slYUVrnuJvDzeY8
	 NguSu3j7A05DrAH7Qa8DfVyZWx801tjoRjH9d9kMCetzlL/bhkBSTxUVIX8MTX8XuM
	 QfjZi8Je21d8DTemUt9RMwVSumqp27PCJJqdR5u6X/T+UaPiKlo1gMVrZT9+RrglA8
	 9ZvSXEJj5mnpYAB8ag1cQHIGqOdcuaoAqzOQMiyteGmhO3XHt6oHoOxlhR4gpeSXBb
	 NEVMvQMDwFm0FIUE1dwpq0lKl/FD6YQXxa0+OoYsCq3bzpD54wp09gnltW6LE72MYy
	 kmJSUCOMj7DAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4037B60B63;
	Tue,  5 May 2026 21:20:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DD41317
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3C9040C28
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vmjdJlQ8fBWX for <buildroot@buildroot.org>;
 Tue,  5 May 2026 21:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 254B140B5C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 254B140B5C
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33CE7844DC; Tue,  5 May 2026 21:20:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 23:18:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74e7e07f83d6575f369295d17199ea488d87d233
X-Git-Newrev: 2367805ec2bfaaf702c63b7a29380d5aeb80984b
X-Patchwork-Hint: ignore
Message-Id: <20260505212026.33CE7844DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_f2fs: Kernel version
 bump LTS (6.18)
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2367805ec2bfaaf702c63b7a29380d5aeb80984b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/fs/test_f2fs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_f2fs.py b/support/testing/tests/fs/test_f2fs.py
index 5918fe8ca8..dee862a9e2 100644
--- a/support/testing/tests/fs/test_f2fs.py
+++ b/support/testing/tests/fs/test_f2fs.py
@@ -20,7 +20,7 @@ class TestF2FS(infra.basetest.BRTest):
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.27"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_DEFCONFIG=y
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
