Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8B0C47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 10:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C809403A7;
	Sun, 21 Jan 2024 10:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C809403A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SnmcF_DR3luw; Sun, 21 Jan 2024 10:20:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F159B40494;
	Sun, 21 Jan 2024 10:20:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F159B40494
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 800391BF3F3
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 10:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5926A418F5
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 10:20:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5926A418F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VL116D3YkmM2 for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 10:20:01 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F9B9418F0
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 10:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F9B9418F0
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7969E13F8A9;
 Sun, 21 Jan 2024 11:19:57 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Jan 2024 11:19:57 +0100
Date: Sun, 21 Jan 2024 11:19:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <Zazvzc8l00sd25pH@landeda>
References: <20240113201532.121274-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240113201532.121274-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705832399;
 bh=mYYMAl1l5urJCTBBQxIIJTkwt9i31XgJlVgsVWnFEcU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Csbzdxl+MuD+UP982GxHHMf62mg7LgWtnketsvM5Jxf+j+3FIyi5q9Fis0veLw+N5
 dRByuMaifMpQOIr+6EnQZAvfaA7/Gk6liS9ci4kuoHz9bWwAgbeRdmzKBIRrWXzC4t
 4GS/B5RBld1lS11BkZZY5TGVydQstBluobHsaQpaPwimfsXiu1QYdBQ1vj6zcN7C3f
 MuuB7KCYNgHC0IR5i90ydEuB01jfvOIjtRlk6fCXSwfGmVGm+jAKL2d43ZzQja7QL8
 74NsmqkxGHAQCVnXiPNGOkDDCGEZevfAaS/bUo0ZV0ODIzAXnFWcRK/MaHSAXMyxic
 hq9PMDBNl+yHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Csbzdxl+
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add netcat runtime test
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

On 2024-01-13 21:15 +0100, Julien Olivain spake thusly:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS                                   |  1 +
>  support/testing/tests/package/test_netcat.py | 41 ++++++++++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 support/testing/tests/package/test_netcat.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 94a89c63d5..d25f31f0ff 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1791,6 +1791,7 @@ F:	support/testing/tests/package/test_lz4.py
>  F:	support/testing/tests/package/test_lzop.py
>  F:	support/testing/tests/package/test_mtools.py
>  F:	support/testing/tests/package/test_ncdu.py
> +F:	support/testing/tests/package/test_netcat.py
>  F:	support/testing/tests/package/test_nftables.py
>  F:	support/testing/tests/package/test_nftables/
>  F:	support/testing/tests/package/test_octave.py
> diff --git a/support/testing/tests/package/test_netcat.py b/support/testing/tests/package/test_netcat.py
> new file mode 100644
> index 0000000000..b3efa4c40b
> --- /dev/null
> +++ b/support/testing/tests/package/test_netcat.py
> @@ -0,0 +1,41 @@
> +import os
> +import time
> +
> +import infra.basetest
> +
> +
> +class TestNetCat(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +        BR2_PACKAGE_NETCAT=y
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
> +        self.assertRunOk("nc --version")
> +
> +        in_file = "input.bin"
> +        out_file = "output.bin"
> +        port = 12345
> +
> +        cmd = f"dd if=/dev/urandom of={in_file} bs=1k count=1k"
> +        self.assertRunOk(cmd)
> +
> +        cmd = f"nc -l -p {port} > {out_file} &"
> +        self.assertRunOk(cmd)
> +
> +        time.sleep(1)
> +
> +        cmd = f"cat {in_file} | nc -c 127.0.0.1 {port}"
> +        self.assertRunOk(cmd)
> +
> +        cmd = f"cmp {in_file} {out_file}"
> +        self.assertRunOk(cmd)
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
