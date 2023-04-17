Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8B9C77B72
	for <buildroot@archiver.kernel.org>; Mon, 17 Apr 2023 20:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFE1082109;
	Mon, 17 Apr 2023 20:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFE1082109
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sP0nrkIgusIk; Mon, 17 Apr 2023 20:59:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11147820F6;
	Mon, 17 Apr 2023 20:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11147820F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1EE7F1BF2F6
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 20:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBAE560B28
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 20:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBAE560B28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id myHB_WwEBQIZ for <buildroot@lists.busybox.net>;
 Mon, 17 Apr 2023 20:59:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80AA060742
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80AA060742
 for <buildroot@buildroot.org>; Mon, 17 Apr 2023 20:59:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3E0505FFA0;
 Mon, 17 Apr 2023 22:59:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 17 Apr 2023 22:59:07 +0200
Date: Mon, 17 Apr 2023 22:59:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Witold Lipieta <witold.lipieta@thaumatec.com>
Message-ID: <20230417205907.GO2819@scaer>
References: <20230417130342.1119237-1-witold.lipieta@thaumatec.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230417130342.1119237-1-witold.lipieta@thaumatec.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681765152;
 bh=OCqI0yIuldECJ7fR0dNbmiAsz9yt7hVhK+jaeM0MIY4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iDk+yICJRvU7G51HNqZBIBP4PBm1B4ACLJ6Dd+FjU3sUB2PpJqbxmnJhHVsVPO2UO
 dcnjO1rGPK4ySnKVQaAlaTsqc6CJFTLvcukiBQpnbarnLzl/EjBTqzuWmS/rH87y8L
 j1pCJrQA5NrOWVmlt/SYv2BIK15mWqSmQqXMWxq4ssgHtVWb7qJ2n1yt1H9nIePcyg
 vYdJCeD11PMTPI/qBaYp7EWXhP9qvvcx27Q7z3uhMdLj+7/n90DrB4BTlorsVt/UUg
 POd2p5sJbETPJIE83STaHy1gYEWsnHrYeTc99l8ti2ymMeg1Cp34U+hWiCC7CsuJws
 qWkkouQsiSqHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iDk+yICJ
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-evdev: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Witold, All,

On 2023-04-17 15:03 +0200, Witold Lipieta spake thusly:
> evdev 1.6.1 https://pypi.org/project/evdev/
> 
> Signed-off-by: Witold Lipieta <witold.lipieta@thaumatec.com>
> ---
> Changes v1 -> v2:
>  - remove runtime dependency
>  - add dependency on linux 4.4 headers
>  - pass path to uinput.h during setup
>  - add basic runtime check

Thanks for the runtime test!

[--SNIP--]
> diff --git a/package/python-evdev/Config.in b/package/python-evdev/Config.in
> new file mode 100644
> index 0000000000..91e4642d48
> --- /dev/null
> +++ b/package/python-evdev/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_EVDEV
> +	bool "python-evdev"
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
> +	help
> +	  Bindings to the Linux input handling subsystem.
> +
> +	  https://github.com/gvalkov/python-evdev

When there is a dependency on toolchain features, we add a comment about
that:

    comment "python-evdev needs a toolchain w/ headers >= 4.4"
        depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4

So i've added that.

[--SNIP--]
> diff --git a/support/testing/tests/package/test_python_evdev.py b/support/testing/tests/package/test_python_evdev.py
> new file mode 100644
> index 0000000000..f2d64c7bd1
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_evdev.py
> @@ -0,0 +1,12 @@
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonPy3Evdev(TestPythonPackageBase):
> +    __test__ = True
> +    config = TestPythonPackageBase.config + \
> +        """
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_EVDEV=y
> +        """
> +    sample_scripts = ["tests/package/sample_python_evdev.py"]
> +    
> \ No newline at end of file

    $ make check-package
    support/testing/tests/package/test_python_evdev.py:0: run 'flake8' and fix the warnings
    support/testing/tests/package/test_python_evdev.py:12:1: W391 blank line at end of file
    support/testing/tests/package/test_python_evdev.py:12:1: W293 blank line contains whitespace
    1     W293 blank line contains whitespace
    1     W391 blank line at end of file

I also fixed that (and the "No newline at end of file" issue).

Applied to master, thanks.

Regards,
Yann E. MORIN.

> -- 
> 2.34.1
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
