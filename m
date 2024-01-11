Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BB0C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 11:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07AA342885;
	Thu, 11 Jan 2024 11:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07AA342885
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TXtKEA3N_DVw; Thu, 11 Jan 2024 11:40:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C01B4287C;
	Thu, 11 Jan 2024 11:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C01B4287C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B57E51BF983
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 11:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EBE183EFA
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 11:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EBE183EFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sfAduDl3i0Ka for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 11:40:50 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41F3483EF7
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 11:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41F3483EF7
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E83CAB00563;
 Thu, 11 Jan 2024 12:40:43 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Jan 2024 12:40:43 +0100
Date: Thu, 11 Jan 2024 12:40:43 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Antoine Coutant <antoine.coutant@smile.fr>
Message-ID: <ZZ_Tu6__HVQupUQr@landeda>
References: <20240111103819.3984913-1-antoine.coutant@smile.fr>
 <20240111103819.3984913-2-antoine.coutant@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240111103819.3984913-2-antoine.coutant@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704973247;
 bh=lPYMCua19uwaa6jfb2IqCzYd2qyzIgXdaNqj2SIKZBs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aN62WU4gPbpAbPJcCS7R21DGJJfwsi7JsJaaeVIk2aKd+Cuv5Pr67YHy7OmHtzdVM
 La56byWZHdpjj5/iNyuHb7jqZOrVdEg1n17V2mLL84XN9p09lanBzWHDTAAPfLWTrP
 0YeJr7QsC3Nv0sQSlQ7aSK33B+QuLwZ1CFYarVI39XAJP+V0b8n9f8TS9JGS+r7gOj
 RoRREXkxJv09c4/i27FQwG7y33miVHdaMfkM7c3HnPdSjlBKcQPvZvItvPT79IChIw
 YMMsDuvo3AibhEDP6EJsdQA5D6eahWtkrbASWypzi0rum55B1RS3Xt0jJWPXtlK8RL
 jGQIdWEuLDw4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aN62WU4g
Subject: Re: [Buildroot] [PATCH v4 2/3] support/testing: test_rust.py: Add
 test to check correct vendoring
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Antoine, Sebastian, All,

On 2024-01-11 11:38 +0100, Antoine Coutant spake thusly:
> From: Sebastian Weyer <sebastian.weyer@smile.fr>
> 
> Currently the tests TestRust and TestRustBin do check for vendoring by
> requiring package ripgrep to be built but only if the download
> directory is already empty, otherwise the existing contents of the download
> directory will be reused and therefore not be redownloaded.
> 
> This new test will only verify that the required packages are downloaded
> and vendored correctly without doing a runtime test. It does so by setting a
> path to a folder "dl" inside the build directory (output-directory/testname/)
> and then setting the environment variable BR2_DL_DIR to this path before the
> build starts. BR2_DL_DIR is not set in the config options because it would be
> overridden by the user's own environment variable if defined. This code was
> essentially copied from the file test_gitforge.py which was added in commit
> 1ca6ab6ace3c1f9edfbfd16b57d1280b3ea2c6f5
> 
> We want the package ripgrep to be built since it requires vendoring
> directly. Additionally we want the package python-cryptography to be
> built because it has rust dependencies and therefore indirectly also requires
> vendoring.
> 
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
> 	- make the change proposed here:
> 	http://patchwork.ozlabs.org/project/buildroot/patch/20230207165031.17188-1-sebastian.weyer@smile.fr/
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
