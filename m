Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1843C7619A
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 12:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 177A440A2F;
	Sat, 15 Apr 2023 12:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 177A440A2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Te_-B4K9yZma; Sat, 15 Apr 2023 12:41:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1362B40168;
	Sat, 15 Apr 2023 12:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1362B40168
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 34F961BF3A8
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 12:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E2EF6111A
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 12:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E2EF6111A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mhi-XWyvVCdv for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 12:41:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5B6E610B3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5B6E610B3
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 12:41:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C34CB5FF67;
 Sat, 15 Apr 2023 14:41:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Apr 2023 14:41:42 +0200
Date: Sat, 15 Apr 2023 14:41:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Witold Lipieta <witold.lipieta@thaumatec.com>
Message-ID: <20230415124142.GI2819@scaer>
References: <20230413093146.3440231-1-witold.lipieta@thaumatec.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230413093146.3440231-1-witold.lipieta@thaumatec.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681562507;
 bh=F3xyJdxZ2fP3MHJTTItnEsZp5GINEoaOtwKessa0nCg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cfBD/CgqkHy3ib9/I9CAC527uwqO0vqUrrOQHa/zVb1TssXgmLv9qQ55DZpQbM8u8
 qXz7EPsWraewuRJe+FWHeUEf4mxxV+mpNCtCErO7E0EkDpdGxY0eYutBWlvuI2WVi/
 8DOe7pH+yzy5TMX3YBBoa0Wu8UdGEBYM/W0Xp8u4oo9ZBD2dvudQ5r9so741GdI+Hf
 elQPaK4dj+GRYB6xQ79KERNva4+1nihEBBEhiThu3KyYWzUhcXqQ1JnTo+j8IXDWM0
 zdeIgHd6erSc/qD9UCenRJPiYKrhZG5cxNdSSLyVbj7C3+SIL76Ya6bKtLUoJbFYaD
 sipJeTbLLHfAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cfBD/Cgq
Subject: Re: [Buildroot] [PATCH 1/1] package/python-segno: new package
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

On 2023-04-13 11:31 +0200, Witold Lipieta spake thusly:
> segno 1.5.2 https://pypi.org/project/segno/

I was a bit surprised to see no dependency of any kind, so I tried a
basic, minimalist build with this defconfig:

    BR2_arm=y
    BR2_cortex_a7=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_PER_PACKAGE_DIRECTORIES=y
    BR2_PACKAGE_PYTHON3=y

And indeed that fails:

    # python3
    Python 3.11.2 (main, Apr 15 2023, 14:18:20) [GCC 12.2.0] on linux
    Type "help", "copyright", "credits" or "license" for more information.
    >>> import segno
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
      File "/usr/lib/python3.11/site-packages/segno/__init__.py", line 18, in <module>
      File "/usr/lib/python3.11/site-packages/segno/writers.py", line 21, in <module>
    ModuleNotFoundError: No module named 'zlib'

So, at the bare minimum, it should select BR2_PACKAGE_PYTHON3_ZLIB.

I am not sure I understand the documetnation properly, but there are a
few candidate modules that seem like they may be dependencies.

  - PIL (not in Buildroot, but we have pillow)
  - qrcode-artistic (not in Buildroot)

Also, a runtime test would be immensely useful to have, to validate
that at least the very basic features do work. See existing tests in
support/testing/tests/package/test_python*

Can you have a look at the above issues, and resubmit a newer patch,
please?

Regards,
Yann E. MORIN.

> Signed-off-by: Witold Lipieta <witold.lipieta@thaumatec.com>
> ---
>  package/Config.in                      |  1 +
>  package/python-segno/Config.in         |  6 ++++++
>  package/python-segno/python-segno.hash |  5 +++++
>  package/python-segno/python-segno.mk   | 14 ++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/python-segno/Config.in
>  create mode 100644 package/python-segno/python-segno.hash
>  create mode 100644 package/python-segno/python-segno.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 760dda6ac1..68949295df 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1273,6 +1273,7 @@ menu "External python modules"
>  	source "package/python-sdnotify/Config.in"
>  	source "package/python-secretstorage/Config.in"
>  	source "package/python-see/Config.in"
> +	source "package/python-segno/Config.in"
>  	source "package/python-selenium/Config.in"
>  	source "package/python-semver/Config.in"
>  	source "package/python-sentry-sdk/Config.in"
> diff --git a/package/python-segno/Config.in b/package/python-segno/Config.in
> new file mode 100644
> index 0000000000..5c6ada7e68
> --- /dev/null
> +++ b/package/python-segno/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_SEGNO
> +	bool "python-segno"
> +	help
> +	  QR Code and Micro QR Code generator for Python 2 and Python 3
> +
> +	  https://github.com/heuer/segno/
> diff --git a/package/python-segno/python-segno.hash b/package/python-segno/python-segno.hash
> new file mode 100644
> index 0000000000..286bdf3615
> --- /dev/null
> +++ b/package/python-segno/python-segno.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/segno/json
> +md5  6d7c852f951501cd3af85ef061d6bee4  segno-1.5.2.tar.gz
> +sha256  983424b296e62189d70fc73460cd946cf56dcbe82b9bda18c066fc1b24371cdc  segno-1.5.2.tar.gz
> +# Locally computed sha256 checksums
> +sha256  98b0a86ca0cbf68c95051741bc983425a43fdece775fe0e2712e66be459cc9d1  LICENSE
> diff --git a/package/python-segno/python-segno.mk b/package/python-segno/python-segno.mk
> new file mode 100644
> index 0000000000..c832f38f4b
> --- /dev/null
> +++ b/package/python-segno/python-segno.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-segno
> +#
> +################################################################################
> +
> +PYTHON_SEGNO_VERSION = 1.5.2
> +PYTHON_SEGNO_SOURCE = segno-$(PYTHON_SEGNO_VERSION).tar.gz
> +PYTHON_SEGNO_SITE = https://files.pythonhosted.org/packages/90/2a/2fedf1023f9273d8326362df7936748ebadef92ba53ab7970d9b8df1a6c2
> +PYTHON_SEGNO_SETUP_TYPE = setuptools
> +PYTHON_SEGNO_LICENSE = BSD-3-Clause
> +PYTHON_SEGNO_LICENSE_FILES = LICENSE
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
