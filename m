Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C96CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3667853E0;
	Sat, 30 May 2026 21:25:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tMrIkDqbNUIb; Sat, 30 May 2026 21:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6A8E853E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780176352;
	bh=uXX34HAO4nCWJyDR8iWXbxuyukA32luxS8t+lH6VZDQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TIWQtURqiBMqCaAD2hwkSyKipM2UPPcJgnisTknAJ0mMezWBd6uxdXOF+mhMaYE4h
	 0x5PkWh0Cm0dia4D5x1R+RxyA9EBkMTBjWZPtz8w+vH/iMwKcrqVIM+kXDRP3zzb/L
	 CWHw6zMR21D3waSJ0f9PKLY+xExh+f8I8k2UEG6hSttBlUruuCNc5o620zE/5XZqML
	 PNA8ThZ5PTGoqOih00P5meDthoo24CCDOnfrFJitC7m+rbapycIU8uY3kQw6/Q03tp
	 Jn1/AsSlRPZVnf0m/5oWmYnLLVUu8aayGtEdG6KtnwuiBxNYmKT9EgZG0A3iXRBdus
	 MElzPv/NQL6aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6A8E853E6;
	Sat, 30 May 2026 21:25:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A015F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FC65853E6
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LI5RPNghwW_f for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:25:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 11266853E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11266853E0
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 11266853E0
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:25:48 +0000 (UTC)
Received: from [192.168.1.80] (82-65-127-30.subs.proxad.net [82.65.127.30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 7B1132C89063;
 Sat, 30 May 2026 23:25:46 +0200 (CEST)
Message-ID: <7ee2e5a7-39d5-42a7-8068-f9b3e1adb81d@bubu1.eu>
Date: Sat, 30 May 2026 23:25:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre Ondet <frcomdev@gmail.com>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260428172707.2790-1-frcomdev@gmail.com>
Content-Language: en-US
In-Reply-To: <20260428172707.2790-1-frcomdev@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1780176346; bh=NCTBaNu95gUFaTQlY4LO3R7VfDI0j/yys1F7Xk5Ai2c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=egUKcMLSyCSF+p6GjyDYHw3LjrGpqPQ8jQ7e3wA+aIM/z0NqP5MDpHFiZ2iFDQuma
 lgHhH5CWh8S0yY/qR1mL0Rj+qoaUQndIuHJiAHFUPwXz8uMlTdRyUdqt68IqVpJWNR
 HU4PBeXlE0Jiiz7eMNW5M4vIH22N9EHW1Qj99MRHvRbzrBxLvdGDSIAlWorIViX9rj
 FP18VdsFh4oVRtCCD/wG3fQ1K2y/MYtNDn8N1hWmsFLpT6xiLs3p0Df2Lt/pX/9eht
 iAwC+6Ueid+SoU9bZWGADUlt5ngvmGh3ktcUQaXGB6yyhwK842PPvVxgXqOv75iULg
 /dnLPkCFlIZtw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=egUKcMLS
Subject: Re: [Buildroot] [PATCH 10/13] package/python-pytest-runner: new
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Alexandre,

I'm confused about this specific new package, see below.

On 4/28/26 19:27, Alexandre Ondet wrote:
> Signed-off-by: Alexandre Ondet <frcomdev@gmail.com>
> ---
>   package/Config.in                                  |  1 +
>   package/python-pytest-runner/Config.in             |  7 +++++++
>   .../python-pytest-runner/python-pytest-runner.hash |  3 +++
>   .../python-pytest-runner/python-pytest-runner.mk   | 14 ++++++++++++++
>   4 files changed, 25 insertions(+)
>   create mode 100644 package/python-pytest-runner/Config.in
>   create mode 100644 package/python-pytest-runner/python-pytest-runner.hash
>   create mode 100644 package/python-pytest-runner/python-pytest-runner.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 3c89a2a480..6513ffc4bb 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1367,6 +1367,7 @@ menu "External python modules"
>   	source "package/python-pytablewriter/Config.in"
>   	source "package/python-pytest/Config.in"
>   	source "package/python-pytest-asyncio/Config.in"
> +	source "package/python-pytest-runner/Config.in"
>   	source "package/python-pytrie/Config.in"
>   	source "package/python-pytz/Config.in"
>   	source "package/python-pyudev/Config.in"
> diff --git a/package/python-pytest-runner/Config.in b/package/python-pytest-runner/Config.in
> new file mode 100644
> index 0000000000..0a14e35c5d
> --- /dev/null
> +++ b/package/python-pytest-runner/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_PYTEST_RUNNER
> +	bool "python-pytest-runner"
> +	help
> +	  Setuptools plugin used when upstream packages rely on pytest-runner for
> +	  their setup or test entry points.

Could you explain your use case for this? If I'm reading this patch and 
the package description correctly, this is a plugin that would be used 
when building python packages on the target? Or did you intend to add 
this as a host package? But then it would be better to only do that when 
an in-tree package requires this.

Also reading the readme, it sounds like this package is deprecated since 
setup.py test is deprecated.

> +
> +	  https://pypi.org/project/pytest-runner/
> \ No newline at end of file
> diff --git a/package/python-pytest-runner/python-pytest-runner.hash b/package/python-pytest-runner/python-pytest-runner.hash
> new file mode 100644
> index 0000000000..4bbcf9a9f4
> --- /dev/null
> +++ b/package/python-pytest-runner/python-pytest-runner.hash
> @@ -0,0 +1,3 @@
> +# From https://pypi.org/pypi/pytest-runner/6.0.1/json
> +sha256  70d4739585a7008f37bf4933c013fdb327b8878a5a69fcbb3316c88882f0f49b  pytest-runner-6.0.1.tar.gz
> +sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
> \ No newline at end of file
> diff --git a/package/python-pytest-runner/python-pytest-runner.mk b/package/python-pytest-runner/python-pytest-runner.mk
> new file mode 100644
> index 0000000000..82b3c8628f
> --- /dev/null
> +++ b/package/python-pytest-runner/python-pytest-runner.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-pytest-runner
> +#
> +################################################################################
> +
> +PYTHON_PYTEST_RUNNER_VERSION = 6.0.1
> +PYTHON_PYTEST_RUNNER_SOURCE = pytest-runner-$(PYTHON_PYTEST_RUNNER_VERSION).tar.gz
> +PYTHON_PYTEST_RUNNER_SITE = https://files.pythonhosted.org/packages/source/p/pytest-runner
> +PYTHON_PYTEST_RUNNER_SETUP_TYPE = setuptools
> +PYTHON_PYTEST_RUNNER_LICENSE = MIT
> +PYTHON_PYTEST_RUNNER_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> \ No newline at end of file

Please make sure your files have a newline at the end.

Marcus

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
