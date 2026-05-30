Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E4DCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 22:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9D4260F9B;
	Sat, 30 May 2026 22:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKip6t4z32pV; Sat, 30 May 2026 22:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA3A16F576
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780181206;
	bh=u7GKutU5PzRW3E0ouULNTh78ZY+4a9ld5shukSjySME=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pT818GwjdnIVwuUCa/uf7fuEI/Ag7aiz8NPYjWwE4R2uFRWPzhQ0eqTfthaerOWN2
	 na1xQStU9Ty/jOlLF2bgpjGgiKMpoIw9NpQt57R5FCCwM9OrWXQcDsCh5XLQvSg/w0
	 jkkICcBOPCYEELcV5FMdtXNmwMQdDcpR4HqQXEDFoZ+SaehHHOjxhIt0AVMHefLoh3
	 9AGHF9XGUrmstGjMgQNBC2w9wRK56ODc690V498YYtElNiUYtw8VmMDjavNSxPZ6xr
	 k05dbN00w6JM76YAMeirIjwcpUBlyka0jA2iAzlE7O2ukUvKUKJGDDwnspcowJYjrH
	 Ap9zUF7xIze8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA3A16F576;
	Sat, 30 May 2026 22:46:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C84A9F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C521F401F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4aMd5TVjGMe for <buildroot@buildroot.org>;
 Sat, 30 May 2026 22:46:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B0B514014D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0B514014D
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0B514014D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:46:43 +0000 (UTC)
Received: from [192.168.1.80] (82-65-127-30.subs.proxad.net [82.65.127.30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 473452C84106;
 Sun, 31 May 2026 00:46:41 +0200 (CEST)
Message-ID: <7ff2942c-4efa-4769-847e-6848a93a64cd@bubu1.eu>
Date: Sun, 31 May 2026 00:46:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre Ondet <frcomdev@gmail.com>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260428171652.2544-1-frcomdev@gmail.com>
Content-Language: en-US
In-Reply-To: <20260428171652.2544-1-frcomdev@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1780181201; bh=bKduGwYJIW1JqwX2VLSNYeAM28Sdl15YtztiZgDiK60=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=UTAV68J972eejC7Oj0P0FZWX/FQbPSWjAhtECtVYdeknUc8J4+aB3PYO+fe+N/oF0
 TllbSf4EWCJ76dgK7klOasug+3ANgf6sBgu6txWe8+6SIHPSrogjSDAwFyuFpqOAkM
 ViWMpeplYHDVQcAqtEcSBoB1LxgTB1DbVf6HT32q0hOwLqgL8mGeMzgNf4nLIShXoI
 nCWracygx1OJal7BoB2k1gxCeX3DJ1sJhpX4++6gH1eOh2Fnsg+lfbjy33w0iJATVW
 1Zzf1BtzKGJF+L2hxXXKgHjvKM2y8/9YTt+CH4CoWDlKYW116Vj6kzA8ap/o5FbRUN
 qbq+9fnUrOXZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=UTAV68J9
Subject: Re: [Buildroot] [PATCH 01/13] package/python-cpu-load-generator:
 new package
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

Hi Alexamdre,
I also have a question about this package, see below.

On 4/28/26 19:16, Alexandre Ondet wrote:
> Signed-off-by: Alexandre Ondet <frcomdev@gmail.com>
> ---
>   package/Config.in                                  |  1 +
>   package/python-cpu-load-generator/Config.in        |  6 ++++++
>   .../python-cpu-load-generator.hash                 |  4 ++++
>   .../python-cpu-load-generator.mk                   | 14 ++++++++++++++
>   4 files changed, 25 insertions(+)
>   create mode 100644 package/python-cpu-load-generator/Config.in
>   create mode 100644 package/python-cpu-load-generator/python-cpu-load-generator.hash
>   create mode 100644 package/python-cpu-load-generator/python-cpu-load-generator.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 9cae377fb5..407966b37c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1059,6 +1059,7 @@ menu "External python modules"
>   	source "package/python-construct/Config.in"
>   	source "package/python-contourpy/Config.in"
>   	source "package/python-couchdb/Config.in"
> +	source "package/python-cpu-load-generator/Config.in"
>   	source "package/python-crayons/Config.in"
>   	source "package/python-crc/Config.in"
>   	source "package/python-crc16/Config.in"
> diff --git a/package/python-cpu-load-generator/Config.in b/package/python-cpu-load-generator/Config.in
> new file mode 100644
> index 0000000000..fceb6fdb32
> --- /dev/null
> +++ b/package/python-cpu-load-generator/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_CPU_LOAD_GENERATOR
> +	bool "python-cpu-load-generator"
> +	help
> +	  Generate a configurable CPU load for testing and benchmarking.
> +
> +	  https://pypi.org/project/cpu-load-generator/

This links to https://github.com/sirtyman/CPULoadGenerator which is 
forked from https://github.com/GaetanoCarlucci/CPULoadGenerator but 
actually way older? So I don't really understand why you would want to 
use and package the fork instead of the original version which seems to 
be a lot more active and maintained? (it does not seem to be on pypi, is 
the only thing, I think?)

But both of these version require psutil, so you would need to select 
BR2_PACKAGE_PYTHON_PSUTIL which is missing in your patch.

> diff --git a/package/python-cpu-load-generator/python-cpu-load-generator.hash b/package/python-cpu-load-generator/python-cpu-load-generator.hash
> new file mode 100644
> index 0000000000..6cf8c4dac4
> --- /dev/null
> +++ b/package/python-cpu-load-generator/python-cpu-load-generator.hash
> @@ -0,0 +1,4 @@
> +# From https://pypi.org/pypi/cpu-load-generator/1.2.0/json
> +sha256  41586edd59e5d9e75a39a0c8c86e8baa8eac0550dc4dab8c0bef9eeac328b8af  cpu-load-generator-1.2.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256  0de0992ffa96771645e251c62628bcb546ffaf1c13d5a42240a9a17941101e9e  LICENCE
> diff --git a/package/python-cpu-load-generator/python-cpu-load-generator.mk b/package/python-cpu-load-generator/python-cpu-load-generator.mk
> new file mode 100644
> index 0000000000..f81170d8b8
> --- /dev/null
> +++ b/package/python-cpu-load-generator/python-cpu-load-generator.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-cpu-load-generator
> +#
> +################################################################################
> +
> +PYTHON_CPU_LOAD_GENERATOR_VERSION = 1.2.0
> +PYTHON_CPU_LOAD_GENERATOR_SOURCE = cpu-load-generator-$(PYTHON_CPU_LOAD_GENERATOR_VERSION).tar.gz
> +PYTHON_CPU_LOAD_GENERATOR_SITE = https://files.pythonhosted.org/packages/source/c/cpu-load-generator
> +PYTHON_CPU_LOAD_GENERATOR_SETUP_TYPE = setuptools
> +PYTHON_CPU_LOAD_GENERATOR_LICENSE = MIT
> +PYTHON_CPU_LOAD_GENERATOR_LICENSE_FILES = LICENCE
> +
> +$(eval $(python-package))

I'm marking this as changes requested in patchwork.

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
