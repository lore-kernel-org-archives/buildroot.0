Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FF8C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 21:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 983944168D;
	Thu, 18 Aug 2022 21:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 983944168D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N273nS-TBy29; Thu, 18 Aug 2022 21:10:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34C0A408C5;
	Thu, 18 Aug 2022 21:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34C0A408C5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 011A01BF315
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 21:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDD6860A9D
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 21:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDD6860A9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mtWbvKdyQF8T for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 21:10:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE66E60C1F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE66E60C1F
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 21:10:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b502:d67d:6967:6fb1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id E0233780346;
 Thu, 18 Aug 2022 23:10:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 18 Aug 2022 23:10:00 +0200
Date: Thu, 18 Aug 2022 23:10:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220818211000.GX2854108@scaer>
References: <20220815111710.1459820-1-arnout@mind.be>
 <20220815111710.1459820-3-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815111710.1459820-3-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660857005;
 bh=SYQXDtyXI8zi8/cF7tUw/EAtcwEfl/BC1nddsx3O688=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Av4rOGC4g9aPC3DZEvTVS/w0Aue3G45ogtdcgxN398v8+0Xq9ZzlBgUab61e9H7E6
 yzwf0jmxnykhgjl+yNFln2nQexV3mUb/F9sP3L7hzhxCTA+fCMW15y7fIrTLvHgDUo
 22WDZTz6JXKdclx0LEVwE2NrRfZjc8f4Jh62B0+EkvAiHfaEaFf3AJ1vvd9SBct7ZU
 LCZZ/itkkhkf+Er05AeWmdQe8IyPDZaiTnCShpGzVSSE/MQPIWwgtw3HkJejhzRpKU
 lNZAd3jhQGOgRQVBQlCylAHjjMJWRoa+Mn5EDRrO4By9kOQA1yw+SLXQWxurelPsPT
 1TRp8kfercSNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Av4rOGC4
Subject: Re: [Buildroot] [PATCH next v5 3/3]
 support/testing/tests/fs/test_cpio.py: new runtime test
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thierry Bultel <thierry.bultel@linatsea.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, Thierry, All,

On 2022-08-15 13:17 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> From: Thierry Bultel <thierry.bultel@linatsea.fr>
> 
> It includes a simple test for the full cpio image, and a test of the
> dracut image. To validate that the dracut image is a subset of the full
> image, 'pv' is added to the image, and the test verifies that pv is not
> part of the image. Note that the real rootfs is not mounted at the
> moment, so pv is never available in the running image.
> 
> Systemd and other init systems are currently untested.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied to next, with all the changes we discussed in this thread and
on IRC, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v4 -> v5 (Arnout)
>   - move runtime test to separate patch;
>   - add tests for all libcs;
>   - remove tar;
>   - add pv and test that it's not included in cpio.
> ---
>  support/testing/tests/fs/test_cpio.py | 93 +++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 support/testing/tests/fs/test_cpio.py
> 
> diff --git a/support/testing/tests/fs/test_cpio.py b/support/testing/tests/fs/test_cpio.py
> new file mode 100644
> index 0000000000..98620ebc06
> --- /dev/null
> +++ b/support/testing/tests/fs/test_cpio.py
> @@ -0,0 +1,93 @@
> +import os
> +import infra.basetest
> +import subprocess
> +
> +CHECK_FS_CMD = "mount | grep 'rootfs on / type rootfs'"
> +
> +
> +def boot_img(emulator, builddir):
> +    img = os.path.join(builddir, "images", "rootfs.cpio")
> +    emulator.boot(arch="armv7",
> +                  kernel="builtin",
> +                  options=["-initrd", "{}".format(img)])
> +    emulator.login()
> +    _, exit_code = emulator.run(CHECK_FS_CMD)
> +    return exit_code
> +
> +
> +class TestCpioFull(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_INIT_BUSYBOX=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_TARGET_ROOTFS_CPIO_FULL=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +
> +        exit_code = boot_img(self.emulator,
> +                             self.builddir)
> +        self.assertEqual(exit_code, 0)
> +
> +
> +class TestCpioDracutBase(infra.basetest.BRTest):
> +    config = \
> +        """
> +        BR2_arm=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_INIT_BUSYBOX=y
> +        BR2_PACKAGE_PV=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        BR2_TARGET_ROOTFS_CPIO_DRACUT=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def check_dracut(self):
> +        out = subprocess.check_output(["cpio", "--list"],
> +                                      stdin=open(os.path.join(self.builddir, "images/rootfs.cpio")),
> +                                      stderr=open(os.devnull, "w"),
> +                                      cwd=self.builddir,
> +                                      env={"LANG": "C"},
> +                                      universal_newlines=True)
> +        # pv should *not* be included in cpio image
> +        self.assertEqual(out.find("bin/pv"), -1)
> +
> +        exit_code = boot_img(self.emulator,
> +                             self.builddir)
> +        self.assertEqual(exit_code, 0)
> +
> +        # No pivot_root is done, so pv shouldn't be there
> +        _, exit_code = self.emulator.run("ls -l /usr/bin/pv")
> +        self.assertNotEqual(exit_code, 0)
> +
> +
> +class TestCpioDracutUclibc(TestCpioDracutBase):
> +    config = TestCpioDracutBase.config + \
> +        """
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_UCLIBC_STABLE=y
> +        """
> +
> +    def test_run(self):
> +        self.check_dracut()
> +
> +
> +class TestCpioDracutGlibc(TestCpioDracutBase):
> +    config = TestCpioDracutBase.config + \
> +        """
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
> +        """
> +
> +    def test_run(self):
> +        self.check_dracut()
> +
> +
> +class TestCpioDracutMusl(TestCpioDracutBase):
> +    config = TestCpioDracutBase.config + \
> +        """
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_MUSL_STABLE=y
> +        """
> +
> +    def test_run(self):
> +        self.check_dracut()
> -- 
> 2.37.1
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
