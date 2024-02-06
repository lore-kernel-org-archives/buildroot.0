Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCBFC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAC2882F32;
	Tue,  6 Feb 2024 17:56:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZhLpNB38KnDh; Tue,  6 Feb 2024 17:56:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5636C83216
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5636C83216;
	Tue,  6 Feb 2024 17:56:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D58C11BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA18540B67
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:56:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA18540B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SZKYgmNZM8ey for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:56:17 +0000 (UTC)
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5528E40A39
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5528E40A39
Received: from [192.168.17.123] (unknown [85.119.216.19])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 33A822C80CDD;
 Tue,  6 Feb 2024 18:56:15 +0100 (CET)
Message-ID: <553ce8df-aa66-4c92-be68-9486821ca36e@bubu1.eu>
Date: Tue, 6 Feb 2024 18:56:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20240206155140.2351424-1-romain.naour@smile.fr>
In-Reply-To: <20240206155140.2351424-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707242175; bh=/nHB7CdoOVH0qYBpT7p4EsWznbr/VsW/tqELVVpo0qE=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=UUB3HBi4zOpU0IP8p2XiFT9z88vX4lQS8j9QspzZM1jBknGV820kD3cfX0+olSE1p
 71BBLTkkn7eHeupXStPxjcafHanznT0CEKbThov8B5aGIYZQkitpsHlLYRLMl3g4b2
 o0+m+4HFFr+mf1efJzH8yPn2qhYdcvMm+idFBikrPTXgVU3wusGqHA7+ZL1n6SyBCr
 GsJUSwi2jktBGmaznbAq+fcp25X96rv7bXrjwc1XbAB1hYs1A8W/+QGwNYVo30nRFg
 JOuPpTm+MJJWfND9U5bGe0JqdzLRSqyvD4L6n7jyG+W7pXaGZc1bAPR+mm27BSpmgU
 X6t6xRdZj9jfw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=UUB3HBi4
Subject: Re: [Buildroot] [PATCH 1/2] package/python-bitarray: new package
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06.02.24 16:51, Romain Naour wrote:
> This package is needed at runtime by python-bitstring since
> 4.1.1 already.
> 
> Note: the License is under Python-2.0 but Python Software Foundation ("PSF")
> has been remplaced by the author of bitarray Ilan Schnell.

I had a bit of trouble understanding this sentence, so after IRL discussion:

The license of the package is "Python Software Foundation License (PSF)"
(with the developer name changed to the package author name).

> 
> [1] https://github.com/scott-griffiths/bitstring/releases/tag/bitstring-4.1.1
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
> Triple checked the license type with other distribution:
> https://salsa.debian.org/python-team/packages/python-bitarray/-/blob/master/debian/copyright?ref_type=heads
> https://src.fedoraproject.org/rpms/python-bitarray/blob/rawhide/f/python-bitarray.spec
> https://aur.archlinux.org/packages/python-bitarray

Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>

> ---
>   package/Config.in                            |  1 +
>   package/python-bitarray/Config.in            |  6 ++++++
>   package/python-bitarray/python-bitarray.hash |  5 +++++
>   package/python-bitarray/python-bitarray.mk   | 14 ++++++++++++++
>   4 files changed, 26 insertions(+)
>   create mode 100644 package/python-bitarray/Config.in
>   create mode 100644 package/python-bitarray/python-bitarray.hash
>   create mode 100644 package/python-bitarray/python-bitarray.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 728bd03b80..708dc376b1 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1007,6 +1007,7 @@ menu "External python modules"
>   	source "package/python-bcrypt/Config.in"
>   	source "package/python-beautifulsoup4/Config.in"
>   	source "package/python-bidict/Config.in"
> +	source "package/python-bitarray/Config.in"
>   	source "package/python-bitstring/Config.in"
>   	source "package/python-bleak/Config.in"
>   	source "package/python-blinker/Config.in"
> diff --git a/package/python-bitarray/Config.in b/package/python-bitarray/Config.in
> new file mode 100644
> index 0000000000..38d685f4fd
> --- /dev/null
> +++ b/package/python-bitarray/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_BITARRAY
> +	bool "python-bitarray"
> +	help
> +	  efficient arrays of booleans -- C extension.
> +
> +	  https://github.com/ilanschnell/bitarray
> diff --git a/package/python-bitarray/python-bitarray.hash b/package/python-bitarray/python-bitarray.hash
> new file mode 100644
> index 0000000000..d91a28af20
> --- /dev/null
> +++ b/package/python-bitarray/python-bitarray.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/bitarray/json
> +md5  024324a82314e9e68ecdcdefdc69071f  bitarray-2.9.2.tar.gz
> +sha256  a8f286a51a32323715d77755ed959f94bef13972e9a2fe71b609e40e6d27957e  bitarray-2.9.2.tar.gz
> +# Locally computed sha256 checksums
> +sha256  6b5e04f6e0462e1b97be833f9d65e66cd5eceb3283f4a6f532261087d0ab1233  LICENSE
> diff --git a/package/python-bitarray/python-bitarray.mk b/package/python-bitarray/python-bitarray.mk
> new file mode 100644
> index 0000000000..f86320c112
> --- /dev/null
> +++ b/package/python-bitarray/python-bitarray.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-bitarray
> +#
> +################################################################################
> +
> +PYTHON_BITARRAY_VERSION = 2.9.2
> +PYTHON_BITARRAY_SOURCE = bitarray-$(PYTHON_BITARRAY_VERSION).tar.gz
> +PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/c7/bf/25cf92a83e1fe4948d7935ae3c02f4c9ff9cb9c13e977fba8af11a5f642c
> +PYTHON_BITARRAY_SETUP_TYPE = setuptools
> +PYTHON_BITARRAY_LICENSE = Python-2.0
> +PYTHON_BITARRAY_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
