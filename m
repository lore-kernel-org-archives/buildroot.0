Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D010F109C05D
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 20:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BF1740BF8;
	Wed, 25 Mar 2026 20:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aIzzMBJiQueI; Wed, 25 Mar 2026 20:21:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A029340BFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774470073;
	bh=AiYLt6tvNZPUueYcIJDWRjIM8WlveNvcNXl05TaKKJc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NZIb5NzsRQbhqhmeYcVwymmGR65MKcEg91XMStGKUKaZO3jyS6y0ivWlXqVU+Uv+2
	 bqPqGZaPNVF9PBxNzwGsO2EJKzwFYO0YqdhcFa6vRUBpDUexFrStItvLiAAU/bLcrl
	 YcLz1AmCw6+jbuolztIKHDsRoPmwICIcIu8b+qxva2lc/3CzzYZz8hahQ7pE9D3Fpf
	 OKG/FSdlVJXlVnRckQeiulsKCyPzZAkf71WaEtpeJ/fQmdKJRN5iNv7s5ArJQ2ut8f
	 /m/BdqVYsdftqT2xoLK5Fi41vOuW+WhwB2Yhg1+fnZlW0EYaI7LK0rbIyAM9betph+
	 vN0bbyaluajJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A029340BFB;
	Wed, 25 Mar 2026 20:21:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C60C41D3
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 20:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B748A6081A
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 20:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t2eyMrKccYun for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 20:21:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1542460788
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1542460788
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 20:21:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C66A7F88A; Wed, 25 Mar 2026 20:21:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 25 Mar 2026 21:12:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0fa55218f44e30d62843e0b99921a4b26e6aa6c7
X-Git-Newrev: 9d29863c5ea4a99f09c5c5046b896b609ced62c3
X-Patchwork-Hint: ignore
Message-Id: <20260325202111.4C66A7F88A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: ndctl: new runtime test
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9d29863c5ea4a99f09c5c5046b896b609ced62c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Cc: Chen Pei <cp0613@linux.alibaba.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  2 +
 support/testing/tests/package/test_ndctl.py        | 54 ++++++++++++++++++++++
 .../tests/package/test_ndctl/linux-pmem.fragment   |  3 ++
 3 files changed, 59 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 87310f595c..6de9ec3927 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1978,6 +1978,8 @@ F:	support/testing/tests/package/test_nftables.py
 F:	support/testing/tests/package/test_nftables/
 F:	support/testing/tests/package/test_ngrep.py
 F:	support/testing/tests/package/test_nmap.py
+F:	support/testing/tests/package/test_ndctl.py
+F:	support/testing/tests/package/test_ndctl/
 F:	support/testing/tests/package/test_ntp.py
 F:	support/testing/tests/package/test_ntp/
 F:	support/testing/tests/package/test_numactl.py
diff --git a/support/testing/tests/package/test_ndctl.py b/support/testing/tests/package/test_ndctl.py
new file mode 100644
index 0000000000..6cb44b2de2
--- /dev/null
+++ b/support/testing/tests/package/test_ndctl.py
@@ -0,0 +1,54 @@
+import json
+import os
+
+import infra.basetest
+
+
+class TestNdctl(infra.basetest.BRTest):
+    kern_frag = \
+        infra.filepath("tests/package/test_ndctl/linux-pmem.fragment")
+    config = \
+        f"""
+        BR2_x86_64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.19"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+        BR2_PACKAGE_NDCTL=y
+        BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        kernel = os.path.join(self.builddir, "images", "bzImage")
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        pmem_file = os.path.join(self.builddir, "images", "virtio-pmem.img")
+        self.emulator.boot(
+            arch="x86_64",
+            kernel=kernel, kernel_cmdline=["console=ttyS0"],
+            options=["-M", "pc",
+                     "-m", "1G,slots=2,maxmem=2G",
+                     "-object", f"memory-backend-file,id=mem1,share=on,mem-path={pmem_file},size=64M",
+                     "-device", "virtio-pmem-pci,memdev=mem1,id=nv1",
+                     "-initrd", cpio_file]
+        )
+        self.emulator.login()
+
+        # We check the program can execute.
+        self.assertRunOk("ndctl --version")
+
+        # We check we can see our pmem block device.
+        self.assertRunOk("ls -l /dev/pmem0")
+
+        # We check we can also see it with ndctl.
+        out, ret = self.emulator.run("ndctl list")
+        self.assertEqual(ret, 0)
+        ndctl_json = "".join(out)
+        pmem = json.loads(ndctl_json)
+        self.assertEqual(pmem[0]["blockdev"], "pmem0")
+        self.assertEqual(pmem[0]["size"], 64*1024*1024)
diff --git a/support/testing/tests/package/test_ndctl/linux-pmem.fragment b/support/testing/tests/package/test_ndctl/linux-pmem.fragment
new file mode 100644
index 0000000000..d636c3a22a
--- /dev/null
+++ b/support/testing/tests/package/test_ndctl/linux-pmem.fragment
@@ -0,0 +1,3 @@
+CONFIG_LIBNVDIMM=y
+CONFIG_BLK_DEV_PMEM=y
+CONFIG_VIRTIO_PMEM=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
