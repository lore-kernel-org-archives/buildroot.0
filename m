Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3087CCF9E3
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 20:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55B4F84304;
	Thu, 30 Oct 2025 20:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EX8dro05VjTc; Thu, 30 Oct 2025 20:01:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFDF5842F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFDF5842F5;
	Thu, 30 Oct 2025 20:01:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E9924160
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 20:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7E5161513
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 20:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dS9B5QDzXILf for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 20:01:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A30B261511
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A30B261511
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 20:01:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FE0782A1F; Thu, 30 Oct 2025 20:01:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 21:01:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6942ce78cbe3a6ec54366b5224650c4ddd40bf1
X-Git-Newrev: 0704df047673ce435ba4f3f150a46f9b02bacdf0
X-Patchwork-Hint: ignore
Message-Id: <20251030200156.8FE0782A1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: llama-cpp: new runtime
 test
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

commit: https://git.buildroot.net/buildroot/commit/?id=0704df047673ce435ba4f3f150a46f9b02bacdf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Joseph Kogut <joseph.kogut@gmail.com>
Reviewed-by: Joseph Kogut <joseph.kogut@gmail.com>
Tested-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                      |  1 +
 support/testing/tests/package/test_llama_cpp.py | 79 +++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f5c8b832f8..337b2c7ba3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1943,6 +1943,7 @@ F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_lighttpd.py
 F:	support/testing/tests/package/test_links.py
 F:	support/testing/tests/package/test_links/
+F:	support/testing/tests/package/test_llama_cpp.py
 F:	support/testing/tests/package/test_lrzip.py
 F:	support/testing/tests/package/test_lrzsz.py
 F:	support/testing/tests/package/test_ltp_testsuite.py
diff --git a/support/testing/tests/package/test_llama_cpp.py b/support/testing/tests/package/test_llama_cpp.py
new file mode 100644
index 0000000000..4462be0a5b
--- /dev/null
+++ b/support/testing/tests/package/test_llama_cpp.py
@@ -0,0 +1,79 @@
+import os
+
+import infra.basetest
+
+
+class TestLlamaCpp(infra.basetest.BRTest):
+    config = """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.55"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_PACKAGE_CA_CERTIFICATES=y
+        BR2_PACKAGE_OPENSSL=y
+        BR2_PACKAGE_LIBCURL=y
+        BR2_PACKAGE_LIBCURL_CURL=y
+        BR2_PACKAGE_LLAMA_CPP=y
+        BR2_PACKAGE_LLAMA_CPP_TOOLS=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="1024M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+    """
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.ext2")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(
+            arch="aarch64",
+            kernel=kern,
+            kernel_cmdline=["root=/dev/vda", "console=ttyAMA0"],
+            options=[
+                "-M", "virt",
+                "-cpu", "cortex-a57",
+                "-smp", "4",
+                "-m", "2G",
+                "-drive", f"file={img},if=virtio,format=raw",
+                "-net", "nic,model=virtio",
+                "-net", "user"
+            ]
+        )
+        self.emulator.login()
+
+    def test_run(self):
+        self.login()
+
+        # Check the program can execute.
+        self.assertRunOk("llama-cli --version")
+
+        # We define a Hugging Face model to be downloaded.
+        # We choose a relatively small model, for testing.
+        hf_model = "ggml-org/gemma-3-270m-it-GGUF"
+
+        # We define a common knowledge question to ask to the model.
+        prompt = "What is the capital of the United Kingdom?"
+
+        # We define an expected keyword, to be present in the answer.
+        expected_answer = "london"
+
+        # We set few llama-cli options:
+        # We don't want an interactive session
+        llama_opts = "--single-turn"
+        llama_opts += " --no-display-prompt"
+        # We set a fixed seed, to reduce variability of the test
+        llama_opts += " --seed 123456789"
+        llama_opts += f" --hf-repo {hf_model}"
+        llama_opts += f" --prompt '{prompt}'"
+
+        # Run the command. We suppress all stderr output logs to get
+        # only the answer. Remove the redirection for debugging.
+        cmd = f"llama-cli {llama_opts} 2>/dev/null"
+        out, ret = self.emulator.run(cmd, timeout=60)
+        self.assertEqual(ret, 0)
+        out_str = "\n".join(out).lower()
+        self.assertIn(expected_answer, out_str)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
