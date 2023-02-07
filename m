Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDA6C636D4
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E2E940120;
	Tue,  7 Feb 2023 17:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E2E940120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V1Nu--k7nTFV; Tue,  7 Feb 2023 17:03:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EA5940A68;
	Tue,  7 Feb 2023 17:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EA5940A68
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 629241BF5F8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4892F4159C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4892F4159C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oZZY4ecV3vmC for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:03:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8217D40877
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8217D40877
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:03:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 78C7713F8DB;
 Tue,  7 Feb 2023 18:03:01 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Feb 2023 18:03:01 +0100
Date: Tue, 7 Feb 2023 18:03:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sebastian Weyer <sebastian.weyer@smile.fr>
Message-ID: <20230207170301.GK4124@scaer>
References: <20230207165031.17188-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230207165031.17188-1-sebastian.weyer@smile.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675789383;
 bh=g8Xg9xd2k2Q/owyLhwKwObfbAdnDnmOZ6xz+SF9ibyE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MFyQ1QIqoMnVrI6m7iRt2dCha5jwyfywMUcETxK21SpOhGuvSaJSBRAZzdD1byBSo
 G+zdBj0j6BS5L11OfwwfVEfmyOCiezKrF0GX3gmKxm7vPLUM7vsi290oIVBlULkjCD
 xAQOMM7+5JBKfuSyyCrxp8v5N3ul4vvNBLzK3bsTUu9Syy1RJtBQPOiGuUbzg9NgVL
 iGu8TLylavl3igY3bL7xFe/T6Li4r3vOH/UMqw5z0kxV1d9yskHFEspZ6oxQBt9jmc
 suvT5XbweBy9l9a4hkg0cQGGceq4DGJlkXoojoMzcT5lumGHXENLM+JRBOsY9RcFv9
 YgTgpjiiyIoPg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MFyQ1QIq
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_rust.py: Add test
 to check correct vendoring
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

Sebastian, All,

On 2023-02-07 17:50 +0100, Sebastian Weyer spake thusly:
> Currently the tests TestRust and TestRustBin do check for vendoring by
> requiring package ripgrep to be built but only if the download
> directory is already empty, otherwise the existing contents of the download
> directory will be reused and therefore not be redownloaded.
> 
> This new test will only verify that the required packages are downloaded
> and vendored correctly without doing a runtime test. It does so by setting a
> path to a folder "dl" inside the build directory (output-directory/testname/)
> and then setting the environment variable BR2_DL_DIR to this path before the
> build starts. This code was essentially copied from the file
> test_gitforge.py which was added in commit
> 1ca6ab6ace3c1f9edfbfd16b57d1280b3ea2c6f5

There is a missing piece in this otherwise detailed commit log: why set
BR2_DL_DIR in the environment, rather than set it in the config options?

The reason is that a user may already have BR2_DL_DIR set in their own
envronment, and that would override the dl dir we set in the config
options.

No need to respin, that can be fixed when applying.

Regards,
Yann E. MORIN.

> We want the package ripgrep to be built since it requires vendoring
> directly. Additionally we want the package python-cryptography to be
> built because it has rust dependencies and therefore indirectly also requires
> vendoring.
> 
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> ---
>  support/testing/tests/package/test_rust.py | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
> index fb9dd2d916..763125ca20 100644
> --- a/support/testing/tests/package/test_rust.py
> +++ b/support/testing/tests/package/test_rust.py
> @@ -1,4 +1,5 @@
>  import os
> +import shutil
>  
>  import infra.basetest
>  
> @@ -54,3 +55,44 @@ class TestRust(TestRustBase):
>      def test_run(self):
>          self.login()
>          self.assertRunOk("rg Buildroot /etc/issue")
> +
> +
> +class TestRustVendoring(infra.basetest.BRConfigTest):
> +    config = \
> +        """
> +        BR2_arm=y
> +        BR2_cortex_a9=y
> +        BR2_ARM_ENABLE_NEON=y
> +        BR2_ARM_ENABLE_VFP=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        BR2_PACKAGE_HOST_RUSTC=y
> +        BR2_PACKAGE_RIPGREP=y
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
> +        BR2_BACKUP_SITE=""
> +        """
> +
> +    def setUp(self):
> +        super(TestRustVendoring, self).setUp()
> +
> +    def tearDown(self):
> +        self.show_msg("Cleaning up")
> +        if self.b and not self.keepbuilds:
> +            self.b.delete()
> +
> +    def check_download(self, package):
> +        # store downloaded tarball inside the output dir so the test infra
> +        # cleans it up at the end
> +        dl_dir = os.path.join(self.builddir, "dl")
> +        # enforce we test the download
> +        if os.path.exists(dl_dir):
> +            shutil.rmtree(dl_dir)
> +        env = {"BR2_DL_DIR": dl_dir}
> +        self.b.build(["{}-dirclean".format(package),
> +                      "{}-legal-info".format(package)],
> +                     env)
> +
> +    def test_run(self):
> +        self.check_download("ripgrep")
> +        self.check_download("python-cryptography")
> -- 
> 2.25.1
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
