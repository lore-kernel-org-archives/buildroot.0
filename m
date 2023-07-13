Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C86EC001B0
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 20:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1D15405B3;
	Thu, 13 Jul 2023 20:18:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1D15405B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uvsg38lDWxEq; Thu, 13 Jul 2023 20:18:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5AE440B96;
	Thu, 13 Jul 2023 20:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5AE440B96
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD4D31BF3D0
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A683A40B29
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A683A40B29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kswj6EVoeEXn for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 20:18:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4ECFA405B3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4ECFA405B3
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 20:18:17 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E616413F81D;
 Thu, 13 Jul 2023 22:18:12 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 22:18:08 +0200
Message-ID: <20230713201808.65932-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689279494;
 bh=FXK02xtR0LuD2e138YXx5nUPg7qEz337UZxBxgeW3h4=;
 h=From:To:Cc:Subject:Date:From;
 b=KI2nl+jS3GxKwtciwb4Q6j5f+sb4q4PAgkx6ou3pdNtru4S+dZqANirmQ57ZsAs6C
 HwygRlPp0yuV/A10HLM0bQV9cuSUBpUAU+LPmhe9FGFqrgjwHtvV6KmjiXfD9bl05u
 iP1P8TyddYMXHfb0SF3oXsLVvAtEZjZ1v0e8ARvcEzyh0GGAsismmdVaZ8VVjiMHnX
 9IE3G3YzwPF1stXS6UTyG1W+T7lA0/ELqg8KK4jXtBYHH0V+91F7vF9qUnhPI7Rvt+
 NEKpA0cRMdD1nvgf8qxL1ZGTPmK/VdU0stHINnaJwAHALW3VZPpM9dJnRY2rkDMugI
 oq8AjsqEvuQVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KI2nl+jS
Subject: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_acpica.py: run runtime test
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  2 +
 support/testing/tests/package/test_acpica.py  | 91 +++++++++++++++++++
 .../test_acpica/rootfs-overlay/root/dsdt.asl  |  9 ++
 3 files changed, 102 insertions(+)
 create mode 100644 support/testing/tests/package/test_acpica.py
 create mode 100644 support/testing/tests/package/test_acpica/rootfs-overlay/root/dsdt.asl

diff --git a/DEVELOPERS b/DEVELOPERS
index 0918e9f721..b58203a9f5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1728,6 +1728,8 @@ F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_hwdata.py
 F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
+F:	support/testing/tests/package/test_acpica.py
+F:	support/testing/tests/package/test_acpica/
 F:	support/testing/tests/package/test_bzip2.py
 F:	support/testing/tests/package/test_compressor_base.py
 F:	support/testing/tests/package/test_ddrescue.py
diff --git a/support/testing/tests/package/test_acpica.py b/support/testing/tests/package/test_acpica.py
new file mode 100644
index 0000000000..f7dd64d7f0
--- /dev/null
+++ b/support/testing/tests/package/test_acpica.py
@@ -0,0 +1,91 @@
+import os
+
+import infra.basetest
+
+
+class TestAcpica(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_ACPICA=y
+        BR2_ROOTFS_OVERLAY="{}"
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+           # overlay to add an ASL source file
+           infra.filepath("tests/package/test_acpica/rootfs-overlay"))
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Check a program can execute
+        self.assertRunOk("iasl -v")
+
+        # Check "acpiexamples" demo is running
+        self.assertRunOk("acpiexamples")
+
+        # Check "acpihelp" convert error code 0x1 to AE_ERROR
+        self.assertRunOk("acpihelp -e 1 | grep -F AE_ERROR")
+
+        # Check "acpihelp" convert 0xA3 opcode to NoOpOp
+        self.assertRunOk("acpihelp -o 0xA3 | grep -F NoOpOp")
+
+        # Compile a simple ASL file
+        # The output file is automatically set to "dsdt.aml"
+        self.assertRunOk("iasl dsdt.asl")
+
+        # Evaluate the AML with acpiexec
+        # STR0 is expected to be "Hello Buildroot!"
+        cmd = "acpiexec -b 'evaluate STR0' dsdt.aml"
+        cmd += " | grep -F '\"Hello Buildroot!\"'"
+        self.assertRunOk(cmd)
+
+        # INT1 is exepcted to be 12345678
+        cmd = "acpiexec -b 'evaluate INT1' dsdt.aml"
+        cmd += " | grep -F 12345678"
+        self.assertRunOk(cmd)
+
+        # Evalute the TEST method which prints its argument
+        cmd = "acpiexec -b 'evaluate TST2 \"Hello World\"' dsdt.aml"
+        cmd += " | grep -F 'Arg0=Hello World'"
+        self.assertRunOk(cmd)
+
+        # dump aml to text
+        self.assertRunOk("acpidump -f dsdt.aml -o dsdt.dump")
+
+        # Rebuild dump to binary with acpixtract
+        # Output is implicitly into the dsdt.dat file
+        self.assertRunOk("acpixtract -a dsdt.dump")
+
+        # Compare with acpibin
+        # The rebuilt dsdt.dat is expected to be the same
+        cmd = "acpibin -a dsdt.aml dsdt.dat"
+        cmd += " | grep -F 'Files compare exactly'"
+        self.assertRunOk(cmd)
+
+        # Compare with cmp, to check acpibin
+        self.assertRunOk("cmp dsdt.aml dsdt.dat")
+
+        # Disassemble the compiled ASL
+        # Output file is implicitly "dsdt.dsl", we rename it to
+        # "disa.dsl" to make sure it will not clash with the original
+        # file, when recompiling.
+        self.assertRunOk("iasl dsdt.aml && mv -v dsdt.dsl disa.dsl")
+
+        # Disassembled output should contain our string
+        self.assertRunOk("grep STR0 disa.dsl | grep '\"Hello Buildroot!\"'")
+
+        # Recompile the disassembled file
+        self.assertRunOk("iasl disa.dsl")
+
+        # Compare the first compiled file with the one recompiled from
+        # the disassembly. There are expected to be identical.
+        cmd = "acpibin -a dsdt.aml disa.aml"
+        cmd += " | grep -F 'Files compare exactly'"
+        self.assertRunOk(cmd)
+
+        # Also compare with "cmp"
+        self.assertRunOk("cmp dsdt.aml disa.aml")
diff --git a/support/testing/tests/package/test_acpica/rootfs-overlay/root/dsdt.asl b/support/testing/tests/package/test_acpica/rootfs-overlay/root/dsdt.asl
new file mode 100644
index 0000000000..24f51565be
--- /dev/null
+++ b/support/testing/tests/package/test_acpica/rootfs-overlay/root/dsdt.asl
@@ -0,0 +1,9 @@
+DefinitionBlock ("", "DSDT", 2, "", "", 0x0)
+{
+    Name (STR0, "Hello Buildroot!")
+    Name (INT1, 0x12345678)
+    Method (TST2, 1)
+    {
+        printf ("Arg0=%o", Arg0)
+    }
+}
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
