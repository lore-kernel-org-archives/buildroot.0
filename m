Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06C9C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 20:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D28D40103;
	Thu, 10 Mar 2022 20:45:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q3hoV06zHY8M; Thu, 10 Mar 2022 20:45:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A921405A4;
	Thu, 10 Mar 2022 20:45:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 376381BF331
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32890405A4
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 20:45:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qqxXYYOQt4kT for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 20:45:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDA3B40192
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 20:45:09 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id bg10so14768061ejb.4
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 12:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LJ0N0X90pc6hrrjYMTEmYW0+kBVf3qQHrudWardez3U=;
 b=CD/M9wFz0aNM8hR3p98PxUSHm2GvFM9FtiSX8M27dACzsV65qcf12FBTmbOp815V2e
 A0Y2DIXbVGo+3ukJhQK9AJdCYtUvHH+/3/8SA712opluTAJqh+W22yR5/4uOIOPnjqYY
 A2ZodaQPomWdKEOCNR2v+Xh2oyuhkkuKy+7upYteY4LFu1dCEQCbbTHuhyl9NwSvjTcg
 ySNFZ9cEnbuXcNb8LcOiwmvCaieZcenlgjlXLgTcn4FWjYWxSzGpHUyeehLRV7QMuz4D
 Bpgkuc9HZ5qrmr6IeidhRoSKWD5xP6L4zrQCgbBl8CIuIAT2/cpnUtGPh+H51elOaQCd
 hkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LJ0N0X90pc6hrrjYMTEmYW0+kBVf3qQHrudWardez3U=;
 b=Doq0paqD8AugCcQXVjx+1SOPAcjBDgQ7VnMm+BrbGSoBPtbq/aZ7zVqtQ3E46BMT+G
 tgiRIq8PHh+d7U0b1lnf+JAJK3NLud9vgGu0v6/+cN2yfIEXxgNwrSCL7UAqygMayIOI
 rb/x4I5T1BEehm3hiw1sj+DRtMWjHOVS5lnQiFBa84rJyay9vYD8AxpYFBrLQbvs2+6M
 u3qU1WZWiWv47ag7YO0uvJsOJV2BufheNd621BJf5AexmJ7FB+q297oshSjGmyWlw/O+
 G/FxfNMIGxiJDfNjlQN/lZtEuRrX0Vm80B4ElxM+SOz45IL5rih01HW2alM6+nNLKHiS
 SN6Q==
X-Gm-Message-State: AOAM533UB2HHQjI8U4E3OeUxa4tuwvfdc5x4efYrUDyhW1LwwrR0xyQr
 hHDxdAlwXjPfTugqOnm13ccNonHeHw6Hhw==
X-Google-Smtp-Source: ABdhPJzc6jtnQEZVoT7AANuHllQQPEThrMQAY81/h6KnBphrF0k40iZhQMfISdkAxoBZAQBS75fU0g==
X-Received: by 2002:a17:906:7948:b0:6da:64ed:178e with SMTP id
 l8-20020a170906794800b006da64ed178emr6055535ejo.523.1646945107984; 
 Thu, 10 Mar 2022 12:45:07 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 h26-20020aa7cdda000000b0040f75ad0e60sm851527edw.83.2022.03.10.12.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 12:45:07 -0800 (PST)
Message-ID: <ad06470e-6942-e8fc-49e7-cd446f4d18c7@mind.be>
Date: Thu, 10 Mar 2022 21:45:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220221230815.2203955-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220221230815.2203955-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] package/python-treq: bump to version
 22.2.0
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/02/2022 00:08, Fabrice Fontaine wrote:
> - hyperlink is a dependency since version 20.4.0 and
>    https://github.com/twisted/treq/commit/5475def96f3ec93075ff95709fec4acd154e6fed
> - six is not a dependency since version 21.5.0 and
>    https://github.com/twisted/treq/commit/22bdb399a03b0eebaa93023b80d348f584f567d5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-treq/Config.in        | 2 +-
>   package/python-treq/python-treq.hash | 4 ++--
>   package/python-treq/python-treq.mk   | 4 ++--
>   3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
> index 7c02a35638..5d76a5cdd6 100644
> --- a/package/python-treq/Config.in
> +++ b/package/python-treq/Config.in
> @@ -3,9 +3,9 @@ config BR2_PACKAGE_PYTHON_TREQ
>   	# twisted TLS -> python-{pyopenssl,service-identity}
>   	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>   	select BR2_PACKAGE_PYTHON_ATTRS # runtime
> +	select BR2_PACKAGE_PYTHON_HYPERLINK # runtime
>   	select BR2_PACKAGE_PYTHON_INCREMENTAL # runtime
>   	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
> -	select BR2_PACKAGE_PYTHON_SIX # runtime
>   	select BR2_PACKAGE_PYTHON_TWISTED # runtime
>   	select BR2_PACKAGE_PYTHON_TWISTED_TLS # runtime
>   	help
> diff --git a/package/python-treq/python-treq.hash b/package/python-treq/python-treq.hash
> index 288279cbd8..aecf71aad8 100644
> --- a/package/python-treq/python-treq.hash
> +++ b/package/python-treq/python-treq.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/treq/json
> -md5  b75f6c89fd481989a9cfdec8d61a6d84  treq-20.3.0.tar.gz
> -sha256  a72d7587d6f81c7a32620b00175825b4334bafbde73d37098d139ac7b11dca98  treq-20.3.0.tar.gz
> +md5  43892086d556e7596392134f1e10bdef  treq-22.2.0.tar.gz
> +sha256  df757e3f141fc782ede076a604521194ffcb40fa2645cf48e5a37060307f52ec  treq-22.2.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  7cc1b65e1937b1cc07052bb864ec96d8e5fd413400c0842e5b89a8201a600293  LICENSE
> diff --git a/package/python-treq/python-treq.mk b/package/python-treq/python-treq.mk
> index 320f57b6f2..57dc50ee74 100644
> --- a/package/python-treq/python-treq.mk
> +++ b/package/python-treq/python-treq.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_TREQ_VERSION = 20.3.0
> +PYTHON_TREQ_VERSION = 22.2.0
>   PYTHON_TREQ_SOURCE = treq-$(PYTHON_TREQ_VERSION).tar.gz
> -PYTHON_TREQ_SITE = https://files.pythonhosted.org/packages/98/09/25064d7224efde9fd51e8865353d516c53306e476eab27ab21fb258cf7d4
> +PYTHON_TREQ_SITE = https://files.pythonhosted.org/packages/cd/c8/b68ab17d994133baf6edbcb5551ba81e1494bdc6d5e21a9d4f3bc4315140
>   PYTHON_TREQ_LICENSE = MIT
>   PYTHON_TREQ_LICENSE_FILES = LICENSE
>   PYTHON_TREQ_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
