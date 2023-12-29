Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415E2C46CD4
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 20:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC86781DEA;
	Fri, 29 Dec 2023 20:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC86781DEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j96EK3nftahh; Fri, 29 Dec 2023 20:50:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DAE381DE9;
	Fri, 29 Dec 2023 20:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DAE381DE9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2C491BF317
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 20:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B85081DE9
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 20:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B85081DE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7qI1QeqzlqsL for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 20:50:10 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06E6D81AA7
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 20:50:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06E6D81AA7
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3926BB00548;
 Fri, 29 Dec 2023 21:50:06 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 29 Dec 2023 21:50:06 +0100
Date: Fri, 29 Dec 2023 21:50:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZY8w_seALD034sVV@landeda>
References: <20231229145025.237058-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231229145025.237058-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703883008;
 bh=O2+oRqHrm4Vd6zj6vUca4oCOCRStG/U+e+/C7OVykd4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FtAsp7u2nt2G1839yxgelGmWogUE6v0E8oHyyZM4G5e9mkyaf3l6NoZfpJbkVwUC2
 EqD9UTLBh36Ha3nsVBfyoZlARyvzwdrdiTe9X3oFpUO6deckCir+kDfQUtUZ79KdRq
 +gATTvDA8vBIX9Jij/NUQujXom/a84wgwLamRQJJDNxuZL/4p5Jh5qJ6HoOdo+mZ8h
 xT5eL3a6ST5c0BjH8Vs1FWfC4hf6h56zii+0DaDETODoQUPJ5T35TOcDSMF6z/bZ6Y
 RPDx/VuVRpSouJDWB+LKaufs3GE8PG9zLMliqZIGgd2Yp3niUP4aMCriYOW28XFiq4
 xOx2WnzhcmTQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FtAsp7u2
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_python_ml_dtypes:
 remove BR2_PACKAGE_PYTHON3_ZLIB
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

On 2023-12-29 15:50 +0100, Julien Olivain spake thusly:
> The test_python_ml_dtypes.py enabled BR2_PACKAGE_PYTHON3_ZLIB=y in its
> configuration to workaround the fact that the toolchain used to
> testing was tainted with zlib.
> 
> The commit 7e0e6e3
> "toolchain/toolchain-external/toolchain-external-bootlin: update to
> 2023.11-1" updated the toolchains which are no longer tainted with
> zlib.
> 
> The workaround is no longer needed and this commit removes this
> config, for consistency.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Patch tested on branch master at commit 7e0e6e3 with commands:
> 
>     make check-package
>     ...
>     0 warnings generated
> 
>     support/testing/run-tests \
>         -d dl -o output_folder \
>         tests.package.test_python_ml_dtypes
>     ...
>     OK
> ---
>  support/testing/tests/package/test_python_ml_dtypes.py | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_python_ml_dtypes.py b/support/testing/tests/package/test_python_ml_dtypes.py
> index 8d2369576b..8367107247 100644
> --- a/support/testing/tests/package/test_python_ml_dtypes.py
> +++ b/support/testing/tests/package/test_python_ml_dtypes.py
> @@ -4,16 +4,9 @@ from tests.package.test_python import TestPythonPackageBase
>  class TestPythonPy3MlDtypes(TestPythonPackageBase):
>      __test__ = True
>  
> -    # Note: BR2_PACKAGE_PYTHON3_ZLIB=y is needed as a runtime
> -    # dependency because the Bootlin toolchain used for this test is
> -    # tainted with zlib (and gets detected by python3/numpy).
> -    # See commit 8ce33fed "package/gdb: gdbserver does not need zlib".
> -    # This config entry can be removed as soon as the toolchain is
> -    # updated without zlib in its sysroot.
>      config = TestPythonPackageBase.config + \
>          """
>          BR2_PACKAGE_PYTHON3=y
> -        BR2_PACKAGE_PYTHON3_ZLIB=y
>          BR2_PACKAGE_PYTHON_ML_DTYPES=y
>          """
>      sample_scripts = ["tests/package/sample_python_ml_dtypes.py"]
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
