Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BE8606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 12:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sfjJ30Cr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=i097GG2c
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0785080A55;
	Fri, 27 Nov 2026 12:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86hqluWjBbtG; Fri, 27 Nov 2026 12:39:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E844F80A66
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795783140;
	b=CvOiXyXEnTpLYpOFytPVErt9CUAp/VgvB1xzSyfUSfGlWVL6I1AbVcnTwOPzUv2BvgSb
	 by3lKhq7hbcQ5ElyInNLIwPhabtQ0SAAdv9fEB/weTp1kxq0tOb82aN63x8daNdIvK5Hs
	 BXpXHIt+NJYuTBgKeNPQeKxTwWxgj4Vr98x9V1fpORcvyme2L3Af9AYO0Nk0i9pO3DjLf
	 PM1BJOAaaOCZ3TNPsGZgwpdy/hRs8ozz0zI5l5lYVoMIAv6ra+E1qdfQ/XS05ZOFTwKDx
	 qGqA9R04JTtEdXY2M6XmiUycl/FZpi+DEAHZurkogSqWiobPBr+RjxOUEAJcIe0Bm1A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795783140;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=M4BX1+8UYHvQ1xTQyYGp2CJFip3F/MdrK7xURQTw2jU=;
	b=fcXSciy36bFwwf5pEePV36f3MmE9XOUDJ3dyT2Hcsld9fFviWAqiyBz3Cn2rrTn3rp28
	 pvnR4wCc8ft3P1IwE17d5ENp0dsXG9cu0/+eCAVhZvGWPKeQgCl9BZKEPWTrvaCLaI3d2
	 /WMj3Gh4U0tmhpHs2oQIQEMtx+1iyuhj6DBTb+E3D4v9d/wv2itpuEPErkzdu+Had2c1w
	 sn7P9hi/qvTHN7KDTuxFquXhfHuQgPGW3GfUSiZbdIw2hhh/+TISherHxg5u31ecsoDum
	 cLl+C9qKM/8fdzktllXkdJ5L9TO6Sw4kfrhKNmvbLqTGYBL6a7pCrPzvjwXBx5TWi1g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=i097GG2c;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795783140;
	bh=M4BX1+8UYHvQ1xTQyYGp2CJFip3F/MdrK7xURQTw2jU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sfjJ30CrxbXB+4++qISPDvdsFWmHT/y1gHNAL2+tyS6LQ5i55DoS58usZV063Y03c
	 XfarsoalEMeMXKfGf0Mcn1HKqm/D2NjJcOhjIA2OikpDCJ4oYiq+Zsz1pgFh0WZph+
	 PwieKXNK7mWyNNFE64vAsPSnHSgliV8bIjiJaFbvDb46Uc7sVV5hWjtkaKcvJ08jeS
	 266xizB/d6z9KeMeeOQrqnM8ekPD4EeJ03OcjjIwd7Ap0AuSKYdVbiRxPkOkZr1Kl9
	 vbITOv50TFXkzCE5f+Uk9PyuZoP2+vNplaEjC5QUqPh8Ab6cXRms6AnuCz43QMXGY0
	 SkX0gtNfDFadA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E844F80A66;
	Fri, 27 Nov 2026 12:38:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B6D72DF
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 12:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EDDD80AA6
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 12:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nxwR3KWPcKbr for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 12:38:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1C64080A55
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.131
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=i097GG2c
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C64080A55
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 12:38:54 +0000 (UTC)
Received: from localhost.localdomain ([95.249.253.35])
 by Aruba SMTP with ESMTPSA
 id WvE3xMYVxV5J9WvE4xjmck; Fri, 27 Nov 2026 13:38:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795783132; bh=gAKb30qWv9YdmOfulJcscbOq6L+2zoaGnXXJfVrQsy0=;
 h=From:To:Subject:Date:MIME-Version;
 b=i097GG2cVOAb6oZ2XAN+aS+SXlWj71Is6haZgzmZ5jpfRkEcyRwMd4FYQNJS4xY0W
 T3jB1pac+41MXbrrXeXRmV+HpmTMeHQcWhkYv6sAuqq2rkEnZGCYLHaTYu61lL+Ns+
 alCCoLSMh4FyrEtdaSj6I8DxIoMMKr04DCS6Us2J2Sr/HgISu/8W769gndhh1FB6NS
 XLODGRNiMvNkn8xTJwZozsX73ZsZu1VVclBWlbKMIKhYmSJuzl/5G3KMkP660dzGMZ
 0zPAcHFBfPlUW+BPlQoRmrR6o8ATmMOm7JSe0Mu+rXJG7QEUsCiSF4RTwDGxfcLLBw
 WiBpdxy4BZnEg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 27 Nov 2026 13:38:49 +0100
Message-ID: <20261127123851.2402756-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127123851.2402756-1-giulio.benetti@benettiengineering.com>
References: <20261127123851.2402756-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEaoEdNhIYao+QtkVetUB6eEZgjoXCDcBx+fkFMv6b6dnoKqemn8xDMIbtiMhRSzIvRintO8xonllswkE68RxjpipXiHd1neu98wEJTZhnKVn0KYU3sf
 DLx/VdM9eOgmYSI6e8rcchqusoL3t3/DKwL/vpvB7kQkvTjzY1rkAmFWSZnfKz8oidmAWgWIizuEdo0WyglAxifbpthTnOmwL4JQ6SuKYdFO4/PUf/Z2vSc2
 /u6x+oLMsa4s6TibY+siBglVo64QZfJtgcsfGxryVGs0U2DYJgOJmtZF9UDcN43QIV/mqFdXR2jZpbP15b1z4t5myZG7XTMQPEIfAQFeEEg=
Subject: [Buildroot] [PATCH v5 2/4] support/testing: add dotnet-runtime
 runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Check that the pre-built .NET runtime can be found and executed by the
dotnet host, without any environment variable or install_location
file, that the host reports the RID of the target, and that the ICU,
OpenSSL and Kerberos options install the libraries loaded at runtime,
on ARMv7-A hard-float, AArch64 and x86_64, with glibc and musl.

Assisted-by: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
Changes v4 -> v5:
- only 11.0
- also test musl, AArch64 and x86_64
- use the Bootlin toolchains, and build a kernel for AArch64 and x86_64
- check the RID reported by the host

Changes v3 -> v4:
- new patch
---
 DEVELOPERS                                    |   1 +
 .../tests/package/test_dotnet_runtime.py      | 181 ++++++++++++++++++
 2 files changed, 182 insertions(+)
 create mode 100644 support/testing/tests/package/test_dotnet_runtime.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 73b3f6cbef..74fcb6482f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1379,6 +1379,7 @@ F:	package/vim/
 F:	package/wilc-driver/
 F:	package/wireshark/
 F:	package/zlib-ng/
+F:	support/testing/tests/package/test_dotnet_runtime.py
 F:	support/testing/tests/package/test_swugenerator.py
 F:	support/testing/tests/package/test_swupdate.py
 F:	support/testing/tests/package/test_swupdate/
diff --git a/support/testing/tests/package/test_dotnet_runtime.py b/support/testing/tests/package/test_dotnet_runtime.py
new file mode 100644
index 0000000000..e1e8f75e9b
--- /dev/null
+++ b/support/testing/tests/package/test_dotnet_runtime.py
@@ -0,0 +1,181 @@
+import os
+
+import infra.basetest
+
+
+class TestDotnetRuntimeBase(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_PACKAGE_DOTNET_RUNTIME=y
+        BR2_PACKAGE_DOTNET_RUNTIME_ICU=y
+        BR2_PACKAGE_DOTNET_RUNTIME_OPENSSL=y
+        BR2_PACKAGE_DOTNET_RUNTIME_KRB5=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def check_runtime(self, version):
+        self.login()
+
+        # The dotnet host must be in the PATH, and must find the
+        # runtime in its default location, without any environment
+        # variable or /etc/dotnet/install_location file.
+        out, ret = self.emulator.run("dotnet --list-runtimes", timeout=60)
+        self.assertEqual(ret, 0)
+        self.assertIn(f"Microsoft.NETCore.App {version} "
+                      "[/usr/share/dotnet/shared/Microsoft.NETCore.App]",
+                      out)
+        self.assertRunOk("test ! -e /etc/dotnet/install_location")
+
+        # The host must report the RID of the target, including the C
+        # library, that it uses to find the native assets of the
+        # applications.
+        libc = "musl-" if "_MUSL_STABLE=y" in self.config else ""
+        out, ret = self.emulator.run("dotnet --info", timeout=60)
+        self.assertEqual(ret, 0)
+        rids = [line.split()[1] for line in out
+                if line.strip().startswith("RID:")]
+        self.assertEqual(rids, [f"linux-{libc}{self.rid_arch}"])
+
+        # The libraries loaded at runtime by the runtime must be
+        # installed.
+        self.assertRunOk("ls /usr/lib/libicuuc.so.* /usr/lib/libicui18n.so.*")
+        self.assertRunOk("ls /usr/lib/libssl.so.* /usr/lib/libcrypto.so.*")
+        self.assertRunOk("ls /usr/lib/libgssapi_krb5.so.2")
+
+
+class TestDotnetRuntimeArm(TestDotnetRuntimeBase):
+    rid_arch = "arm"
+
+    # The .NET runtime needs ARMv7-A with the hard-float ABI on ARM,
+    # so infra.basetest.BASIC_TOOLCHAIN_CONFIG can't be used.
+    config = TestDotnetRuntimeBase.config + \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_NEON=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        """
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-m", "512M", "-initrd", img])
+        self.emulator.login()
+
+
+class TestDotnetRuntimeAarch64(TestDotnetRuntimeBase):
+    rid_arch = "arm64"
+
+    config = TestDotnetRuntimeBase.config + \
+        """
+        BR2_aarch64=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        """
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kernel = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kernel,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57",
+                                    "-m", "1G", "-initrd", img])
+        self.emulator.login()
+
+
+class TestDotnetRuntimeX8664(TestDotnetRuntimeBase):
+    rid_arch = "x64"
+
+    config = TestDotnetRuntimeBase.config + \
+        """
+        BR2_x86_64=y
+        BR2_x86_corei7=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+        """
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        kernel = os.path.join(self.builddir, "images", "bzImage")
+        self.emulator.boot(arch="x86_64",
+                           kernel=kernel,
+                           kernel_cmdline=["console=ttyS0"],
+                           options=["-cpu", "Nehalem",
+                                    "-m", "1G", "-initrd", img])
+        self.emulator.login()
+
+
+class TestDotnetRuntimeBinArmGlibc(TestDotnetRuntimeArm):
+    config = TestDotnetRuntimeArm.config + \
+        """
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
+        """
+
+    def test_run(self):
+        self.check_runtime("11.0.0")
+
+
+class TestDotnetRuntimeBinArmMusl(TestDotnetRuntimeArm):
+    config = TestDotnetRuntimeArm.config + \
+        """
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
+        """
+
+    def test_run(self):
+        self.check_runtime("11.0.0")
+
+
+class TestDotnetRuntimeBinAarch64Glibc(TestDotnetRuntimeAarch64):
+    config = TestDotnetRuntimeAarch64.config + \
+        """
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+        """
+
+    def test_run(self):
+        self.check_runtime("11.0.0")
+
+
+class TestDotnetRuntimeBinAarch64Musl(TestDotnetRuntimeAarch64):
+    config = TestDotnetRuntimeAarch64.config + \
+        """
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE=y
+        """
+
+    def test_run(self):
+        self.check_runtime("11.0.0")
+
+
+class TestDotnetRuntimeBinX8664Glibc(TestDotnetRuntimeX8664):
+    config = TestDotnetRuntimeX8664.config + \
+        """
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE=y
+        """
+
+    def test_run(self):
+        self.check_runtime("11.0.0")
+
+
+class TestDotnetRuntimeBinX8664Musl(TestDotnetRuntimeX8664):
+    config = TestDotnetRuntimeX8664.config + \
+        """
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE=y
+        """
+
+    def test_run(self):
+        self.check_runtime("11.0.0")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
