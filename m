Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301FAC47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 10:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D20F94059F;
	Sun, 21 Jan 2024 10:19:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D20F94059F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hDGLXUIb-dN2; Sun, 21 Jan 2024 10:19:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D738E40468;
	Sun, 21 Jan 2024 10:19:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D738E40468
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC6E31BF59D
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 10:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2911408C9
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 10:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2911408C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ubkEMniRCWMj for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 10:19:37 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8AD240547
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 10:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8AD240547
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E1B3A13F81D;
 Sun, 21 Jan 2024 11:19:33 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Jan 2024 11:19:33 +0100
Date: Sun, 21 Jan 2024 11:19:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZazvtXWIxmtURzUu@landeda>
References: <20240112194627.112457-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240112194627.112457-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705832376;
 bh=wlVasZjiLRSZg1DxCjOlBwrEPk1IKY/GHsa63+8Byx8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dq6cykkEXEOWvk/I0tzFHLJ3ddI/v1zqPgONA6+uooeHs39uTgkUlYOosT5HeQ51P
 ejTvpamiFoVdfkuWU2ZngvXJmxZ/Ya692nezFsG+6a3NkIUdpOjT/sK69COgwmjm8o
 /GlmPjT3PmwdRwjVxFheGKNeH5h/uV7VEFlShHwV+8nvIg52RhVSu2U9I02UnWyExe
 /mAYpVluWII/C1W53Dx/nBonR9nnQTRX1xQqqh5S8NhtHwyomRxunkpZWQp+HQWbYo
 Z1bNTxNGFecJyfEttMv89nexMZhiP1WFMVjeifUtCF7FIcv4lsgJcTo/kp017IH+R1
 2D+a34+BefL8Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dq6cykkE
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: new apache runtime test
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2024-01-12 20:46 +0100, Julien Olivain spake thusly:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS                                   |  1 +
>  support/testing/tests/package/test_apache.py | 23 ++++++++++++++++++++
>  2 files changed, 24 insertions(+)
>  create mode 100644 support/testing/tests/package/test_apache.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 94a89c63d5..11780db285 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1759,6 +1759,7 @@ F:	support/testing/tests/package/sample_python_pyalsa.py
>  F:	support/testing/tests/package/sample_python_spake2.py
>  F:	support/testing/tests/package/test_acpica.py
>  F:	support/testing/tests/package/test_acpica/
> +F:	support/testing/tests/package/test_apache.py
>  F:	support/testing/tests/package/test_brotli.py
>  F:	support/testing/tests/package/test_bzip2.py
>  F:	support/testing/tests/package/test_compressor_base.py
> diff --git a/support/testing/tests/package/test_apache.py b/support/testing/tests/package/test_apache.py
> new file mode 100644
> index 0000000000..f29f4e2524
> --- /dev/null
> +++ b/support/testing/tests/package/test_apache.py
> @@ -0,0 +1,23 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestApache(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_APACHE=y
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
> +        self.assertRunOk("httpd -V")
> +        self.assertRunOk("wget http://localhost/index.html")
> +        self.assertRunOk("grep -F 'It works!' index.html")
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
