Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2A8C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 19:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7EA4408C8;
	Tue, 14 Dec 2021 19:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h02-rzuhdCXK; Tue, 14 Dec 2021 19:45:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C25A408CD;
	Tue, 14 Dec 2021 19:45:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 795E91BF94B
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68CEA408CD
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:45:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cQnIprnXhhmN for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 19:45:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA1FE408C8
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 19:45:33 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id b7so7601545edd.6
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 11:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=96AD1ReLydrxJaugZL0B+/Kl/cNIhzlzsAs8PJKlIZ8=;
 b=J/AcBipTizlRwSUHmyH7E+s/h8IHxqsfNQmapQACzfGhIRvMLwRI3GLUD/EuNTvUQW
 mAoMiT7RTSLadnm/jEw42broHZEXd/i4+ZNsc0WhbFZ7BguVxFkp1d5nRtkorkCCsLWy
 d3Ivny/fFRSNU4g5Oqulc0p4ZOsAQkGWZB8k9SUyesxA7VCQoiKZlmXq1pMN/cwL2YZr
 Yp8BGWdC2juzz6aRsN0mybWrmiWYY2JgPLRPtsr05ZL9tVjw/NviaxQ1PnI8yCQ0uNdb
 rrjmcpKfsgPgwHPLC/Z5/RFK/rl+2QhosSZf8t5jxHYlD6Tnbd/o2LyMN8WxdR5jgmm9
 YCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=96AD1ReLydrxJaugZL0B+/Kl/cNIhzlzsAs8PJKlIZ8=;
 b=aeGW7PtnOFoMy2uLvjgIh9eIqTU0BKmhp7cdIGC3+yxxvvJBrVB+Vl8q0MOZoGn9y2
 /ffb0MfRP83fYpp5TGN4hP3eCj3ApcKtuW0ri4rZjYNEG00Rgh9En+6H6HKzS58i6Y9t
 PDWNXpaf62StySxxjB7gnuWR7kM2BNyeKrooPrsso84Zy769DVah8uXt0wQzmGSRwr+i
 tD2ywEFuffwdx63xTETrzcu8PSjN+I8MZIdc6IXEPIvxF1S1BMQUmQkeQECLVGdOlnha
 hWVNYa5z3t1C6pmhSgmjrNVsepXaD1gl32hy5hqqL3M++3d4qk0/8K8vVbM2fhSIwjiJ
 8TxA==
X-Gm-Message-State: AOAM531EneABTyrtbyMVMiVJ43FecBX+AUB2Qm2YDCxGrglv/s4yBj4h
 CCkzKdgMtNMJvOz50qMhlLUwtELC3TbTBA==
X-Google-Smtp-Source: ABdhPJyXuCqzTQpRo3DPj0vlGvaS5T9ISmb1Uru4CCikaUPJ8KqOYXcncEfJ7PZn+ZehdqE6PAG45w==
X-Received: by 2002:a05:6402:510e:: with SMTP id
 m14mr10905199edd.312.1639511131675; 
 Tue, 14 Dec 2021 11:45:31 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q21sm291300edt.45.2021.12.14.11.45.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 11:45:31 -0800 (PST)
Message-ID: <b9201537-4f38-d7df-8e7b-54206e88469f@mind.be>
Date: Tue, 14 Dec 2021 20:45:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211212203527.944692-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211212203527.944692-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gnupg2: add SELinux module
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/12/2021 21:35, Fabrice Fontaine wrote:
> Support for gnupg2 is added by the apps/gpg module in the SELinux
> refpolicy.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gnupg2/gnupg2.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
> index 32c22b8257..906b79e0ab 100644
> --- a/package/gnupg2/gnupg2.mk
> +++ b/package/gnupg2/gnupg2.mk
> @@ -11,6 +11,7 @@ GNUPG2_LICENSE = GPL-3.0+
>   GNUPG2_LICENSE_FILES = COPYING
>   GNUPG2_CPE_ID_VENDOR = gnupg
>   GNUPG2_CPE_ID_PRODUCT = gnupg
> +GNUPG2_SELINUX_MODULES = gpg
>   GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba libnpth \
>   	$(if $(BR2_PACKAGE_LIBICONV),libiconv) host-pkgconf
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
