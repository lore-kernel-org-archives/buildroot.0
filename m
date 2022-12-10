Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E708DC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 20:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64AFA410A5;
	Sat, 10 Dec 2022 20:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64AFA410A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aOJdXedaqPTt; Sat, 10 Dec 2022 20:23:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25F87410A6;
	Sat, 10 Dec 2022 20:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25F87410A6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AAEE1BF3E9
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62FCF40292
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62FCF40292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LzIlnTYPS62f for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 20:23:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0848440239
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0848440239
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 20:23:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9fcf:911b:99f4:8b0a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D64E85FFA2;
 Sat, 10 Dec 2022 21:23:00 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 10 Dec 2022 21:23:00 +0100
Date: Sat, 10 Dec 2022 21:23:00 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yegorslists@googlemail.com
Message-ID: <20221210202300.GE1044805@scaer>
References: <20221209102742.23798-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221209102742.23798-1-yegorslists@googlemail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670703785;
 bh=YNkQ7nQ0Fj7N5+F2hboX44zPRKCPSukGCNmBpr6bx50=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l3V9QUP0vDj7JiWXkAs3fUNF51nQll6pkbiStYK7gSTOFHInfa6zs/rbSkX4KFh6q
 g+4WcXlPJf/ZA+3FpzSkTP+CJh+jZKab0ojqb987NxJFuRQwMmEB1WKEV+HHt5T5WK
 O1em3H72aqcsZtHOL9m3d6aEz32acWNI9CmpLYZJTTbE3/2/5D6NP8bmlbL8MADqCQ
 I8sFQJp8+0ikNckB6OFEawlgmnHYlxjyzLTg/13FK/2IxaRtXXi+WrC1Sm9g+RGDkI
 sSzcgNU170miCDi4YU8MpephqoAUS3gpulIl9kVfftB9cdB3eUkcGdDwOwgJ4ouRLa
 7btrquJj6xcTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l3V9QUP0
Subject: Re: [Buildroot] [PATCH] package/python-munch: new package
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

Yegor, All,

On 2022-12-09 11:27 +0100, yegorslists--- via buildroot spake thusly:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/Config.in                      |  1 +
>  package/python-munch/Config.in         |  7 +++++++
>  package/python-munch/python-munch.hash |  5 +++++
>  package/python-munch/python-munch.mk   | 15 +++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 package/python-munch/Config.in
>  create mode 100644 package/python-munch/python-munch.hash
>  create mode 100644 package/python-munch/python-munch.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index f4a423c7a6..d5a673295d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1128,6 +1128,7 @@ menu "External python modules"
>  	source "package/python-msgfy/Config.in"
>  	source "package/python-msgpack/Config.in"
>  	source "package/python-multidict/Config.in"
> +	source "package/python-munch/Config.in"
>  	source "package/python-mutagen/Config.in"
>  	source "package/python-mwclient/Config.in"
>  	source "package/python-mwscrape/Config.in"
> diff --git a/package/python-munch/Config.in b/package/python-munch/Config.in
> new file mode 100644
> index 0000000000..9db2623674
> --- /dev/null
> +++ b/package/python-munch/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_MUNCH
> +	bool "python-munch"
> +	help
> +	  Munch is a dictionary that supports attribute-style access,
> +	  a la JavaScript.
> +
> +	  https://github.com/Infinidat/munch
> diff --git a/package/python-munch/python-munch.hash b/package/python-munch/python-munch.hash
> new file mode 100644
> index 0000000000..7e32282833
> --- /dev/null
> +++ b/package/python-munch/python-munch.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/munch/json
> +md5  ed84c3718416c8d4d03d0a6ef46e8e0c  munch-2.5.0.tar.gz
> +sha256  2d735f6f24d4dba3417fa448cae40c6e896ec1fdab6cdb5e6510999758a4dbd2  munch-2.5.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256  57ca95c92059c8380625192462979bd32994aae3fcdf902ff6eb1e467eeb0469  LICENSE.txt
> diff --git a/package/python-munch/python-munch.mk b/package/python-munch/python-munch.mk
> new file mode 100644
> index 0000000000..85f6803f07
> --- /dev/null
> +++ b/package/python-munch/python-munch.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-munch
> +#
> +################################################################################
> +
> +PYTHON_MUNCH_VERSION = 2.5.0
> +PYTHON_MUNCH_SOURCE = munch-$(PYTHON_MUNCH_VERSION).tar.gz
> +PYTHON_MUNCH_SITE = https://files.pythonhosted.org/packages/43/a1/ec48010724eedfe2add68eb7592a0d238590e14e08b95a4ffb3c7b2f0808
> +PYTHON_MUNCH_SETUP_TYPE = setuptools
> +PYTHON_MUNCH_LICENSE = MIT
> +PYTHON_MUNCH_LICENSE_FILES = LICENSE.txt
> +PYTHON_MUNCH_DEPENDENCIES = host-python-pbr
> +
> +$(eval $(python-package))
> -- 
> 2.17.0
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
