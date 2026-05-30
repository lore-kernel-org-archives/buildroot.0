Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E040ACD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B56C585469;
	Sat, 30 May 2026 21:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vJgylZtHecu; Sat, 30 May 2026 21:27:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 431588545C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780176477;
	bh=63DuJczHIB+aoUh1ZsXvL3P58ZKfPnG7TO9KbogEUQA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cqcmoWj+ZEVbUE13I8t3rVB0840P5yEyF4nLa+1TWIBD6xl0M0e5q2tpD/GsV9vpI
	 rIMoOsObpb7XLZDAHz414C1qOA0IS2NRAoAumhtv2E+86ErHYtKQcyVDcetnJFLqW0
	 1vYtpgkWgGFtLRgOF7StTVppdNA98tAo67nAx8nynA64K64CpggI3CvwqQ2CRYAOHt
	 8cXaKmlCr5sHljyBodsQNE4ZJYh9r7mN59NkXoTb4lJZEQ1WQqg7XNryDRiJlgm9ci
	 X5+m+tXDmhNeTwRZC0HJoqxK64VqHVQjS6OMzTXS5TZJjHWef3S5SokklVYJYcRmMz
	 V3DOvym6kwCSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 431588545C;
	Sat, 30 May 2026 21:27:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C489E356
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A91BB401D4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u6wgdMpvwzaK for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:27:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F286C4010F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F286C4010F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:27:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B16FD875F2; Sat, 30 May 2026 21:27:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 23:27:38 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9a43bf6593aa981040e5ab91e69946af4fe0cee2
X-Git-Newrev: 0c9e239bd364f63ff4df5b36c77285e1708924a5
X-Patchwork-Hint: ignore
Message-Id: <20260530212740.B16FD875F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing:
 test_libcamera.py: bump kernel to 6.18 LTS
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0c9e239bd364f63ff4df5b36c77285e1708924a5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

The Linux Kernel vimc driver became stricter on pixel format, after
upstream commit [1] (first included in Kernel v6.11). This commit
changes the RGB format to BGR, to request a supported format.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=4c46cb2a7f1d63fa7b027af05e0393e4fe9ccb52

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_libcamera.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_libcamera.py b/support/testing/tests/package/test_libcamera.py
index c785e340d6..6d83b0c55d 100644
--- a/support/testing/tests/package/test_libcamera.py
+++ b/support/testing/tests/package/test_libcamera.py
@@ -18,7 +18,7 @@ class TestLibCamera(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.76"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
@@ -76,5 +76,5 @@ class TestLibCamera(infra.basetest.BRTest):
 
         # Capture few frames.
         cmd = f"cam --camera {cam_idx} --capture=5"
-        cmd += " --stream width=160,height=120,role=video,pixelformat=RGB888"
+        cmd += " --stream width=160,height=120,role=video,pixelformat=BGR888"
         self.assertRunOk(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
