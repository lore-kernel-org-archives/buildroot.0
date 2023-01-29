Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406F2C05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 16:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFFD340570;
	Sun, 29 Jan 2023 16:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFFD340570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gJ4zyxPQdNgV; Sun, 29 Jan 2023 16:44:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81F62404B3;
	Sun, 29 Jan 2023 16:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81F62404B3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 352911BF476
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B6FC81778
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B6FC81778
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gk7fv3e2F2PL for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 16:42:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 052518140E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 052518140E
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:42:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3D0815FF95;
 Sun, 29 Jan 2023 17:42:50 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Jan 2023 17:42:49 +0100
Date: Sun, 29 Jan 2023 17:42:49 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230129164249.GN2632@scaer>
References: <20230129035232.2480871-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230129035232.2480871-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675010574;
 bh=a4RdOwOg1EMdjB567JtZXxphcdB+U3WjQU/rfazcWXM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iqMhJr5DTMe/9NieGFislku1qIZDq7tQBWA0v5uy205p85mN3G2vM2xSummVThfpU
 VnJ9lDgMrzH6QdddHYj31gNGympb6ESR4aTbBQAixreh5Q7mM7gODAvXP7iAVtVTdx
 Ow6hsNjtDJhdsPlIIiVsxnEP5/hKRXE9HG8x6KMDGKkYs3k4D5kCMxqrxT2rIuWL4O
 n8/hO2doOLcX6qUF4uBXwK5E4JdxOW7c64chqCBnoFn7MsiLy80Fy/1bz2fYBCczPS
 +7s3yN9m4laZPRW0WnIolKVdq5c4E7ybd7XDycU4XBqKo0RU2Cu9Sfk3tW50IDyg/V
 d1wUZUR959Ocg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iqMhJr5D
Subject: Re: [Buildroot] [PATCH v2 1/7] package/python-async-generator: new
 package
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

James, All,

On 2023-01-28 20:52 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Series of 7 patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS                                         |  1 +
>  package/Config.in                                  |  1 +
>  package/python-async-generator/Config.in           |  6 ++++++
>  .../python-async-generator.hash                    |  7 +++++++
>  .../python-async-generator.mk                      | 14 ++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/python-async-generator/Config.in
>  create mode 100644 package/python-async-generator/python-async-generator.hash
>  create mode 100644 package/python-async-generator/python-async-generator.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c8bc5eee22..6cf2b48a8f 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1365,6 +1365,7 @@ F:	package/python-aiosignal/
>  F:	package/python-aiozipkin/
>  F:	package/python-argon2-cffi/
>  F:	package/python-argon2-cffi-bindings/
> +F:	package/python-async-generator/
>  F:	package/python-async-lru/
>  F:	package/python-async-timeout/
>  F:	package/python-bidict/
> diff --git a/package/Config.in b/package/Config.in
> index 24be67b925..dd15467b11 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -962,6 +962,7 @@ menu "External python modules"
>  	source "package/python-arrow/Config.in"
>  	source "package/python-asgiref/Config.in"
>  	source "package/python-asn1crypto/Config.in"
> +	source "package/python-async-generator/Config.in"
>  	source "package/python-async-lru/Config.in"
>  	source "package/python-async-timeout/Config.in"
>  	source "package/python-attrs/Config.in"
> diff --git a/package/python-async-generator/Config.in b/package/python-async-generator/Config.in
> new file mode 100644
> index 0000000000..eb5720c652
> --- /dev/null
> +++ b/package/python-async-generator/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_ASYNC_GENERATOR
> +	bool "python-async-generator"
> +	help
> +	  Async generators and context managers for Python 3.5+.
> +
> +	  https://github.com/python-trio/async_generator
> diff --git a/package/python-async-generator/python-async-generator.hash b/package/python-async-generator/python-async-generator.hash
> new file mode 100644
> index 0000000000..3a94d5eb31
> --- /dev/null
> +++ b/package/python-async-generator/python-async-generator.hash
> @@ -0,0 +1,7 @@
> +# md5, sha256 from https://pypi.org/pypi/async_generator/json
> +md5  078a29b4afb3d7f38c097a530f042a55  async_generator-1.10.tar.gz
> +sha256  6ebb3d106c12920aaae42ccb6f787ef5eefdcdd166ea3d628fa8476abe712144  async_generator-1.10.tar.gz
> +# Locally computed sha256 checksums
> +sha256  b54d37617a67005623de975715952a2df062a2616c197bc3b6b451245b0c9265  LICENSE
> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
> +sha256  3e6dae555eb92787fc82d1d48355677f454c7f65aeb38d3f9e72bf9a3daf034b  LICENSE.MIT
> diff --git a/package/python-async-generator/python-async-generator.mk b/package/python-async-generator/python-async-generator.mk
> new file mode 100644
> index 0000000000..d5e4f430fc
> --- /dev/null
> +++ b/package/python-async-generator/python-async-generator.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-async-generator
> +#
> +################################################################################
> +
> +PYTHON_ASYNC_GENERATOR_VERSION = 1.10
> +PYTHON_ASYNC_GENERATOR_SOURCE = async_generator-$(PYTHON_ASYNC_GENERATOR_VERSION).tar.gz
> +PYTHON_ASYNC_GENERATOR_SITE = https://files.pythonhosted.org/packages/ce/b6/6fa6b3b598a03cba5e80f829e0dadbb49d7645f523d209b2fb7ea0bbb02a
> +PYTHON_ASYNC_GENERATOR_SETUP_TYPE = setuptools
> +PYTHON_ASYNC_GENERATOR_LICENSE = Apache-2.0 or MIT
> +PYTHON_ASYNC_GENERATOR_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
> +
> +$(eval $(python-package))
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
