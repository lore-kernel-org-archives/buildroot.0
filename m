Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D81C4332F
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 19:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E60E140461;
	Sat, 31 Dec 2022 19:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E60E140461
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nPQr8elZwl5I; Sat, 31 Dec 2022 19:38:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0417340445;
	Sat, 31 Dec 2022 19:38:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0417340445
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF5781BF3C9
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 19:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CABF280B96
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 19:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CABF280B96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxiVKo0vwJLk for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 19:38:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5BAA80B79
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5BAA80B79
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 19:38:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:37e6:2c2e:a294:8f1b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1584913F85F;
 Sat, 31 Dec 2022 20:38:47 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 31 Dec 2022 20:38:46 +0100
Date: Sat, 31 Dec 2022 20:38:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20221231193846.GV2498764@scaer>
References: <20220822221430.355066-1-ju.o@free.fr>
 <20220822221430.355066-2-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220822221430.355066-2-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672515529;
 bh=V9ZY8iiY03sx+6+aS+esbK6MfN2Fwhn25Yf5+9/wBTs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=brzOcZvu2TFA0dkmmx8Jo7Y3c3Hwosaj9VQFmu1BoaGdC/jQDDNPQVwtTZcRs7JWk
 oIAmUh06Ug/jLQeW24e1PnbA20DCw52EkpqT91VhPgZQzKD6R0pOrgvcJ4Qw1lQ4/Z
 SFh7AORjkbwFBKeBzFjw+UTPUzMyo4UR8SucQOSHPpt90YRbebqos58XlK+ghHezs9
 iyJK0dy4dJ1iYSCTYwNxpcvOYeax+lxbTAeit3bYkUkJugqnn+Nc1N5QYS4chBQvFD
 poT+hRVdDhf0Ncj5mFR0OYU2jreuR/yjdJxqIZwSN+/pKdHkOZhlUIps01hWMfrZr7
 15m6NitCg3XOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=brzOcZvu
Subject: Re: [Buildroot] [RFC next 2/2]
 support/testing/tests/core/test_kernel3_10: new test
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

On 2022-08-23 00:14 +0200, Julien Olivain spake thusly:
> This commit add a test to check that a relatively old 3.10 kernel are
> building successfully in Buildroot. This test was written for
> investigating the bug described in:
> - https://bugs.busybox.net/show_bug.cgi?id=14971
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
[--SNIP--]
> diff --git a/support/testing/tests/core/test_kernel3_10.py b/support/testing/tests/core/test_kernel3_10.py
> new file mode 100644
> index 0000000000..5ff5ed1cad
> --- /dev/null
> +++ b/support/testing/tests/core/test_kernel3_10.py
> @@ -0,0 +1,43 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +# For testing the compilation of an old 3.10 kernel, we use a armv7
> +# gcc5 bootlin toolchain, which also includes 3.10 kernel headers.

I'm not sure we want such a test. If we wanted to test that we can build
an older kernel, then we should use a state-of-the-art toolchain, i.e.
at least the default settings in Buildroot, not an older toolchain.

However, that would validate that he kernel itself can be built with a
recent compiler, not that the kernel build infra can be built; indeed,
the infra uses the host compiler, not the target compiler, but we have
no way to test with a latest-ish gcc:

  * our reference image is still using an old system especially because
    we also want to ensure that we can still use Buildroot on such old
    systems;

  * we can't know what users have on their machine if they run the
    runtime test locally.

So, I am not sure this test is entirely meaningful.

Regards,
Yann E. MORIN.

> +class TestOldKernel3_10(infra.basetest.BRTest):
> +    config = \
> +        """
> +        BR2_arm=y
> +        BR2_cortex_a9=y
> +        BR2_ARM_EABIHF=y
> +        BR2_ARM_ENABLE_NEON=y
> +        BR2_ARM_ENABLE_VFP=y
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.108"
> +        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
> +        BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_TARGET_ROOTFS_CPIO_GZIP=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> +        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> +        BR2_TOOLCHAIN_EXTERNAL_CXX=y
> +        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +        BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
> +        BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> +        BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--glibc--stable-2017.05-toolchains-1-1.tar.bz2"
> +        """
> +
> +    def test_run(self):
> +        initrd = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
> +        kern = os.path.join(self.builddir, "images", "zImage")
> +        dtb = os.path.join(self.builddir, "images", "vexpress-v2p-ca9.dtb")
> +        self.emulator.boot(arch="armv7", kernel=kern,
> +                           kernel_cmdline=["console=ttyAMA0"],
> +                           options=["-M", "vexpress-a9", "-dtb", dtb, "-initrd", initrd])
> +        self.emulator.login()
> +        self.assertRunOk("true")
> -- 
> 2.37.2
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
