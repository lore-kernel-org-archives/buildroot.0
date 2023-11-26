Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304A5C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 17:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8C3B60BB9;
	Sun, 26 Nov 2023 17:12:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8C3B60BB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oto-iuzqMOw0; Sun, 26 Nov 2023 17:12:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24ADC606F5;
	Sun, 26 Nov 2023 17:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24ADC606F5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 713B31BF28A
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 17:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A4AA812D3
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 17:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A4AA812D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nlEWuIh-AmgB for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 17:12:00 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 478AA812CF
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 17:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 478AA812CF
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4fcd:aaeb:59ee:6854])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 510AB780316;
 Sun, 26 Nov 2023 18:11:53 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 26 Nov 2023 18:11:53 +0100
Date: Sun, 26 Nov 2023 18:11:53 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231126171153.GY3177259@scaer>
References: <20231125081052.881728-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231125081052.881728-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701018717;
 bh=uV/ZDCLgA0NUi1nNCFlU7w0iQ80piKY5g6sJO2xu1CE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B/EDzeBc+IWOSWaw9SAFOLgjw/Wg4RBrCA1xciyU3bwhaw4BRxtWHcWUflwjki1iY
 vStupPka2O9iFAdqnVo9HvsAR0GJOsT+dPIkDwv3NVG/pYbSTOkOAfYwrEZW5gvTs6
 T2tB9lG9aiEHlPHoc3H2uKXcLoSh7KgpuulzxDGPNyum81gaoEKVbCyTdZHVmCaiJC
 HOplnoXpEkTKbeK9wad4LB4QkHJ4YAJRD5igIp0jeJE+0hRiGC5hjslC5SrigHsVyy
 Po+GBVZlSlJ1o47nXFjMXFKye3rT0eukQcWNPeq7VGFVV4XmCbYfLgHgfTPd4i6ZQc
 THB2BHr8V8+mA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B/EDzeBc
Subject: Re: [Buildroot] [PATCH 1/3] package/python-annotated-types: new
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

On 2023-11-25 01:10 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/Config.in                                 |  1 +
>  package/python-annotated-types/Config.in          |  6 ++++++
>  .../python-annotated-types.hash                   |  5 +++++
>  .../python-annotated-types.mk                     | 15 +++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-annotated-types/Config.in
>  create mode 100644 package/python-annotated-types/python-annotated-types.hash
>  create mode 100644 package/python-annotated-types/python-annotated-types.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 5a3410d758..68e6e29a4d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -974,6 +974,7 @@ menu "External python modules"
>  	source "package/python-aiozipkin/Config.in"
>  	source "package/python-alembic/Config.in"
>  	source "package/python-alsaaudio/Config.in"
> +	source "package/python-annotated-types/Config.in"
>  	source "package/python-ansicolors/Config.in"
>  	source "package/python-apispec/Config.in"
>  	source "package/python-appdirs/Config.in"
> diff --git a/package/python-annotated-types/Config.in b/package/python-annotated-types/Config.in
> new file mode 100644
> index 0000000000..36525a526b
> --- /dev/null
> +++ b/package/python-annotated-types/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_ANNOTATED_TYPES
> +	bool "python-annotated-types"
> +	help
> +	  Reusable constraint types to use with typing.Annotated.
> +
> +	  https://github.com/annotated-types/annotated-types
> diff --git a/package/python-annotated-types/python-annotated-types.hash b/package/python-annotated-types/python-annotated-types.hash
> new file mode 100644
> index 0000000000..1663bcb51f
> --- /dev/null
> +++ b/package/python-annotated-types/python-annotated-types.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/annotated-types/json
> +md5  5fe2125b08851f0d05a8efad6456861c  annotated_types-0.6.0.tar.gz
> +sha256  563339e807e53ffd9c267e99fc6d9ea23eb8443c08f112651963e24e22f84a5d  annotated_types-0.6.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256  fe1049884b1a0d9342901e88e07f32925d24b3121d9972b6a6805fb9824b095d  LICENSE
> diff --git a/package/python-annotated-types/python-annotated-types.mk b/package/python-annotated-types/python-annotated-types.mk
> new file mode 100644
> index 0000000000..8bc617069d
> --- /dev/null
> +++ b/package/python-annotated-types/python-annotated-types.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-annotated-types
> +#
> +################################################################################
> +
> +PYTHON_ANNOTATED_TYPES_VERSION = 0.6.0
> +PYTHON_ANNOTATED_TYPES_SOURCE = annotated_types-$(PYTHON_ANNOTATED_TYPES_VERSION).tar.gz
> +PYTHON_ANNOTATED_TYPES_SITE = https://files.pythonhosted.org/packages/67/fe/8c7b275824c6d2cd17c93ee85d0ee81c090285b6d52f4876ccc47cf9c3c4
> +PYTHON_ANNOTATED_TYPES_SETUP_TYPE = pep517
> +PYTHON_ANNOTATED_TYPES_LICENSE = MIT
> +PYTHON_ANNOTATED_TYPES_LICENSE_FILES = LICENSE
> +PYTHON_ANNOTATED_TYPES_DEPENDENCIES = host-python-hatchling
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
