Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B99C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 830AF40339;
	Sun,  9 Jan 2022 22:51:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VLJi2iJPjW6P; Sun,  9 Jan 2022 22:51:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2D9B40327;
	Sun,  9 Jan 2022 22:51:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ACF2D1BF969
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B7E060B87
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:49:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HFPL22I6vDDr for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:49:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 855DB60B71
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:49:14 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id l10so23390765wrh.7
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 14:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FD2CuC7MDJlSfueZi+l+odgeZSr8uVCJJKziZGEQUUw=;
 b=Wn+dRxoTHUFIIwLvLUjmqh528hSkH5DY8PjAnTdjAp8xERSr6//9gE6yGc5ZsrD/JF
 Fb+VXDJopFWatO7H165nwXYPF2dLtJiIuD7MOTgOY7yX7XMaMFc0y7G9N+ZJ6UZ9u9XI
 DjK1chGkZ6qXr1TgBEoLSHFn1nfiDMwUBd0WSGovxdAFw6Fy0h5OkqBNw7X+MXMaZTJ6
 eO+IU+3WlHV/f0RhhruQNPwyHD2HmMH5evHIybJrCe1AW23LgWII9q0Pwec3HedfhU56
 m1u1b/o++4KCGRmXVc/q+yvhKdcP27cqt6338/W0QyUQ74tNIeJjlIND7RQ/8aKcvRMo
 sMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FD2CuC7MDJlSfueZi+l+odgeZSr8uVCJJKziZGEQUUw=;
 b=nefsWIeWRPmo5ilpHDVbExoJnuaSJEMh17Xy6502h91OdVrCtU+2KA9/FAvqG5XDAE
 UlmqXhRgKbNi8vRrakdARU5WftNG7CqX6vAlTUm3fq/bEYc9PoDbMEhwbmnPfJiPOHfG
 G83pDB0BY8bouj/sPfp+pj70getFVzAdgPXoTnDO+79xHliDhe2bzzCfP6FBUD06bLkb
 DfYinVCOeL6JAZVCkctnDUbVXuZ41f7cIn6o0TEFRWpY1/aXamcBYO8RK0xYCANjU1vd
 TK97VRkJZ7qIyf9u8hDDC7Y21Aqjt1pF4p92EPRruka6r1nOuE/xBj0KkKyNpFfX/L4M
 zbZw==
X-Gm-Message-State: AOAM533VNRMxkm2XklmTd4FRG7c4JPb0HSakvAcwjOr20sb09AlIkdSw
 rOLY6zLNfzIa3dW4+svYT/qBGA==
X-Google-Smtp-Source: ABdhPJyM1zDVPbk7qdRjRhOQDDk1ZzYtHXSXv7J5LR2BhkmQ1C9WOuVwJWIHWdFZ0JwJWnaGGvywjg==
X-Received: by 2002:a5d:456c:: with SMTP id a12mr1790480wrc.645.1641768552638; 
 Sun, 09 Jan 2022 14:49:12 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id z22sm5602723wmp.40.2022.01.09.14.49.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 14:49:12 -0800 (PST)
Message-ID: <756040b6-aff4-da3f-f6c8-468c58517288@mind.be>
Date: Sun, 9 Jan 2022 23:49:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220109035935.2698421-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220109035935.2698421-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-argon2-cffi-bindings:
 new package
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



On 09/01/2022 04:59, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>    - rebase on master
> ---
>   DEVELOPERS                                    |  1 +
>   package/Config.in                             |  1 +
>   package/python-argon2-cffi-bindings/Config.in | 11 ++++++++
>   .../python-argon2-cffi-bindings.hash          |  5 ++++
>   .../python-argon2-cffi-bindings.mk            | 25 +++++++++++++++++++
>   5 files changed, 43 insertions(+)
>   create mode 100644 package/python-argon2-cffi-bindings/Config.in
>   create mode 100644 package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash
>   create mode 100644 package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3b544cae6b..c5186e029a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1291,6 +1291,7 @@ F:	package/python-aiorwlock/
>   F:	package/python-aiosignal/
>   F:	package/python-aiozipkin/
>   F:	package/python-argon2-cffi/
> +F:	package/python-argon2-cffi-bindings/
>   F:	package/python-async-lru/
>   F:	package/python-async-timeout/
>   F:	package/python-bidict/
> diff --git a/package/Config.in b/package/Config.in
> index 378d6e8c0c..bc2113765b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -925,6 +925,7 @@ menu "External python modules"
>   	source "package/python-ansicolors/Config.in"
>   	source "package/python-argh/Config.in"
>   	source "package/python-argon2-cffi/Config.in"
> +	source "package/python-argon2-cffi-bindings/Config.in"
>   	source "package/python-arrow/Config.in"
>   	source "package/python-asgiref/Config.in"
>   	source "package/python-asn1crypto/Config.in"
> diff --git a/package/python-argon2-cffi-bindings/Config.in b/package/python-argon2-cffi-bindings/Config.in
> new file mode 100644
> index 0000000000..3d409759e0
> --- /dev/null
> +++ b/package/python-argon2-cffi-bindings/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PYTHON_ARGON2_CFFI_BINDINGS
> +	bool "python-argon2-cffi-bindings"
> +	depends on BR2_PACKAGE_PYTHON3
> +	depends on BR2_USE_MMU # libargon2
> +	depends on !BR2_STATIC_LIBS # libargon2
> +	select BR2_PACKAGE_PYTHON_CFFI # runtime
> +	select BR2_PACKAGE_LIBARGON2
> +	help
> +	  Low-level CFFI bindings for Argon2.
> +
> +	  https://github.com/hynek/argon2-cffi-bindings
> diff --git a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash
> new file mode 100644
> index 0000000000..e088d3dad1
> --- /dev/null
> +++ b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/argon2-cffi-bindings/json
> +md5  f1591e1af7dea9ef3e5b982e2c196c1d  argon2-cffi-bindings-21.2.0.tar.gz
> +sha256  bb89ceffa6c791807d1305ceb77dbfacc5aa499891d2c55661c6459651fc39e3  argon2-cffi-bindings-21.2.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256  9c158d4f433627f48ac24b6b4d37970afe4172514673c5318014d7cca157c6df  LICENSE
> diff --git a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
> new file mode 100644
> index 0000000000..f0d71e803a
> --- /dev/null
> +++ b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# python-argon2-cffi-bindings
> +#
> +################################################################################
> +
> +PYTHON_ARGON2_CFFI_BINDINGS_VERSION = 21.2.0
> +PYTHON_ARGON2_CFFI_BINDINGS_SOURCE = argon2-cffi-bindings-$(PYTHON_ARGON2_CFFI_BINDINGS_VERSION).tar.gz
> +PYTHON_ARGON2_CFFI_BINDINGS_SITE = https://files.pythonhosted.org/packages/b9/e9/184b8ccce6683b0aa2fbb7ba5683ea4b9c5763f1356347f1312c32e3c66e
> +PYTHON_ARGON2_CFFI_BINDINGS_SETUP_TYPE = setuptools
> +PYTHON_ARGON2_CFFI_BINDINGS_LICENSE = MIT
> +PYTHON_ARGON2_CFFI_BINDINGS_LICENSE_FILES = LICENSE
> +PYTHON_ARGON2_CFFI_BINDINGS_DEPENDENCIES = \
> +	host-python-cffi \
> +	host-python-setuptools-scm \
> +	libargon2
> +PYTHON_ARGON2_CFFI_BINDINGS_ENV = ARGON2_CFFI_USE_SYSTEM=1
> +
> +ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
> +PYTHON_ARGON2_CFFI_BINDINGS_ENV += ARGON2_CFFI_USE_SSE2=1
> +else
> +PYTHON_ARGON2_CFFI_BINDINGS_ENV += ARGON2_CFFI_USE_SSE2=0
> +endif
> +
> +$(eval $(python-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
