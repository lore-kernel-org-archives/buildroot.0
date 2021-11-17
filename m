Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F68DC433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:09:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4E8E61BA1
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 21:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4E8E61BA1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAFF5404A9;
	Wed, 17 Nov 2021 21:09:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mEyWEGKM4zgj; Wed, 17 Nov 2021 21:09:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BF374027B;
	Wed, 17 Nov 2021 21:09:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9201A1BF307
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8164260A85
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 21:09:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T57X_mcCeUIO for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 21:09:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCE3260A82
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 21:09:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CD37C8D501; Wed, 17 Nov 2021 21:05:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 22:09:01 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: f1f1a0fd9bfb7644dc4a6a6c0ca587762e298928
X-Git-Newrev: e1cc45314969ff78d1c3a453c5510a9fa67148ca
X-Patchwork-Hint: ignore
Message-Id: <20211117210510.CD37C8D501@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] support/testing:
 test_openssh: use Bootlin stable toolchain
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1cc45314969ff78d1c3a453c5510a9fa67148ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The commit backported by [1] enabled the Bootlin bleeding-edge
toolchain providing 5.4 kernel headers but the openssh test
still use a 4.19 prebuilt kernel. Indeed the prebuilt kernel
has been updated to 5.10 in Buildroot 2021.08 [2].

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/1780867274

[1] 8d4939c9e0342d8b99d863fbdcaf935d42038469
[2] https://git.buildroot.net/buildroot/commit/?id=3cf2782906d5cc05a3966c25518d2ce01f11afc8

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_openssh.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/package/test_openssh.py b/support/testing/tests/package/test_openssh.py
index fe517e8da1..79e07e66d7 100644
--- a/support/testing/tests/package/test_openssh.py
+++ b/support/testing/tests/package/test_openssh.py
@@ -51,6 +51,7 @@ class TestOpenSshGlibc(TestOpensshBase):
         BR2_arm=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
         BR2_PACKAGE_RNG_TOOLS=y
         BR2_TARGET_ROOTFS_CPIO=y
         """
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
