Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9639606FFCB
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 16:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=q8TDufmu
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3AE560B4E;
	Fri, 13 Nov 2026 16:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4sskzZ0qpMZC; Fri, 13 Nov 2026 16:04:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 52D7060679
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794585895;
	b=QchbMe9zVq7/vyyQCZEPB4ldP/qP8EAydwt6nYvHlYeUnkXIVjEf/NaXHEIsIdWDwTnM
	 B3+bE/SqZTHkY/q9yBgU0W+Ghz/XqzEAsR6diWDwWobOWkg63Tfphl4ygCT+QYInKMBrf
	 al5IxGsfj4Tb4wx7kVWR+Oow38UNMF8HP3vCIpaYq0sA1RMzbmX/RakquceeYJhCZoNy3
	 E8JFQO5WjxCIDyZ1DGzXAn4g0DcNohfLK7w/rz4+Yb2NdXNg8lhByxoIGnMitLyUVJlef
	 4HiSsNhoA2omgIolW/KTSqV5eqLvqTQg7KVuwpXLp+tYwJfiaDbJaK7MwPxRRQa+Dew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794585895;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2TtNqh5cZCGlzG2Z6n0FSsdYkAhf+/o+woDPf/TVK+s=;
	b=TtHSncWm2tPx2xHyR0kZu4AYpf+Y6acpYfd6pcYh+9w//ycbClRsitOeo11RWeysEU9t
	 fDESJsyrF8jQ2fC2B+wIcRY7qLnknjkB3WxBUa7wxukXjQLmyczlsVlacfgvwZfBsy22n
	 FdvPgsz54n/W1qmLrzt9uleygOC3a6AuCmg0jvnUJwlwfqYFWZ8KdGag/n0/H5/JnY80z
	 kT3i3hj5ELnYGE53dqyL3tWw9Ki+cVqbP5+66idiZSRkgQxJctuV++uhZNwWcMyGdkIFb
	 DJyaCp12cY09dCre3f61evfRpJ2Jj7QoSegRIbcXB/fIxOSlt3e42mvVIeg4IkDunRw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794585895;
	bh=2TtNqh5cZCGlzG2Z6n0FSsdYkAhf+/o+woDPf/TVK+s=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=q8TDufmu+RCII871+UYJtd+t5msN28Ao2NRGPE/RyQqzjvjdguSicJKfBBxEe+EZ2
	 aFmrYIzj5n7j8AJSrstVLXTYSplxsdBo3aMOUG1QfDEl/KKWXSHgLUi9kTPTbGKhe9
	 kL5U62D0mpUlW4nTD6K7/S5C1QYLuDu5Jt2fzxrTWWZDZu63gaPg7Nxed77uRJaYxR
	 S/MehhUKiJ9bVUNUs504VFKQrErQsIVxFc3yS7PyMhYxxmTDGzaOxt2Gh8Rc+Rp3si
	 6iRCvNZBGNTYWwUv6TwmnMl8tm/luToN3DFJbiAv94CWoqbCWj7UMFEPQ5AFuxUoeW
	 WkkoQPlySiw9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52D7060679;
	Fri, 13 Nov 2026 16:04:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 373BD2FE
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 16:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2ADC88143F
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 16:04:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yzhT2Cwk5UMc for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 16:04:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3BC9F81450
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BC9F81450
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 16:04:52 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D3A9A5FFC0;
 Fri, 13 Nov 2026 17:04:49 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Fri, 13 Nov 2026 17:04:45 +0100
Message-ID: <20261113160445.289700-1-ju.o@free.fr>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] support/testing: cups: new runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/18009674127
---
 DEVELOPERS                                 |   1 +
 support/testing/tests/package/test_cups.py | 120 +++++++++++++++++++++
 2 files changed, 121 insertions(+)
 create mode 100644 support/testing/tests/package/test_cups.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 1d2960f9b3..3be1775fe6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1928,6 +1928,7 @@ F:	support/testing/tests/package/test_connman.py
 F:	support/testing/tests/package/test_coremark.py
 F:	support/testing/tests/package/test_cryptsetup.py
 F:	support/testing/tests/package/test_cryptsetup/
+F:	support/testing/tests/package/test_cups.py
 F:	support/testing/tests/package/test_dieharder.py
 F:	support/testing/tests/package/test_dmidecode.py
 F:	support/testing/tests/package/test_dos2unix.py
diff --git a/support/testing/tests/package/test_cups.py b/support/testing/tests/package/test_cups.py
new file mode 100644
index 0000000000..850e950e3f
--- /dev/null
+++ b/support/testing/tests/package/test_cups.py
@@ -0,0 +1,120 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestCups(infra.basetest.BRTest):
+    # We use a specific configuration for:
+    # - using Aarch64, to have more than 256MB memory,
+    # - to have an ext4 rootfs image exposed as a virtio storage
+    #   (rather than cpio initrd). This will save some memory, as the
+    #   rootfs image is big.
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.63"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_PACKAGE_CUPS=y
+        BR2_PACKAGE_CUPS_FILTERS=y
+        BR2_PACKAGE_DEJAVU=y
+        BR2_PACKAGE_GHOSTSCRIPT=y
+        BR2_PACKAGE_POPPLER=y
+        BR2_PACKAGE_POPPLER_UTILS=y
+        BR2_PACKAGE_TESSERACT_OCR=y
+        BR2_PACKAGE_TESSERACT_OCR_LANG_ENG=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "512M",
+                                    "-smp", "2",
+                                    "-drive", f"file={drive},if=virtio,format=raw"])
+        self.emulator.login()
+
+        printer_name = "TestPrinter"
+        spool_dir = "/tmp/ippeveprinter-spool"
+        msg = "Hello Buildroot!"
+
+        self.assertRunOk(f"mkdir -p {spool_dir}")
+
+        # We start the IPP printer emulator in background.
+        printer_cmd = "ippeveprinter "
+        printer_cmd += f"-v -p 8000 -k -d {spool_dir} "
+        printer_cmd += "-f 'text/plain,application/pdf,image/pwg-raster,image/urf' "
+        printer_cmd += printer_name
+        cmd = f"( {printer_cmd} &> /var/log/ippeveprinter.log & )"
+        self.assertRunOk(cmd)
+
+        # We create the printer in cups.
+        cmd = f"lpadmin -p {printer_name} -E -v ipp://127.0.0.1:8000/ipp/print -m everywhere"
+        self.assertRunOk(cmd)
+
+        # We set our new printer as the default.
+        cmd = f"lpoptions -d {printer_name}"
+        self.assertRunOk(cmd)
+
+        # We list the printer options.
+        cmd = "lpoptions -l"
+        self.assertRunOk(cmd)
+
+        # We show the cups queue status.
+        cmd = "lpq"
+        self.assertRunOk(cmd)
+
+        # We check we should not have any completed job.
+        cmd = "lpstat -W completed"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(len(out), 0)
+
+        # We print our test message.
+        cmd = f"echo '{msg}' | lp"
+        self.assertRunOk(cmd)
+
+        # We wait until we see a completed print job.
+        for attempt in range(30):
+            time.sleep(3)
+
+            cmd = "lpstat -W completed"
+            out, ret = self.emulator.run(cmd)
+            self.assertEqual(ret, 0)
+            if len(out) > 0:
+                break
+        else:
+            self.fail("Timeout while waiting for print job.")
+
+        # We identify the most recent PDF file in our printer spool.
+        cmd = f"ls -1 {spool_dir}/*.pdf | head -1"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        pdf_file = out[0]
+
+        # We rasterize the PDF time into a PPM image.
+        cmd = f"pdftoppm {pdf_file} > out.ppm"
+        self.assertRunOk(cmd)
+
+        # We extract the text from our PPM image.
+        cmd = "tesseract out.ppm out"
+        self.assertRunOk(cmd)
+
+        # We expect to see our initial message.
+        cmd = "cat out.txt"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
