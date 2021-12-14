Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD33C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 19:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA55E40928;
	Tue, 14 Dec 2021 19:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ScR37gspI6PT; Tue, 14 Dec 2021 19:45:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04D5D409AB;
	Tue, 14 Dec 2021 19:45:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6398B1BF94B
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E64840948
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:45:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 45AZFEyI4GOQ for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 19:45:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C751408CD
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 19:45:44 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id y12so65919364eda.12
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 11:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TE9xAtfpPBh41TL9o6z0cIUn+og/sUIoh/8/YwDgaSc=;
 b=D4wz2B9jzta8C/UnBIv9QMwzqZvMQL3KPcWMgixl3K57mqQG3pVl2dZR/RTUIOP1EP
 VCShEiz3CBIqZySAyztl1pJ5BhRI2uqAEiqrME2mk240ChgPSF1rbY4UQPayD+OGuY5R
 b/CLH2TxCOAZjxQ3jO5Tj/fTbFKk97Yq/A/WnwGcK5lUHdr+BQbsY+zqI9hUFoVYTDUW
 msruZQtVS/BofiH76Cudhx6jLDmsR0TYhp2jlybI1iHaT40YPaEA8chsG7Ji2VpzyUHz
 YQ1EnSTKnwalipWVHUiChxZGIc690hi3xSF6lw572I1LF7HuQKMQJdDt8v9GZCnnZlfn
 9xKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TE9xAtfpPBh41TL9o6z0cIUn+og/sUIoh/8/YwDgaSc=;
 b=YLCj/oW9TmoV62it4uvOSOQ+7wXRxvFuOpdzpcmNWxyShCdMoHsImYaFWJkVc9visb
 zNBCNMO2UvE530VpwGreUJ1bhSctLnPaGWKJUMW0flnk8hhJYHvwmn6rqtwPJ0/XxmUn
 i+rv15QjwCfx6cu0KoTc5xSTL736vFGCOJEsW7BGKVIC+Oyvm+9UmodJgc8tL/OM/lwP
 yJCBckKT6PK8aZJ779Pm6uj/1etUXRKpgxH7nMbX12T3Z2oN0NvtsERvo/+ckecIjs1K
 mi0Yn+1xfy1tVXiRAyb+GrFKZaYDIlZiWWdrnQeHYkxh5rXlqt4ggK7thVn7FnXpa6fe
 z6pg==
X-Gm-Message-State: AOAM531wU9GaUodG3FlBkEdh+n79YMm+CWndHHTmqVZxdzXBuu1lwgmr
 Gne7I2SnbOS8mwMB2JNX1RkXc85bzM2L9A==
X-Google-Smtp-Source: ABdhPJxhd+u78Emh0eL+BNCIqSeiap96j03gtFAFQat0flLB41WQIHUfO/wNOtfzEfBvIEluhDS5vw==
X-Received: by 2002:a17:906:9756:: with SMTP id
 o22mr7619440ejy.324.1639511142718; 
 Tue, 14 Dec 2021 11:45:42 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id x14sm218807ejs.124.2021.12.14.11.45.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 11:45:42 -0800 (PST)
Message-ID: <44c993d1-35b6-188f-ace5-eb7fe03fa529@mind.be>
Date: Tue, 14 Dec 2021 20:45:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211212203739.947243-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211212203739.947243-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/dosfstools: add SELinux module
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/12/2021 21:37, Fabrice Fontaine wrote:
> Support for dosfstools is added by the system/fstools module in the
> SELinux refpolicy.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/dosfstools/dosfstools.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
> index 77b560ee9b..26a28670c0 100644
> --- a/package/dosfstools/dosfstools.mk
> +++ b/package/dosfstools/dosfstools.mk
> @@ -9,6 +9,7 @@ DOSFSTOOLS_SITE = https://github.com/dosfstools/dosfstools/releases/download/v$(
>   DOSFSTOOLS_LICENSE = GPL-3.0+
>   DOSFSTOOLS_LICENSE_FILES = COPYING
>   DOSFSTOOLS_CPE_ID_VENDOR = dosfstools_project
> +DOSFSTOOLS_SELINUX_MODULES = fstools
>   DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks --exec-prefix=/
>   HOST_DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
