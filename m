Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5446AE83062
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 08:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8276A40B65;
	Tue,  3 Feb 2026 08:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCVO86LIgGLu; Tue,  3 Feb 2026 08:28:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E23F840A50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770107308;
	bh=GlsTS1l58lWfOo0C5DmKzYfmuvL3/HndEcn9MeSFc7Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FZYu799D63VKyBqIogswajCnG3M1DPpWzUxtQ41sfJPFvFM0zWaM0cQYX/LnXpZI0
	 06Eui5gbD6VbC6jJCMg949UsMNAmmQDreQuUheoNY0gkvgg9K8bER9km+t/PZJ0oFk
	 lxPekO2O4CiA/Mc7auh+jdkAE3usKlJSdv2KUcow3kuG59MB/G2WOoRqea90VSR0re
	 ze968Tx4hIqKqMPKZRMeuzcLlG2bQcCYiabdAFNQACKBg9oPcKlXnLuuPClr/pFK0Z
	 ZccgV9iMQnpJoadLlMwCokJXdbbjQfovlpUm9OZ3NGw6pJT26eFbmSUi3tWVQ5GogR
	 e+t2qRj8cfBEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E23F840A50;
	Tue,  3 Feb 2026 08:28:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 61354F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 403B240345
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbJsz72hNxHQ for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 08:28:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F37AF40253
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F37AF40253
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:28:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9BAA8658E; Tue,  3 Feb 2026 08:28:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 09:27:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85d47bbc40bb9b62d2b59b6f5653f6e69c494372
X-Git-Newrev: abad652feef21d29760e0f4016806d380a725c52
X-Patchwork-Hint: ignore
Message-Id: <20260203082824.D9BAA8658E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add aichat runtime test
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

commit: https://git.buildroot.net/buildroot/commit/?id=abad652feef21d29760e0f4016806d380a725c52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Tested-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |   2 +
 support/testing/tests/package/test_aichat.py       | 108 +++++++++++++++++++++
 .../rootfs-overlay/root/.config/aichat/config.yaml |  11 +++
 3 files changed, 121 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8290ccc281..4f7f034df7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1856,6 +1856,8 @@ F:	support/testing/tests/package/test_4th.py
 F:	support/testing/tests/package/test_acl.py
 F:	support/testing/tests/package/test_acpica.py
 F:	support/testing/tests/package/test_acpica/
+F:	support/testing/tests/package/test_aichat.py
+F:	support/testing/tests/package/test_aichat/
 F:	support/testing/tests/package/test_apache.py
 F:	support/testing/tests/package/test_attr.py
 F:	support/testing/tests/package/test_audio_codec_base.py
diff --git a/support/testing/tests/package/test_aichat.py b/support/testing/tests/package/test_aichat.py
new file mode 100644
index 0000000000..7c978315c9
--- /dev/null
+++ b/support/testing/tests/package/test_aichat.py
@@ -0,0 +1,108 @@
+import json
+import os
+import time
+
+import infra.basetest
+
+
+class TestAiChat(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_aichat/rootfs-overlay")
+    config = f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.3"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_PACKAGE_AICHAT=y
+        BR2_PACKAGE_CA_CERTIFICATES=y
+        BR2_PACKAGE_LIBCURL=y
+        BR2_PACKAGE_LIBCURL_CURL=y
+        BR2_PACKAGE_LLAMA_CPP=y
+        BR2_PACKAGE_LLAMA_CPP_SERVER=y
+        BR2_PACKAGE_LLAMA_CPP_TOOLS=y
+        BR2_PACKAGE_OPENSSL=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
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
+            kernel_cmdline=["root=/dev/vda"],
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
+        self.assertRunOk("aichat --version")
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
+        # We set few llama-server options:
+        llama_opts = "--log-file /tmp/llama-server.log"
+        # We set a fixed seed, to reduce variability of the test
+        llama_opts += " --seed 123456789"
+        llama_opts += f" --hf-repo {hf_model}"
+
+        # We start a llama-server in background, which will expose an
+        # openai-compatible API to be used by aichat.
+        cmd = f"( llama-server {llama_opts} &>/dev/null & )"
+        self.assertRunOk(cmd)
+
+        # We wait for the llama-server to be ready. We query the
+        # available models API to check the server is ready. We expect
+        # to see the our model. We also add an extra "echo" to add an
+        # extra newline.
+        cmd = "curl http://127.0.0.1:8080/v1/models && echo"
+        for attempt in range(20 * self.timeout_multiplier):
+            time.sleep(5)
+            # To debug the llama-server startup, uncomment the
+            # following line:
+            # self.assertRunOk("cat /tmp/llama-server.log")
+            out, ret = self.emulator.run(cmd)
+            if ret == 0:
+                models_json = "".join(out)
+                models = json.loads(models_json)
+                model_name = models['models'][0]['name']
+                if model_name == hf_model:
+                    break
+        else:
+            self.fail("Timeout while waiting for llama-server.")
+
+        # We ask our question and check the expected answer is present
+        # in the output. We pipe the output in "cat" to suppress the
+        # aichat UTF-8 spinner (aichat stdout will not be a tty).
+        cmd = f"aichat '{prompt}' | cat"
+        out, ret = self.emulator.run(cmd, timeout=120)
+        self.assertEqual(ret, 0)
+        out_str = "\n".join(out).lower()
+        self.assertIn(expected_answer, out_str)
diff --git a/support/testing/tests/package/test_aichat/rootfs-overlay/root/.config/aichat/config.yaml b/support/testing/tests/package/test_aichat/rootfs-overlay/root/.config/aichat/config.yaml
new file mode 100644
index 0000000000..f6a054696e
--- /dev/null
+++ b/support/testing/tests/package/test_aichat/rootfs-overlay/root/.config/aichat/config.yaml
@@ -0,0 +1,11 @@
+# see https://github.com/sigoden/aichat/blob/main/config.example.yaml
+
+model: llama-server:ggml-org/gemma-3-270m-it-GGUF
+stream: false
+highlight: false
+clients:
+- type: openai-compatible
+  name: llama-server
+  api_base: http://127.0.0.1:8080/v1
+  models:
+  - name: ggml-org/gemma-3-270m-it-GGUF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
