Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04033C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 15:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEBD04086C;
	Mon,  3 Jun 2024 15:57:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-Pk0P7Ar7oM; Mon,  3 Jun 2024 15:57:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 564B140894
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 564B140894;
	Mon,  3 Jun 2024 15:57:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AA781BF865
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 15:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 865D2812D2
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 15:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DUWy0t2S0F0J for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 15:57:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8ABC812BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8ABC812BE
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 15:57:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A254F7FDAE; Mon,  3 Jun 2024 15:57:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 17:16:20 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f1d4de8a73f6a639c0c6bd7f9d8f46c28eac9405
X-Git-Newrev: 107b3cb91c72e2ac498356407ad60667d61c897a
X-Patchwork-Hint: ignore
Message-Id: <20240603155719.A254F7FDAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/testing: lvm2:
 remove kernel config fragment
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

commit: https://git.buildroot.net/buildroot/commit/?id=107b3cb91c72e2ac498356407ad60667d61c897a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The lvm2 package now enables the required Kernel configuration. The
Kernel config fragment included in this test is no longer needed.

This commit removes it.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9339343111a54a2648953f0bace70b01a68c37ec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                                  |  1 -
 support/testing/tests/package/test_lvm2.py                  | 11 ++++-------
 support/testing/tests/package/test_lvm2/linux-lvm2.fragment |  2 --
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2fd801f55e..853d8d6c90 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1812,7 +1812,6 @@ F:	support/testing/tests/package/test_links/
 F:	support/testing/tests/package/test_lrzip.py
 F:	support/testing/tests/package/test_ltrace.py
 F:	support/testing/tests/package/test_lvm2.py
-F:	support/testing/tests/package/test_lvm2/
 F:	support/testing/tests/package/test_lzip.py
 F:	support/testing/tests/package/test_lsof.py
 F:	support/testing/tests/package/test_lz4.py
diff --git a/support/testing/tests/package/test_lvm2.py b/support/testing/tests/package/test_lvm2.py
index bdbae7a4ec..75ea3fa449 100644
--- a/support/testing/tests/package/test_lvm2.py
+++ b/support/testing/tests/package/test_lvm2.py
@@ -5,13 +5,11 @@ import infra.basetest
 
 
 class TestLvm2(infra.basetest.BRTest):
-    # This test creates a lvm2 volume. A specific Kernel need to be
-    # built with a config fragment enabling this support. This test
-    # also uses resize2fs from e2fsprogs.
-    kernel_fragment = \
-        infra.filepath("tests/package/test_lvm2/linux-lvm2.fragment")
+    # The lvm2 package has _LINUX_CONFIG_FIXUPS, so we cannot use
+    # the runtime test pre-built Kernel. We need to compile a Kernel
+    # to make sure it will include the required configuration.
     config = \
-        f"""
+        """
         BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
@@ -20,7 +18,6 @@ class TestLvm2(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.77"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
-        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
         BR2_PACKAGE_E2FSPROGS=y
         BR2_PACKAGE_E2FSPROGS_RESIZE2FS=y
diff --git a/support/testing/tests/package/test_lvm2/linux-lvm2.fragment b/support/testing/tests/package/test_lvm2/linux-lvm2.fragment
deleted file mode 100644
index 0fade167a3..0000000000
--- a/support/testing/tests/package/test_lvm2/linux-lvm2.fragment
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_MD=y
-CONFIG_BLK_DEV_DM=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
