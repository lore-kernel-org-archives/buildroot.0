Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D29C369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 19:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 064438303C;
	Wed, 23 Apr 2025 19:19:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxmxZdliatiD; Wed, 23 Apr 2025 19:19:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16CC683051
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16CC683051;
	Wed, 23 Apr 2025 19:19:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C70D19F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1F6C612A4
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AVZfhcIQenTt for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 19:19:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CFC3A6129D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFC3A6129D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFC3A6129D
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:19:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id DDA95780383;
 Wed, 23 Apr 2025 21:19:43 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 23 Apr 2025 21:19:43 +0200
MIME-Version: 1.0
Date: Wed, 23 Apr 2025 21:19:43 +0200
From: Julien Olivain <ju.o@free.fr>
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: buildroot@buildroot.org, David Pierret <david.pierret@smile.fr>
In-Reply-To: <20250422085337.901025-2-elmehdi.younes@smile.fr>
References: <20250422085337.901025-1-elmehdi.younes@smile.fr>
 <20250422085337.901025-2-elmehdi.younes@smile.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <8cceb503700c740599f9047e9fe6cd0b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745435986;
 bh=yWrf+MwQ3FadZGN049TW1rb9yxOaoLt/aNL96QvIU5Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BtVFWlGiFppqkA/QJOr54ABHzS37TkwJX7nzYxaTKOQIbQiFTGovT1xoFfotm1MKw
 VKG1mo3/iDa8YojGIrdoEuchofnoK8CB/7OGnJzQpXTRIYeWpC41ikvXfNygwx9/8+
 o94/Bq80phOuvPavjiNqwX05JPpS60Fa8GGzxAh6ld0IhPCJyE3G/u2H3uT9VEcsHM
 nSc1kVh80evghQ2Tq7vL7qPuImJqTIs+C3vGZRUT4Hwhh6BW/+Wn4qS4ZtOgMEKIdI
 oo3QmVhlo3QUVv1rz6kCpLZ8en70UXDKcrY9TflwKqDeQHHYK1C5d1zSkpFLPaOiD2
 3qkucOSKYgaUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BtVFWlGi
Subject: Re: [Buildroot] [PATCH 2/2] support/test: new bat runtime test
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi El Medhi,

Thanks for the patch!

On 22/04/2025 10:53, El Mehdi YOUNES via buildroot wrote:
> Add a runtime test for the 'bat' package to verify that the binary 
> executes
> correctly in a minimal Buildroot rootfs.The test cheks that:
> - 'bat --version' runs without error
> - 'bat' can read and display a text file
> - the displayed content matches the expected string
> 
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
> ---
>  support/testing/tests/package/test_bat.py | 26 +++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 support/testing/tests/package/test_bat.py
> 
> diff --git a/support/testing/tests/package/test_bat.py 
> b/support/testing/tests/package/test_bat.py
> new file mode 100644
> index 0000000000..749fb38e85
> --- /dev/null
> +++ b/support/testing/tests/package/test_bat.py
> @@ -0,0 +1,26 @@
> +import os
> +import infra.basetest
> +
> +
> +class TestBat(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +            """
> +            BR2_PACKAGE_BAT=y
> +            BR2_TARGET_ROOTFS_CPIO=y
> +            # BR2_TARGET_ROOTFS_TAR is not set
> +            """
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", 
> "rootfs.cpio")
> +        self.emulator.boot(arch="armv7",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        # Check the programs can execute
> +        self.assertRunOk("bat --version")
> +        self.assertRunOk("echo 'hello test' > test.txt")
> +
> +        # Run bat and capture output
> +        output = self.emulator.run("bat test.txt", timeout=10)

The emultor.run() function returns a tuple (output, exit_code). See [1].

Could you:
1. get the output array and the return code in separate variables
   (in your patch output[1] is in fact the error code which is
    not checked)
2. check the return code is a success (before checking the
    output content)
3. join the output string with a new-line, e.g. "\n".join(output)
    to have a string that will better look like to the actual
    output.

See for example [2].

I already applied the first patch of this series, so you can
simply send a v2 of this runtime test.

> +        self.assertIn("hello test", ' '.join(output[0]))

Best regards,

Julien.

[1] 
https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.1/support/testing/infra/emulator.py#L187
[2] 
https://gitlab.com/buildroot.org/buildroot/-/blob/2025.02.1/support/testing/tests/package/test_attr.py#L62
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
