Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F6DCD3439
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 21:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBC5240C4C;
	Tue,  5 May 2026 21:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id euusts00a1NY; Tue,  5 May 2026 21:20:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E67BC40C4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778016045;
	bh=/1TSQLG7VrxC5bBUlmIMb6sRQFPlODttgLtDvctfMPc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tAXv6511c8KS19D6USCzBhSWbWwjVCNtFAPMKUojV15S7qc/DO1bZ/sJEqDwGMK7S
	 7CRfzLs0esTE6WL4Okse4gipody61O0Bk82ovGtI9M5d/PL1HLA47kOaJ5lkQIxuHC
	 nX7Ufm1D5tnNicPBKBKTCpXqy/8k73qJHgm27Tly39CMn9DxJohvHlrguh15LUS5g6
	 yFi3RbMe3m8YVkhIw+HpzzbWI4TNKbs+B/dILFtjSRLfFtRQ+azUxLBL6q+U65EUJ5
	 uQtdvnJSiYHtaWy7nAT0VgFGLd2Mpg6Akem/uKIjoc9MqKcyZELmfCDxdvxpPJQAVm
	 7bpPctep3aOnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E67BC40C4D;
	Tue,  5 May 2026 21:20:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 108FA315
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AE4740C25
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85NHLqx7W5JY for <buildroot@buildroot.org>;
 Tue,  5 May 2026 21:20:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93AFF40C26
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93AFF40C26
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0C84845F8; Tue,  5 May 2026 21:20:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 23:18:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a03eaaecb3615910cb3550772bfcf8605d98e8c8
X-Git-Newrev: bef725272d5d4ed7b4b6e450c1448e98ff72afb0
X-Patchwork-Hint: ignore
Message-Id: <20260505212026.B0C84845F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_systemd: Bump kernel
 version to last LTS (6.18)
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bef725272d5d4ed7b4b6e450c1448e98ff72afb0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the Device Tree name for the vexpress platform to match the
new directory structure introduced in Linux 6.5.

Since kernel 6.5, the 'arch/arm/boot/dts/' directory was restructured
to avoid having thousands of files in a single folder. Device Trees
for ARM (32-bit) are now organized into subdirectories. For the
Versatile Express platform, the DTS file moved to the 'arm/'
subdirectory.

The build was failing with:

    make[3]: *** No rule to make target 'arch/arm/boot/dts/vexpress-v2p-ca9.dtb'. Stop.

Adjust BR2_LINUX_KERNEL_INTREE_DTS_NAME from "vexpress-v2p-ca9" to
"arm/vexpress-v2p-ca9".

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/init/test_systemd.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 41545cbeed..893cc17408 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -306,11 +306,11 @@ class InitSystemSystemdBaseOverlayfs():
         BR2_ROOTFS_OVERLAY="{}"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.202"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
         BR2_LINUX_KERNEL_DTS_SUPPORT=y
-        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/vexpress-v2p-ca9"
         """.format(infra.filepath("tests/init/systemd-factory"),
                    infra.filepath("conf/overlayfs-kernel-fragment.config"))
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
