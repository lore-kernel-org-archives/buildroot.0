Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53515C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B8E881F1A;
	Fri,  2 May 2025 11:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QCRsbeqCWCwf; Fri,  2 May 2025 11:08:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4331881F68
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4331881F68;
	Fri,  2 May 2025 11:08:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24890229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEC6C607A8
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2re0V0-AEHdg for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:08:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 40AD060AD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40AD060AD6
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40AD060AD6
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:08:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2DA941C0F8A; Fri,  2 May 2025 13:08:03 +0200 (CEST)
Message-ID: <83137225-2953-411a-b553-d57a97b38738@rnout.be>
Date: Fri, 2 May 2025 13:08:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>, buildroot@buildroot.org
References: <20250422145553.1278313-1-elmehdi.younes@smile.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250422145553.1278313-1-elmehdi.younes@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746184083; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=nJ5LYDRithCHl4sHACbH7wL1eGEVW8ASGcTofx9XEbw=;
 b=J/F/avcBGpgnNRDqCuNAa6qYD3JX8z/m/Vln4LkUiqVjGTN07KpGZFeWt8ijCWYG3Z2OtM
 gh8j/uoMx0vyUvqmN9V1biJbP2c3+FGKJWdR7dHhyr08r7EK7xFvONKKEhtvrEpJT5g2gA
 XdkGnXz1i5mG9y4JdqSDwsTAGDXhZ79YHp12feeV8xqWTcKdSHUBNwTFxfZW2GEWScA9ix
 rxHetxOX3M2is2n/PlAa4KW/dMqwP89sA/MFGzxpPSQ1uLuYcHBUlLr4ToCVj6Fo0sQMex
 4f5emXoNDPOR+EkbL/lMSyQleLQupfMxFfEXrGWt+brjz7AFTEinhvmFmodQSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=J/F/avcB
Subject: Re: [Buildroot] [PATCH 1/2] support/test: new dust runtime test
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/04/2025 16:55, El Mehdi YOUNES via buildroot wrote:
> Add a runtime test for the 'dust' package to verify that the binary
> executes correctly in a minimal buildroot rootfs. The test checks that:
> - 'dust --version' runs without error
> - 'dust' can analyze a directory structure with files
> - The output includes the expected directory names
> 
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>

  Applied both to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   support/testing/tests/package/test_dust.py | 31 ++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
>   create mode 100644 support/testing/tests/package/test_dust.py
> 
> diff --git a/support/testing/tests/package/test_dust.py b/support/testing/tests/package/test_dust.py
> new file mode 100644
> index 0000000000..85c05934e5
> --- /dev/null
> +++ b/support/testing/tests/package/test_dust.py
> @@ -0,0 +1,31 @@
> +import os
> +import infra.basetest
> +
> +
> +class TestDust(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_DUST=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv7",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        # Check that dust is installed and can be executed
> +        self.assertRunOk("dust --version")
> +
> +        # Create a test directory structure with some files
> +        self.assertRunOk("mkdir -p testdir/subdir")
> +        self.assertRunOk("dd if=/dev/zero of=testdir/a bs=1K count=10")
> +        self.assertRunOk("dd if=/dev/zero of=testdir/subdir/b bs=1K count=5")
> +
> +        # Run dust on the test directory and capture the output
> +        output = self.emulator.run("dust testdir", timeout=10)
> +        self.assertIn("testdir", ' '.join(output[0]))
> +        self.assertIn("subdir", ' '.join(output[0]))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
