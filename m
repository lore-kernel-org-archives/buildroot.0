Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4BBCD3439
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 21:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71DA960BDC;
	Tue,  5 May 2026 21:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5t1sn-XtboFr; Tue,  5 May 2026 21:20:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF8BA60BF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778016050;
	bh=ZMiYHHrNjtTBCkF1Je1I3IAqPTCOEn0Q8xvtlRKl0WI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gFpK0leUtBQK32ZCuA9NUjWtXgF+bpTjSXsf9FbIeN/5GKvM8AuClanAK73Kla+Wg
	 nq7qn1HvxkuFCO1Exgel0mSyhwJDU36/Z+6KWz48YjoAyONp61z6vUr6zSHltNdWWg
	 O6KmhEMsX0wN0W+sLOKTUBIvpY4K73HxJJ60rETOlnSrOFT75uX3v6CIO5cSlmFKNi
	 wEOu0s5CwiWy2Urb6JWwl9GMArVelajgRlvsqqJ3widYc1N/REObXuAtDARxI6enRA
	 Gdi+YsijYqdwZq914wwDHTsg/Uv6LbsB1Rv5dbrOY8VCprSB+18OSRq7am3d4bKsNv
	 C1njh8Gli9gXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF8BA60BF3;
	Tue,  5 May 2026 21:20:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EDC5315
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC80160B69
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cXSkx1heA71n for <buildroot@buildroot.org>;
 Tue,  5 May 2026 21:20:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80BDB60B61
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80BDB60B61
 for <buildroot@buildroot.org>; Tue,  5 May 2026 21:20:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DD4784673; Tue,  5 May 2026 21:20:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 23:18:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f65bfc6d80578c64c989541df6ad922d59836063
X-Git-Newrev: 6195e97d6e660c13eb3eaad612e1c182abfc8b18
X-Patchwork-Hint: ignore
Message-Id: <20260505212026.9DD4784673@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_lxc: Bump kernel
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6195e97d6e660c13eb3eaad612e1c182abfc8b18
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
 support/testing/tests/package/test_lxc.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_lxc.py b/support/testing/tests/package/test_lxc.py
index 0d03087a2c..5d5f2fb9b4 100644
--- a/support/testing/tests/package/test_lxc.py
+++ b/support/testing/tests/package/test_lxc.py
@@ -13,10 +13,10 @@ class TestLxc(infra.basetest.BRTest):
             BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
             BR2_LINUX_KERNEL=y
             BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-            BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.38"
+            BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
             BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
             BR2_LINUX_KERNEL_DTS_SUPPORT=y
-            BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+            BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/vexpress-v2p-ca9"
             BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
             BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
             BR2_INIT_SYSTEMD=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
