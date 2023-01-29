Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03478C05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 21:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D91B8175A;
	Sun, 29 Jan 2023 21:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D91B8175A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hcj1s9BKVZOC; Sun, 29 Jan 2023 21:19:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E01FE8174F;
	Sun, 29 Jan 2023 21:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E01FE8174F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C4761BF576
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F13860AEA
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F13860AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V5pX37nT6vPh for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 21:19:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44A5660ADA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 44A5660ADA
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 21:19:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id EA79D5FFA3;
 Sun, 29 Jan 2023 22:18:53 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Jan 2023 22:18:53 +0100
Date: Sun, 29 Jan 2023 22:18:53 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230129211853.GX2632@scaer>
References: <20230127141058.2180747-1-james.hilliard1@gmail.com>
 <20230127141058.2180747-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230127141058.2180747-2-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675027143;
 bh=4BjuVAiN6o7mrf+uE2JDRR90fwiJCcgcFx6Im/nWLww=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aH1f/a6hUFSXJIpeUKzC/S7dVxfF0sAL5r77+Uza4iNS7FRZSFFSWo7JISsPA2gQY
 z6ItOQnlJUdLfyPRAoht0xzoHOr3/oArAocqaPcZHym7KUoXtRnUWsVSjz9rE4qv8a
 F5hOYdQUdmSY2KTtO9rrykCVI7XRZTLnOvMCb/21mPYqwlbGtqaYEKDqpoje1vBe3j
 obms2X86b/ioxtvdVLQ4mdFKn4S9GriCWWn32zmMQwq+/6nwnHH7SQS1jgRjT5gMiX
 2yXaayj3J6zs9+OoH4nmrNpTGsmyAkiaKtekFm+cOVpydBfJC+2WAdOOKIEKr2Zvor
 qeVockIS1GO4g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aH1f/a6h
Subject: Re: [Buildroot] [PATCH v4 02/13] package/cpuinfo: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-01-27 07:10 -0700, James Hilliard spake thusly:
> From: Stefan Hager <stefan.hager@ginzinger.com>
> 
> This package is required by tensorflow-lite.
> 
> Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
> Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/cpuinfo/Config.in b/package/cpuinfo/Config.in
> new file mode 100644
> index 0000000000..137f657d69
> --- /dev/null
> +++ b/package/cpuinfo/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_CPUINFO
> +	bool "cpuinfo"
> +	depends on BR2_INSTALL_LIBSTDCPP

The CMakeList.txt requires a CXX compiler but it looks like cpuinfo is a
C-only package, as I could not find any C++ source file, except some
test cases, and the benchmarks but they are disabled.

So, I think we should make C++ optional and submit the patch upstream.

Regards,
Yann E. MORIN.

> +	help
> +	  CPU INFOrmation library, cpuinfo is a library to detect
> +	  essential for performance optimization information about
> +	  host CPU.
> +
> +	  https://github.com/pytorch/cpuinfo
> diff --git a/package/cpuinfo/cpuinfo.hash b/package/cpuinfo/cpuinfo.hash
> new file mode 100644
> index 0000000000..c3f70fa90f
> --- /dev/null
> +++ b/package/cpuinfo/cpuinfo.hash
> @@ -0,0 +1,4 @@
> +# Locally calculated
> +sha256  0936848904943381b2c01321101614776e43d583840ee0f3ceeea1e3fb7405f7  cpuinfo-de2fa78ebb431db98489e78603e4f77c1f6c5c57.tar.gz
> +# License files, locally calculated
> +sha256  8e7e60636c3aa0cb03571a1a841ce5697f9551ff92b3c426c2561613d15ade70  LICENSE
> diff --git a/package/cpuinfo/cpuinfo.mk b/package/cpuinfo/cpuinfo.mk
> new file mode 100644
> index 0000000000..ab6a0269ec
> --- /dev/null
> +++ b/package/cpuinfo/cpuinfo.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# cpuinfo
> +#
> +################################################################################
> +
> +CPUINFO_VERSION = de2fa78ebb431db98489e78603e4f77c1f6c5c57
> +CPUINFO_SITE = $(call github,pytorch,cpuinfo,$(CPUINFO_VERSION))
> +CPUINFO_LICENSE = BSD-2-Clause
> +CPUINFO_LICENSE_FILES = LICENSE
> +CPUINFO_INSTALL_STAGING = YES
> +CPUINFO_CONF_OPTS = \
> +	-DCPUINFO_BUILD_UNIT_TESTS=OFF \
> +	-DCPUINFO_BUILD_MOCK_TESTS=OFF \
> +	-DCPUINFO_BUILD_BENCHMARKS=OFF
> +
> +$(eval $(cmake-package))
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
