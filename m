Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E24C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 07:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FD09405BF;
	Mon, 10 Jan 2022 07:19:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1MkxYaAdmq-p; Mon, 10 Jan 2022 07:19:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B439405B4;
	Mon, 10 Jan 2022 07:19:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D6A4F1BF334
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D129B405B4
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:19:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2csXnkeovzdf for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 07:19:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81954400BF
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 07:19:28 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v6so24814898wra.8
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 23:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ieor9ZIf40RvguoSslgQSkMslGSRhVj5Sejj2UUTZ18=;
 b=A+js/g4KQ+pT3oHvP6L/LEB/k/puxMOnsJMpilFenHxNQnfMiRcjuboaPitfJ3By9W
 UQ6uQjf4/B0lfK+GmEl6vSsbfBC2iDOjIca9wxCoTpBC6Ls6dJKTVnZ+eZlH3/q0GtRV
 K3CnbLS+hTyKOVZJnnmN6fUBB53AmoCjV43a4H0gtLvGzhMrKniKYUkQAfFUi9ah8s0v
 DfejH43SnV9uQeoFbnhLD9BR+mjC0pz2ecFSVmMSaRp8s1NDp676Tk+pb+HcS58oE6Tw
 9IuqFnmq+O2dDexhnjU4vFrK4WAiWK3iicI5WbyiK/aH0tCV58b6zMDfZbBsTwUsP6nL
 V2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ieor9ZIf40RvguoSslgQSkMslGSRhVj5Sejj2UUTZ18=;
 b=evh2ssfX1AOKjIxs+9yB98OOk1hS9NphEDdEsOH342FpamGkzeVvRc/0JtkMWJnjna
 GDd6gUbGxc//qgpqBbjs9cKqDaburiQxMw+nM4kSlOennk98E29v9RG6qslh/rG4q97O
 np7tzpccrgWYosc0pEvyKiKiC8QPs481iSQvXNIVZWtMZulVc1FwdvgfBwPh+MtCxTzB
 kn+ZcJ4wL/x/S3pRUJCsB9WZtZ16rMezRy78t+G+OjQvQZAEXL+b1LcWNc0ihJ6BsA7f
 77TTt3cKPpdVdr96Mm9BsnyVAxE4fFk6NLfOs8St7fqIpYsZC5YZTHZG+lLasYjh/A4J
 i2uQ==
X-Gm-Message-State: AOAM531jJhTmy+7SRXmTkBc43qKafjVmPx/w9wFs18ExR9gZ+v5ASd7G
 Zxcrs/oZl+KF0xbSjEUIQqCuow==
X-Google-Smtp-Source: ABdhPJygPhUkLHFrXS/UFK1+8Bd8ksHUB9JfOUFQVYJXC25ReeakY01CyIOjQXUCipa26W1O32ZGuA==
X-Received: by 2002:adf:f84e:: with SMTP id d14mr1044738wrq.109.1641799166717; 
 Sun, 09 Jan 2022 23:19:26 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id l6sm7859157wry.18.2022.01.09.23.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 23:19:26 -0800 (PST)
Message-ID: <c7c67d20-713c-0d1f-8bc6-32fdc8000d1b@mind.be>
Date: Mon, 10 Jan 2022 08:19:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20220109170200.1315505-1-ju.o@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220109170200.1315505-1-ju.o@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-distro: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/01/2022 18:02, Julien Olivain wrote:
> python-distro provides information about the OS distribution it runs on,
> such as a reliable machine-readable ID, or version information.
> 
> It is the recommended replacement for Python's original
> platform.linux_distribution function (removed in Python 3.8). It also
> provides much more functionality which isn't necessarily Python bound,
> like a command-line interface.
> 
> https://github.com/nir0s/distro
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS                               |  1 +
>   package/Config.in                        |  1 +
>   package/python-distro/Config.in          | 13 +++++++++++++
>   package/python-distro/python-distro.hash |  3 +++
>   package/python-distro/python-distro.mk   | 14 ++++++++++++++
>   5 files changed, 32 insertions(+)
>   create mode 100644 package/python-distro/Config.in
>   create mode 100644 package/python-distro/python-distro.hash
>   create mode 100644 package/python-distro/python-distro.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 2ad76a80e4..a44f07be97 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1590,6 +1590,7 @@ F:	package/fluid-soundfont/
>   F:	package/fluidsynth/
>   F:	package/glslsandbox-player/
>   F:	package/ptm2human/
> +F:	package/python-distro/
>   F:	package/python-pyalsa/
>   
>   N:	Julien Viard de Galbert <julien@vdg.name>
> diff --git a/package/Config.in b/package/Config.in
> index edae7e4f62..47087f52cb 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -999,6 +999,7 @@ menu "External python modules"
>   	source "package/python-dialog/Config.in"
>   	source "package/python-dialog3/Config.in"
>   	source "package/python-dicttoxml/Config.in"
> +	source "package/python-distro/Config.in"
>   	source "package/python-django/Config.in"
>   	source "package/python-django-enumfields/Config.in"
>   	source "package/python-dnspython/Config.in"
> diff --git a/package/python-distro/Config.in b/package/python-distro/Config.in
> new file mode 100644
> index 0000000000..bb4151541e
> --- /dev/null
> +++ b/package/python-distro/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_PYTHON_DISTRO
> +	bool "python distro"
> +	help
> +	  distro provides information about the OS distribution it
> +	  runs on, such as a reliable machine-readable ID, or version
> +	  information.
> +
> +	  It is the recommended replacement for Python's original
> +	  platform.linux_distribution function (removed in Python
> +	  3.8). It also provides much more functionality which isn't
> +	  necessarily Python bound, like a command-line interface.
> +
> +	  https://github.com/nir0s/distro
> diff --git a/package/python-distro/python-distro.hash b/package/python-distro/python-distro.hash
> new file mode 100644
> index 0000000000..e2b3c0a444
> --- /dev/null
> +++ b/package/python-distro/python-distro.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  83f5e5a09f9c5f68f60173de572930effbcc0287bb84fdc4426cb4168c088424  distro-1.6.0.tar.gz
> +sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
> diff --git a/package/python-distro/python-distro.mk b/package/python-distro/python-distro.mk
> new file mode 100644
> index 0000000000..753e74d020
> --- /dev/null
> +++ b/package/python-distro/python-distro.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-distro
> +#
> +################################################################################
> +
> +PYTHON_DISTRO_VERSION = 1.6.0
> +PYTHON_DISTRO_SITE = https://files.pythonhosted.org/packages/a5/26/256fa167fe1bf8b97130b4609464be20331af8a3af190fb636a8a7efd7a2
> +PYTHON_DISTRO_SOURCE = distro-$(PYTHON_DISTRO_VERSION).tar.gz
> +PYTHON_DISTRO_LICENSE = Apache-2.0
> +PYTHON_DISTRO_LICENSE_FILES = LICENSE
> +PYTHON_DISTRO_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
