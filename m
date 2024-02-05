Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB2EC48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 18:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CC2540AFF;
	Mon,  5 Feb 2024 18:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CC2540AFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SkuIZrTx-Nr9; Mon,  5 Feb 2024 18:34:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2589D40B48;
	Mon,  5 Feb 2024 18:34:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2589D40B48
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C78C1BF282
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 18:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14553417F7
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 18:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14553417F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wMy99G-p89Eb for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 18:34:19 +0000 (UTC)
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0995B417F5
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 18:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0995B417F5
Received: from [192.168.17.123] (unknown [85.119.216.19])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 0EBF32C800D1
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 19:34:17 +0100 (CET)
Message-ID: <87adf1da-ab34-4ef2-9bd5-0e3e3a8bae33@bubu1.eu>
Date: Mon, 5 Feb 2024 19:34:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <170715461915.13905.5968173515742280918-1@git.sr.ht>
In-Reply-To: <170715461915.13905.5968173515742280918-1@git.sr.ht>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707158057; bh=bX2IFXcTV9wH1SUpqxT5M/DSo/ghvkkcOwveV8BuyG4=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=Y9TwoVslQBgJwrJeQr36GEMI3zYgKmSmi5JTZb1Ws8I4IWxmI4Foj3SSfE2w8OSBg
 w3X+BcTUKbNqX2lWsKRjEn4GLOiQAExmIL2d0vS1YjYvp1Mm+o2gwVxN+lPhpmK5kO
 9lFWqp6bLSLmRBMvu5E3kdvfmIl33fYBg9kmVL8uYCPnRdZv7Jj2wGmeYJFDqUSIdi
 QeAd2P5VN+a7pGckTLOT1TN8DmfLWHMTX3aP34mkghQ3kixa9aRkpfNFxs60J6TXNP
 9HowBAGB+BK/SYMEA3oES1ET7CSR22mVvp+SGrL8xT1p0rl3W/6jYBXz0I8G9yU+UQ
 4wB3LGAOJlJmA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=Y9TwoVsl
Subject: Re: [Buildroot] [PATCH buildroot v2 2/2] support/testing: add
 fastapi runtime test
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 05.02.24 18:25, ~bubu wrote:
> From: Marcus Hoffmann <bubu@bubu1.eu>
> 
> Add a runtime test for fastapi. Use uvicorn as the asgi server
> application as does the fastapi hello world example [1].
> 
> Fastapi depends on PydanticV2 now which is written in rust so we need to
> run the test on armv7.
> 
> [1] https://fastapi.tiangolo.com/tutorial/first-steps/
> 
> Signed-off-by: Marcus Hoffmann <bubu@bubu1.eu>
> ---
>   .../tests/package/sample_python_fastapi.py    |  8 ++++
>   .../tests/package/test_python_fastapi.py      | 47 +++++++++++++++++++
>   2 files changed, 55 insertions(+)
>   create mode 100644 support/testing/tests/package/sample_python_fastapi.py
>   create mode 100644 support/testing/tests/package/test_python_fastapi.py
> 
> diff --git a/support/testing/tests/package/sample_python_fastapi.py b/support/testing/tests/package/sample_python_fastapi.py
> new file mode 100644
> index 0000000000..3116df3a93
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_fastapi.py
> @@ -0,0 +1,8 @@
> +from fastapi import FastAPI
> +
> +app = FastAPI()
> +
> +@app.get("/")
> +async def root():
> +    return {"message": "Hello World"}
> +
> diff --git a/support/testing/tests/package/test_python_fastapi.py b/support/testing/tests/package/test_python_fastapi.py
> new file mode 100644
> index 0000000000..1a78fa6c58
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_fastapi.py
> @@ -0,0 +1,47 @@
> +import os
> +import time
> +
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonPy3Fastapi(TestPythonPackageBase):
> +    __test__ = True
> +    config = \
> +        """
> +        BR2_arm=y
> +        BR2_cortex_a9=y
> +        BR2_ARM_ENABLE_NEON=y
> +        BR2_ARM_ENABLE_VFP=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_FASTAPI=y
> +        BR2_PACKAGE_PYTHON_UVICORN=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        BR2_CCACHE=y
> +        BR2_CCACHE_DIR="/home/bubu/.buildroot-ccache"

Oops, I forgot to remove the 2 CCACHE lines before submitting. Don't 
forget to remove these when applying. :-)

> +        """
> +    sample_scripts = ["tests/package/sample_python_fastapi.py"]
> +    timeout = 60
> +
> +    def test_run(self):
> +        self.login()
> +        self.check_sample_scripts_exist()
> +        cmd = "uvicorn sample_python_fastapi:app > /dev/null 2>&1 &"
> +
> +        _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
> +
> +        # Give enough time for the uvicorn server to start up
> +        time.sleep(30)
> +
> +        cmd = "wget -q -O - http://127.0.0.1:8000/"
> +        output, exit_code = self.emulator.run(cmd, timeout=self.timeout)
> +        self.assertEqual(exit_code, 0)
> +        self.assertEqual(output[0], '{"message":"Hello World"}')
> +
> +    def login(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv7",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
