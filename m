Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC694C433FE
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 19:52:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86BBC60EE9
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 19:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86BBC60EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5171C4031E;
	Sun, 17 Oct 2021 19:52:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HhxmqbCgks5Q; Sun, 17 Oct 2021 19:52:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48C214032E;
	Sun, 17 Oct 2021 19:52:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E74B11BF59C
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 19:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF85E81551
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 19:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wSuApll2z9Eg for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 19:52:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9BE8814A1
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 19:52:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4430:5ced:ec21:1036])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A77867802BE;
 Sun, 17 Oct 2021 21:51:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634500319;
 bh=+6921WfDegX9Ne2qKdaIxUWeBbjkrMHCJgykJTgMoGs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gd5B0vh1RMfLrgcjBe0ygta6XRkiz/pS+7/4HqTJdbo+IK10wP3ljaEBocBIiOtHp
 ZfFwrr2xFouhS5CxlrKyBRcahyMNLQ4FuDz/rGedc+z0wemFU9emA0jKH0C7WMXNr1
 CINRP7EIDRMUtRMrrJ2H5DgRLkiFHCGQHeiobLAsz31Ec5ywdGwHG6eOEgmj3dE7U1
 iGFRHutPv9pcUmqHTvDW29WPI+g0SJWDg89521BheB8eLOuapn1jfIKVrBGVCXIf5P
 Bo9dpT2wXnUD4cmIln1qmHde17Q+qEUwnYBytvKrKPw0HpeL4aZlmcHuIUOXJh2RV0
 ZFqazz7NyL7HA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Oct 2021 21:51:53 +0200
Date: Sun, 17 Oct 2021 21:51:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211017195153.GM2400@scaer>
References: <20210912140658.253602-1-romain.naour@gmail.com>
 <20210912141140.253778-14-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210912141140.253778-14-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 16/16] support/testing: test_ubi: allow to
 boot several times using the same ubi image.
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2021-09-12 16:11 +0200, Romain Naour spake thusly:
> Since the ubi/ubifs test has been introduced, it's not possible to
> boot the same ubi image twice [1]:
> 
> "TODO: if you boot Qemu twice on the same UBI image, it fails to
> attach the image the second time, with "ubi0 error:
> ubi_read_volume_table: the layout volume was not found"."
> 
> For some reason, the kernel corrupt the ubi image if the ubifs
> rootfs is mounted with write access. Use a custom config file
> to mount the rootfs readonly (vol_type=static). Doing so requires
> to add the flash size (vol_size=64MiB).
> 
> At least it allows to boot several times the same ubi image.
> 
> [1] bf4a6490e4ee70f0a46e588602995ba34e6c872a
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/fs/test_ubi.py                     | 9 ++++-----
>  .../tests/fs/test_ubi/ubinize_qemu_pflash_cfi01.cfg      | 8 ++++++++
>  2 files changed, 12 insertions(+), 5 deletions(-)
>  create mode 100644 support/testing/tests/fs/test_ubi/ubinize_qemu_pflash_cfi01.cfg
> 
> diff --git a/support/testing/tests/fs/test_ubi.py b/support/testing/tests/fs/test_ubi.py
> index 7c687c1982..564a436d42 100644
> --- a/support/testing/tests/fs/test_ubi.py
> +++ b/support/testing/tests/fs/test_ubi.py
> @@ -13,12 +13,11 @@ class TestUbi(infra.basetest.BRTest):
>          BR2_TARGET_ROOTFS_UBI=y
>          BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x40000
>          BR2_TARGET_ROOTFS_UBI_SUBSIZE=1
> -        """
> +        BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG=y
> +        BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE="{}"
> +        """.format(
> +              infra.filepath("tests/fs/test_ubi/ubinize_qemu_pflash_cfi01.cfg"))
>  
> -    # TODO: if you boot Qemu twice on the same UBI image, it fails to
> -    # attach the image the second time, with "ubi0 error:
> -    # ubi_read_volume_table: the layout volume was not found".
> -    # To be investigated.
>      def test_run(self):
>          img = os.path.join(self.builddir, "images", "rootfs.ubi")
>          out = infra.run_cmd_on_host(self.builddir, ["file", img])
> diff --git a/support/testing/tests/fs/test_ubi/ubinize_qemu_pflash_cfi01.cfg b/support/testing/tests/fs/test_ubi/ubinize_qemu_pflash_cfi01.cfg
> new file mode 100644
> index 0000000000..52dd5f0007
> --- /dev/null
> +++ b/support/testing/tests/fs/test_ubi/ubinize_qemu_pflash_cfi01.cfg
> @@ -0,0 +1,8 @@
> +[ubifs]
> +mode=ubi
> +vol_id=0
> +vol_type=static
> +vol_name=rootfs
> +vol_alignment=1
> +vol_size=64MiB
> +image=BR2_ROOTFS_UBIFS_PATH
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
