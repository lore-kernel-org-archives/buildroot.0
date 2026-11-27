Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF89606A31F
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 12:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FxLR53Sn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=fYGW4yQz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1EDE409D3;
	Fri, 27 Nov 2026 12:39:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OwY0uDTsi20; Fri, 27 Nov 2026 12:39:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 49D0040A10
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795783141;
	b=XVl2dK8OM4FfAW3V5+/SHP2Yb4ehTBaxK3FA/8h/LKJVykX+vBVwtp0iRJP9mhAveiDb
	 Owtj/H0JHAxCt04D2HaACzGZLpkiz6fVLBHNxGUlttwn0gIx04MCuLrR1iPRPcgeTIyH5
	 ZyEx54CFz4dlor3LF2khrv/PTWEUv6RvnaDNqSR9jArWMgfdKwMoNdg2C7Y3D1o9PpwEV
	 W3YvbfXsG6mT5Z2xOIWHB5vPD5NPhGteRIvh1RHfwdGjHUSLrRioPktKifredx5c+Cuff
	 G5vQRHmwKV8t4EzYW3orXbInGzG7tTosJGzEegd/s7UM+/IbNxe+hocJ8YWimE3M/vg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795783141;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FlkY6svOvQpBIWXJHeIngP05QPodQ7VhrrydPd1vH9c=;
	b=NckqlW+5G7ZhZASMNiggSdc8pYaO9KjwCg6BZtDH3fXniZ6BggxST+yMySnlYnDv4Cac
	 P2675nNfjtRg6GnmN8PuQhNuyrCbO5VGUA8AESaMtuH/MD9GnIQzlFdiV27ybgOk04mkQ
	 9JZgJ4r5TIEtXwMtNJjv5vqS1tUEmeszbLr5U5sdW4CpO8rtLTcdTTh4k/tKXKiOakHhh
	 ZDBoaOEUU2cBpGsUNhRAkWLjkX716+bkIaPj+453uOMyAq2sbJQcHHj25GoHi7Y4kB1eL
	 PecUcUFgFkeh036ubLg/woWIxiVlwMDouvnmpWast1Lp7SQztysiFWD9LQie2iu9KVg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795783141;
	bh=FlkY6svOvQpBIWXJHeIngP05QPodQ7VhrrydPd1vH9c=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FxLR53Sngvs70SLGlne1XdnzJtOXr3HqGuvmGdNKuVFXof9waw9sAdyb6KpH9RuZt
	 5KI309+XR6JYQkPPfFOryKzFJ7BZcqhXtCCwKyJISbpyIaVIcNs0S7BGVI1Zzjaoww
	 1WiGytYNL2IAaRP/bY6AOk7cMJJrXg3NFwtZTPSTOUEownAMbWgcy17+OuQ+7kO/53
	 n7FnXdmB2dxETq1ILbf+T2VW5NsMHPCNhPsMfzBB0A6HAJYaCOFajntRcACJzhtQka
	 TL5Eud7+RPBBlXyJtPeJqDWdkpWZxmpwkF3xRdRnz1xwFqHcZFjUBVskWpau+0C7qm
	 dmLSvuKi6QOwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49D0040A10;
	Fri, 27 Nov 2026 12:39:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6220BBEC
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 12:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4830D80A55
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 12:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gOYo2mDtxVOR for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 12:38:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5672680A66
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.131
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=fYGW4yQz
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5672680A66
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 12:38:55 +0000 (UTC)
Received: from localhost.localdomain ([95.249.253.35])
 by Aruba SMTP with ESMTPSA
 id WvE3xMYVxV5J9WvE4xjmdD; Fri, 27 Nov 2026 13:38:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795783132; bh=XcWJYRcJ4Y5so2FX1IEKihpQZqalnBuT8Qxs+2oNtzs=;
 h=From:To:Subject:Date:MIME-Version;
 b=fYGW4yQzlFG9bTyXu8XaGuU2PVtqWeSKx7bOBhEDHp5ZLS6Z/Z5Gtx5yNQ9S0bKit
 FCmhwAZKwkjVCrDL7b8xC4jxsTUyfAxMHm4G+X7D/hnOFbGHgKpnbKC2z9213+dUFu
 nDx4XqTWhm3pjDWm93m6g+ZWhqGgR6GWFeMdDY0Gffx/5wNBWbOPFGuy4ItM1Fd9ON
 GqeGhLAjUjNfo6LeKmf2adtbWds/pZlGnjXDYUKonkuosxmAtvwPm+NhqnptX5cW8L
 8UAu6mE8q7dQT8LK1hGL7epd4whfRvyXmA5ukGJCdJzXbx3A24iVkTfKXeZyVNNjY9
 qN29KTrK+P9oQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 27 Nov 2026 13:38:51 +0100
Message-ID: <20261127123851.2402756-5-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127123851.2402756-1-giulio.benetti@benettiengineering.com>
References: <20261127123851.2402756-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEaoEdNhIYao+QtkVetUB6eEZgjoXCDcBx+fkFMv6b6dnoKqemn8xDMIbtiMhRSzIvRintO8xonllswkE68RxjpipXiHd1neu98wEJTZhnKVn0KYU3sf
 DLx/VdM9eOgmYSI6e8rcchqusoL3t3/DKwL/vpvB7kQkvTjzY1rkAmFWSZnfKz8oidmAWgWIizuEdo0WyglAxifbpthTnOmwL4JQ6SuKYdFO4/PUf/Z2vSc2
 /u6x+oLMsa4s6TibY+siBglVo64QZfJtgcsfGxryVGs0U2DYJgOJmtZF9UDcN43QIV/mqFdXR2jZpbP15b1z4t5myZG7XTMQPEIfAQFeEEg=
Subject: [Buildroot] [PATCH v5 4/4] support/testing: test_dotnet_runtime:
 add source variants
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

Also check the .NET runtime built from source, with the same version,
architectures and C libraries as the pre-built one.

Assisted-by: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../tests/package/test_dotnet_runtime.py      | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/support/testing/tests/package/test_dotnet_runtime.py b/support/testing/tests/package/test_dotnet_runtime.py
index e1e8f75e9b..c51257fd44 100644
--- a/support/testing/tests/package/test_dotnet_runtime.py
+++ b/support/testing/tests/package/test_dotnet_runtime.py
@@ -179,3 +179,69 @@ class TestDotnetRuntimeBinX8664Musl(TestDotnetRuntimeX8664):
 
     def test_run(self):
         self.check_runtime("11.0.0")
+
+
+class TestDotnetRuntimeSrcArmGlibc(TestDotnetRuntimeArm):
+    config = TestDotnetRuntimeArm.config + \
+        """
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
+        BR2_PACKAGE_DOTNET_RUNTIME_SRC=y
+        """
+
+    def test_run(self):
+        self.check_runtime("11.0.0")
+
+
+class TestDotnetRuntimeSrcArmMusl(TestDotnetRuntimeArm):
+    config = TestDotnetRuntimeArm.config + \
+        """
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE=y
+        BR2_PACKAGE_DOTNET_RUNTIME_SRC=y
+        """
+
+    def test_run(self):
+        self.check_runtime("11.0.0")
+
+
+class TestDotnetRuntimeSrcAarch64Glibc(TestDotnetRuntimeAarch64):
+    config = TestDotnetRuntimeAarch64.config + \
+        """
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+        BR2_PACKAGE_DOTNET_RUNTIME_SRC=y
+        """
+
+    def test_run(self):
+        self.check_runtime("11.0.0")
+
+
+class TestDotnetRuntimeSrcAarch64Musl(TestDotnetRuntimeAarch64):
+    config = TestDotnetRuntimeAarch64.config + \
+        """
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE=y
+        BR2_PACKAGE_DOTNET_RUNTIME_SRC=y
+        """
+
+    def test_run(self):
+        self.check_runtime("11.0.0")
+
+
+class TestDotnetRuntimeSrcX8664Glibc(TestDotnetRuntimeX8664):
+    config = TestDotnetRuntimeX8664.config + \
+        """
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE=y
+        BR2_PACKAGE_DOTNET_RUNTIME_SRC=y
+        """
+
+    def test_run(self):
+        self.check_runtime("11.0.0")
+
+
+class TestDotnetRuntimeSrcX8664Musl(TestDotnetRuntimeX8664):
+    config = TestDotnetRuntimeX8664.config + \
+        """
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE=y
+        BR2_PACKAGE_DOTNET_RUNTIME_SRC=y
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
