Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F3DCD8C8C
	for <buildroot@archiver.kernel.org>; Sun,  7 Jun 2026 21:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC90661129;
	Sun,  7 Jun 2026 21:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8icPfs89vfLe; Sun,  7 Jun 2026 21:54:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EAE66112E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780869248;
	bh=sbwDgPTUg0miYARjdpd6ls/Ld7wzmEGsrM4RvOS+FMI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Wm9FPG8Dmn+Ff/sjXpYKgUwnXiJCqVEAYdptrM9viaWa0kFU1eOvsc5s+hcQmRLL9
	 tkerAlWG2CKsfP5DOnxH10jMWbb6oCmtWZpGhIch8Dr0JaOO0c66w6AaHfh3KSHGHk
	 bH8kD/YZbKEiGTqvFP+KMB9oR8BMfz0yetN7EaGTL1zkBTEunIDU/GCfM6V0UHHonb
	 +270cWo0PYujHZALkXqualfQoMqiSE9xrzT659NAH5HjUIXE147B47CKCQGO3hBl5z
	 JcaSzjmjBMW3qZrwlBzfSd+Ekue341t18FxXnRdbuHutowCjZkvTfOJi8qT32Gnfr9
	 ee7nRRGrt9/EQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EAE66112E;
	Sun,  7 Jun 2026 21:54:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ECE6D2C1
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 21:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBD9E849CB
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 21:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xow--ex8pNp2 for <buildroot@buildroot.org>;
 Sun,  7 Jun 2026 21:54:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 089AC849C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 089AC849C9
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 21:54:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E487E87CF9; Sun,  7 Jun 2026 21:53:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Jun 2026 22:55:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bbb1e2c8df3d6eee107b64c949557009489aaaac
X-Git-Newrev: 5df3d6493973831e45530691802cd3d8ff2826b2
X-Patchwork-Hint: ignore
Message-Id: <20260607215348.E487E87CF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestOpenJdk: fix test by
 using bootlin toolchain
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5df3d6493973831e45530691802cd3d8ff2826b2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The OpenJdk runtime test doesn't build since the last ARM aarch64
toolchain version bump [1]. Indded the OpenJdk 21 code base is not
yet ready for such bleeding edge toolchain using gcc 15. We need
to add OpenJdk 25 [2] or use the latest OpenJdk 21.0.9 release [3]
to build with the latest ARM aarch64 toolchain.

As a short term solution, switch to the Bootlin Glibc stable
toolchain.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14696526185 (TestOpenJdk)

[1] 8d413d61792724877bfd886fe3ba519fb5259566
[2] https://patchwork.ozlabs.org/project/buildroot/patch/20260221164020.318115-1-thomas@devoogdt.com/
[3] https://tracker.debian.org/news/1661321/accepted-openjdk-21-21095ea-1-source-into-unstable/

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_openjdk.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/testing/tests/package/test_openjdk.py b/support/testing/tests/package/test_openjdk.py
index d57bc0a711..dd1456d365 100644
--- a/support/testing/tests/package/test_openjdk.py
+++ b/support/testing/tests/package/test_openjdk.py
@@ -10,6 +10,8 @@ class TestOpenJdk(infra.basetest.BRTest):
         """
         BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
