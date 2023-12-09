Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D0CC4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 20:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8580240259;
	Sat,  9 Dec 2023 20:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8580240259
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uMDPDFSCwJx5; Sat,  9 Dec 2023 20:58:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77E6240350;
	Sat,  9 Dec 2023 20:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77E6240350
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 12E8D1BF681
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 20:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD61A40140
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 20:57:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD61A40140
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IDfgUlpKtAVe for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 20:57:40 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 541A140138
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 20:57:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 541A140138
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 98DD513F8A2;
 Sat,  9 Dec 2023 21:57:36 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 09 Dec 2023 21:57:36 +0100
Date: Sat, 9 Dec 2023 21:57:36 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <ZXTUwKM2anSyFJL3@landeda>
References: <20231206224422.16063-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231206224422.16063-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702155458;
 bh=BEh/YkGFlrN0tVeyxfDR+HFlK+MS8WlfyXev2tsJiv0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ujS32/edeTuY43IbmOXgP7wTQSKOhXyJcNOS/pCmI1MZeWxPml3JTYW6b27ByZAL4
 rTvgIopkZgpyZ+xjH84NMs58f06BdAFG9RpYgy4RMkzLUzqMfKtb0W86A9AOpAB5vo
 3PARK1JtlR7bmbAYDR2ZOjV9Zhb2wQ/pCZZnOUWCCJcZFXI62QV2NPq+RrLVHF0q7D
 lIB9Atba4jYpyfWnTs+m0irS2J+HCAWOqxoejySKZEu95UbicgDWX4+r410mjePymh
 ox8VkB4UjwTT1VA92Q3HokF8P+luwoOyyNidfpipwoyYFDhhSx9hy9jG7AI863xPw/
 Kl20e5rUR3GeA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ujS32/ed
Subject: Re: [Buildroot] [PATCH 1/3] support/testing: bump prebuilt kernel
 to 5.10.202
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

Romain, All,

On 2023-12-06 23:44 +0100, Romain Naour spake thusly:
> As reported on the mailing list [1], TestPolkitSystemd and
> TestPolkitInitd are failing since we bumped the Bootlin toolchain
> 2023.08 [2].
> 
> The issue is caused by expat (XML library) package detecting
> arc4random_buf() introduced by glibc 2.36 [3].
> 
> With arc4random_buf() support enabled, expat hang Polkit while reading
> its policy files (XML files) due to a lack of entropy on the system.
> 
> Upgrading the kernel allows to avoid such issue thanks to
> random_get_entropy_fallback() introduced in 5.10.119 (backpored) [4].
> 
> Build the vexpress-v2p-ca9 (armv7) 5.10.202 using the kernel
> configuration file found in /proc/config.gz but with additional kernel
> options provided by SYSTEMD_LINUX_CONFIG_FIXUPS. Indeed some kernel
> options requested by systemd were missing in 5.10.7 kernel.
> 
> Build the versatile-pb (armv5) kernel using the same kernel
> configuration as qemu_arm_versatile_defconfig but with additional
> kernel options like for vexpress-v2p-ca9. While at it, enable
> IKCONFIG_PROC option to provide the kernel configuration at runtime
> in /proc/config.gz.
> 
> Runtime tested:
> https://gitlab.com/kubu93/buildroot/-/pipelines/1097887826 (tests.package.test_polkit.TestPolkit*)
> https://gitlab.com/kubu93/buildroot/-/pipelines/1097705399 (tests.init.*)
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/5689309948 (TestPolkitSystemd)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/5689309947 (TestPolkitInitd)
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2023-December/680445.html
> [2] 452365a385ef35e808eb2eb669d1e3227c7399dd
> [3] https://sourceware.org/git/?p=glibc.git;a=commit;h=6f4e0fcfa2d2b0915816a3a3a1d48b4763a7dee2
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=fdca775081527364621857957655207d83035376
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

All three patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/infra/emulator.py | 8 ++++----
>  support/testing/run-tests         | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
> index 09f81eca89..624740fcb1 100644
> --- a/support/testing/infra/emulator.py
> +++ b/support/testing/infra/emulator.py
> @@ -54,16 +54,16 @@ class Emulator(object):
>  
>                  if arch == "armv7":
>                      kernel = infra.download(self.downloaddir,
> -                                            "kernel-vexpress-5.10.7")
> +                                            "kernel-vexpress-5.10.202")
>                      dtb = infra.download(self.downloaddir,
> -                                         "vexpress-v2p-ca9-5.10.7.dtb")
> +                                         "vexpress-v2p-ca9-5.10.202.dtb")
>                      qemu_cmd += ["-dtb", dtb]
>                      qemu_cmd += ["-M", "vexpress-a9"]
>                  elif arch == "armv5":
>                      kernel = infra.download(self.downloaddir,
> -                                            "kernel-versatile-5.10.7")
> +                                            "kernel-versatile-5.10.202")
>                      dtb = infra.download(self.downloaddir,
> -                                         "versatile-pb-5.10.7.dtb")
> +                                         "versatile-pb-5.10.202.dtb")
>                      qemu_cmd += ["-dtb", dtb]
>                      qemu_cmd += ["-M", "versatilepb"]
>                      qemu_cmd += ["-device", "virtio-rng-pci"]
> diff --git a/support/testing/run-tests b/support/testing/run-tests
> index e8c540f370..485811b746 100755
> --- a/support/testing/run-tests
> +++ b/support/testing/run-tests
> @@ -65,10 +65,10 @@ def main():
>      BRConfigTest.downloaddir = os.path.abspath(args.download)
>  
>      if args.prepare_only:
> -        emulator_builtin_binaries = ["kernel-vexpress-5.10.7",
> -                                     "vexpress-v2p-ca9-5.10.7.dtb",
> -                                     "kernel-versatile-5.10.7",
> -                                     "versatile-pb-5.10.7.dtb"]
> +        emulator_builtin_binaries = ["kernel-vexpress-5.10.202",
> +                                     "vexpress-v2p-ca9-5.10.202.dtb",
> +                                     "kernel-versatile-5.10.202",
> +                                     "versatile-pb-5.10.202.dtb"]
>          print("Downloading emulator builtin binaries")
>          for binary in emulator_builtin_binaries:
>              infra.download(BRConfigTest.downloaddir, binary)
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
