Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0A4606A31E
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 17:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eipw7+iH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=Lo6JJQli
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA9424057E;
	Wed, 25 Nov 2026 17:07:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oWbGwjFKNxtz; Wed, 25 Nov 2026 17:07:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5692440840
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795626442;
	b=r1Rb20HpofUvVDSAs1cUvS6hDSa0A7SQXtWnwlRKvq6ShUNNglpRcRb5kh1lF6tF9FZQ
	 DB2NDat8M7R0sOkcDgs29McHz+v2C1fvI2I9zviEnqoTA3ZG4FJl7DF4NwF2tlKL1ev12
	 LDG3SwV0jnhYXaJqrFoUT0abLNmXi/orL1ZrNTYsPAlK9fxiKUGp61QI1tpGaEhtcehRo
	 RWKSWCT0wDK4NyhNAnEO+eoaiGcdG9hfPF+ior0r8l3HF3CWIb8Of9eIDUQPO0vnGGMLP
	 CzM/HUO8h64ir+DaSC0yCbfsN9di3Kga1a2sQLjTAa3gLUZT9FRMat3dZIkmlE+unKw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795626442;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0H8az/vwbifTyC5wVTbpe6on6kInlzBQiN2GNulcH3c=;
	b=XbFPKvTN3S0IPZ8Hv9Y14xQb5e4EO1dJAxr5NNnnPKCAQNsFCA38WjyicO4ytlBeATcq
	 gfro1w690Q1vM/By4kqBCYJ5eS6/+zeMWCGSdauavpOSAmUWfGWJzh2aVtya9XH549EKw
	 QdfASQISmTTZ83kpPLpq/ymj5FU80BcArgwYmoGMH31TV7XCkxT8ezfKqfCiJPfCqKiYn
	 V9UuBiKE69tltBo47nyORNi3mA8NeWf4eWwUa9EdRJ21uraW1tGdo/lcZzwe8mMcdZRcP
	 8F/g6c/MuK7DhoBl0e8d//LNTudLSjbzYVDfFaQc8Nb5fIyVZ4XM6lOpJzQTmfmAqiQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795626442;
	bh=0H8az/vwbifTyC5wVTbpe6on6kInlzBQiN2GNulcH3c=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eipw7+iHJzqPEOLh2N/qYH0cAQMHqM9czLMKmRirKPCyWgmDabExk9ljRdDSfKl3j
	 aPd61SHLmusblaUs8hBcypp4SqRzLrhtpS0VgvlvBRkDvdFznGG5b83AGHWWznWXrM
	 hq03QkjXXM+NcrKWLWAV25bSkHXJUW1vA5P/to681Rla03Rpc/CTyqso16LRGV8V3R
	 D622ag9AZ3s5910O0k+wr9dorLPf7wqiuBkvBGqh5EBrtH+uJANSPlZl6I0yDFjCQw
	 GOguOlkkJzt0N2VxsvZf/tMcRCnlCd35X3IeIsau9tV4nIsbXyy8z5sO+MTU/St03R
	 gA+peB+tcsqPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5692440840;
	Wed, 25 Nov 2026 17:07:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CFA0A43
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 17:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBCCA60671
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 17:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uIAP3_CqbKHw for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 17:07:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 704DC6066E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=62.149.156.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.57;
 helo=smtpcmd0757.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Lo6JJQli
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 704DC6066E
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 17:07:17 +0000 (UTC)
Received: from localhost.localdomain ([95.249.253.35])
 by Aruba SMTP with ESMTPSA
 id WGSgxvLYzkbYcWGShx56pE; Wed, 25 Nov 2026 18:07:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795626435; bh=aDJ2Yc+wydJqFh6HUO/unlDKlpC2F7s8kTlgjdxOBFs=;
 h=From:To:Subject:Date:MIME-Version;
 b=Lo6JJQliZrqAwk5MWRVRslCIzWk1w7kc+ratO/WdIRU9n6sLPIPaZVsA0jY2ltS0M
 p/5ahKCpjO/LVa0AhWjOOGZHcNHc9JYSaAS1deLirpmqO1Tae7iNpiWn8XFptSpXA0
 e1fUL/wbqTP6TA1fVNvwY3drht2lO9r5MkdcDVTVgJW1mfcQAsam4fqFJnc5WqIv94
 F0eV7qB4lAE+TjEQ0f5q0J1US/XR0hs4Jzjtrl6qY7dCe2J+fpgRDjg4v4awIlEgmW
 q+51EPaqFPjmshMiNjd816eFWqj1eGZtGkrlnjCnxdxGpUkKAkAl1p0IfBEDXoPX+j
 VxG7DSs0hm/+g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 25 Nov 2026 18:07:14 +0100
Message-ID: <20261125170714.3924860-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125170714.3924860-1-giulio.benetti@benettiengineering.com>
References: <20261125170714.3924860-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfORTzanCHl32wHmJXJgV8IGWDcZYZER8DCIa6moUjXGXkFkH/HLIX+VvoMVtmYnSzMzXQT/xTfOOlzTT/KaOuB6nYSl0VyeOP+1mYgScr2kJnncOXYvG
 6DbSb9qR+y9QxvsYS3VKCfOEXjvn+WlNqd1PRICTaXcOEOP9MI82gyba9NIjQYyQcZqbsXnGNIbzbG/aI8EiRIZjIhxGLlgZMFaa7Px+19n6XPcz1hgwwO7p
 QS5jNq71AgCT5xttlQm705lHe1S+hCsCQqYUKhSsx9PcA3+rK+SU+vaBCZkA1WcF
Subject: [Buildroot] [PATCH v4 2/2] support/testing: add dotnet-runtime
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

Check that the pre-built .NET runtime 11.0, 10.0 and 8.0 can be found
and executed by the dotnet host on an ARMv7-A hard-float target,
without any environment variable or install_location file, and that
the ICU, OpenSSL and Kerberos options install the libraries loaded at
runtime.

Assisted-by: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS                                    |  1 +
 .../tests/package/test_dotnet_runtime.py      | 77 +++++++++++++++++++
 2 files changed, 78 insertions(+)
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
index 0000000000..600350bbd8
--- /dev/null
+++ b/support/testing/tests/package/test_dotnet_runtime.py
@@ -0,0 +1,77 @@
+import os
+
+import infra.basetest
+
+
+class TestDotnetRuntimeBase(infra.basetest.BRTest):
+    # The .NET runtime needs ARMv7-A with the hard-float ABI on ARM,
+    # so infra.basetest.BASIC_TOOLCHAIN_CONFIG can't be used.
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_NEON=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_PACKAGE_DOTNET_RUNTIME=y
+        BR2_PACKAGE_DOTNET_RUNTIME_ICU=y
+        BR2_PACKAGE_DOTNET_RUNTIME_OPENSSL=y
+        BR2_PACKAGE_DOTNET_RUNTIME_KRB5=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def check_runtime(self, version):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-m", "512M", "-initrd", img])
+        self.emulator.login()
+
+        # The dotnet host must be in the PATH, and must find the
+        # runtime in its default location, without any environment
+        # variable or /etc/dotnet/install_location file.
+        out, ret = self.emulator.run("dotnet --list-runtimes", timeout=60)
+        self.assertEqual(ret, 0)
+        self.assertIn(f"Microsoft.NETCore.App {version} "
+                      "[/usr/share/dotnet/shared/Microsoft.NETCore.App]",
+                      out)
+        self.assertRunOk("dotnet --info", timeout=60)
+        self.assertRunOk("test ! -e /etc/dotnet/install_location")
+
+        # The libraries loaded at runtime by the runtime must be
+        # installed.
+        self.assertRunOk("ls /usr/lib/libicuuc.so.* /usr/lib/libicui18n.so.*")
+        self.assertRunOk("ls /usr/lib/libssl.so.* /usr/lib/libcrypto.so.*")
+        self.assertRunOk("ls /usr/lib/libgssapi_krb5.so.2")
+
+
+class TestDotnetRuntimeBin11(TestDotnetRuntimeBase):
+    config = TestDotnetRuntimeBase.config + \
+        """
+        BR2_PACKAGE_DOTNET_RUNTIME_11_0=y
+        """
+
+    def test_run(self):
+        self.check_runtime("11.0.0")
+
+
+class TestDotnetRuntimeBin10(TestDotnetRuntimeBase):
+    config = TestDotnetRuntimeBase.config + \
+        """
+        BR2_PACKAGE_DOTNET_RUNTIME_10_0=y
+        """
+
+    def test_run(self):
+        self.check_runtime("10.0.15")
+
+
+class TestDotnetRuntimeBin8(TestDotnetRuntimeBase):
+    config = TestDotnetRuntimeBase.config + \
+        """
+        BR2_PACKAGE_DOTNET_RUNTIME_8_0=y
+        """
+
+    def test_run(self):
+        self.check_runtime("8.0.34")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
