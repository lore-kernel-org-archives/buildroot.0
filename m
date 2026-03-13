Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE933107BCE8
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 22:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B424340F25;
	Fri, 13 Mar 2026 22:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UZlvtS99Gr1a; Fri, 13 Mar 2026 22:50:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E540F40F0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773442247;
	bh=vLrGYXNZ5SV7lwqFvB1seaFz3R9QUf1XWN6KPu0Xiyg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qCkT0iVDc9jjnl9x47ViEXHGohMM3irp4tvQUBMdV8AlguWJnYtli3A56Nx6/KghG
	 jlx2ht+MhJY0qVckZXhOJLIiVYBUzV6pPo1T6zgP/mxsDIo0XNv7cpbk/IDy2KZt7a
	 kM+ugrvzDwtf21O2x1ZBrdcXz6OmcmtKEBHLUt+A9GJcdM6s/7Rk2SLl3BGxqZMI5P
	 O+Q8nEzsK/I24W7Gu+CktKqqt268eKiCA/XIHr7FEctH1s0lM5lsif2vOOZ7bXQhOR
	 /XRzqngkqy/nzS4Rmsvb3yEIeOhfIoSvyzywd75Vqe5XoK18qdRCDiZD7jgKIBQaO4
	 c9frNz/knW0rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E540F40F0F;
	Fri, 13 Mar 2026 22:50:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F9401B4
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1589940F0A
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqU5gPzoWruL for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 22:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F8BB40F04
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F8BB40F04
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9302F87394; Fri, 13 Mar 2026 22:50:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 23:29:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d603b78c05e132076ef9db1cf0cb3d16fd065ac
X-Git-Newrev: c03712d8ec3fcffadb9486084c1e92e4736059b0
X-Patchwork-Hint: ignore
Message-Id: <20260313225044.9302F87394@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_xfsprogs: use
 bootlin toolchain, update kernel
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c03712d8ec3fcffadb9486084c1e92e4736059b0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This commit updates the test configuration to switch to a Bootlin
external toolchain. This is needed to get newer toolchain kernel
headers required by newer xfsprogs versions.

xfsprogs upstream commit [1] (included in v6.15) introduced a usage
of the "capacity" field of zoned block devices, introduced in Kernel
commit [2], first included in v5.9.

This commit also updates the runtime test Kernel version
to the LTS 6.18.18. This is because the default filesystem options
of mkfs.xfs were updated in upstream commit [3] to include new
features supported in the new Kernel 6.18.y LTS series. The commit [3]
is included in xfsprogs v6.18.

[1] https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=48ccc2459039309cfbaf358febea53a86f07827c
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=82394db7383d33641f3f565bd79792fb41b1741f
[3] https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=54aad16b4b9b923442b4042afaba4438ca1aa868

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_xfsprogs.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_xfsprogs.py b/support/testing/tests/package/test_xfsprogs.py
index a3a4bd27d8..03191aa22b 100644
--- a/support/testing/tests/package/test_xfsprogs.py
+++ b/support/testing/tests/package/test_xfsprogs.py
@@ -12,10 +12,11 @@ class TestXfsProgs(infra.basetest.BRTest):
         f"""
         BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.37"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.18"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
