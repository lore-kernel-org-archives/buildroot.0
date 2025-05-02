Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80124C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F3EB415E9;
	Fri,  2 May 2025 10:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6SqJyY4dqXg; Fri,  2 May 2025 10:55:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E128411E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E128411E6;
	Fri,  2 May 2025 10:55:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AE74A229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 951FE6074F
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xc2UyMVTJ1Hs for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:55:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C00B1606D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C00B1606D6
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C00B1606D6
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:55:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A6F231C00E6; Fri,  2 May 2025 12:55:35 +0200 (CEST)
Message-ID: <adc29595-672d-4ca9-b1d6-5fdaededc342@rnout.be>
Date: Fri, 2 May 2025 12:55:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20241126183012.39202-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20241126183012.39202-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183335; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wOE9AjRhZk2w5hemYexmVn+xjbHL+PuPHp6mtCkHQNU=;
 b=a7xy9qwoYsc3lbqE3ZAg28lX6U8MOisVDzdXSAheBEIH/unQGuFCH9nUinAG97M6CrV1E7
 EcB36iTgtCFrra37g9uw0DE1hDpWAJ4BKvw2Z2LGXpO4EMDrXAqBX0eXNqZYbLLjAP07rZ
 VoQe6LRdXucoqSc1If1zNhGgbFOOZyHoxbdQ7j4VC/npObDU0q66SvqIRW6CBDrglL6Qga
 0+Lk015j7mLX8HA6sv2UyqHrsxWtVsI3+LBQrBpDqbKsOQqebYnFiVH/0FJJXGZDuPoY5y
 /DWaMyw/9Z9IVTtxfaUbiwP3/cIL3uHDkmcT3IP40+nKADdiyziYWFSmnET1Gg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=a7xy9qwo
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: new openocd runtime
 test
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



On 26/11/2024 19:30, Julien Olivain wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8477140333
> ---
>   DEVELOPERS                                    |  1 +
>   support/testing/tests/package/test_openocd.py | 37 +++++++++++++++++++
>   2 files changed, 38 insertions(+)
>   create mode 100644 support/testing/tests/package/test_openocd.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d75df5cc55..1045324a52 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1953,6 +1953,7 @@ F:	support/testing/tests/package/test_octave.py
>   F:	support/testing/tests/package/test_ola.py
>   F:	support/testing/tests/package/test_ola/
>   F:	support/testing/tests/package/test_openblas.py
> +F:	support/testing/tests/package/test_openocd.py
>   F:	support/testing/tests/package/test_parted.py
>   F:	support/testing/tests/package/test_pciutils.py
>   F:	support/testing/tests/package/test_perftest.py
> diff --git a/support/testing/tests/package/test_openocd.py b/support/testing/tests/package/test_openocd.py
> new file mode 100644
> index 0000000000..fe4d203073
> --- /dev/null
> +++ b/support/testing/tests/package/test_openocd.py
> @@ -0,0 +1,37 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestOpenOCD(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_OPENOCD=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        # We check the program can run.
> +        self.assertRunOk("openocd --version")
> +
> +        msg = "Buildroot"
> +
> +        # We check openocd can run, load a "dummy" driver in the
> +        # standard search path, and use some of its TCL commands. See:
> +        # https://github.com/openocd-org/openocd/blob/v0.12.0/doc/manual/primer/commands.txt#L117
> +        # https://github.com/openocd-org/openocd/blob/v0.12.0/src/jtag/drivers/dummy.c
> +        cmd = "openocd"
> +        cmd += " -f interface/dummy.cfg"
> +        cmd += f" -c 'dummy hello {msg}'"
> +        cmd += " -c shutdown"
> +        out, ret = self.emulator.run(cmd)
> +        self.assertEqual(ret, 0)
> +        expected_str = f"Greetings {msg}!"
> +        self.assertIn(expected_str, out)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
