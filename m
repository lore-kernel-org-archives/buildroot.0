Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBFEC433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 19:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08072418FC;
	Wed,  4 May 2022 19:47:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KTS4D07ytjI5; Wed,  4 May 2022 19:47:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB9EE416B6;
	Wed,  4 May 2022 19:47:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3EC381BF3BE
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 19:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A68C416B6
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 19:47:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lp0IcHfxU-TT for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 19:47:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 044E941517
 for <buildroot@buildroot.org>; Wed,  4 May 2022 19:47:16 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id m20so4837637ejj.10
 for <buildroot@buildroot.org>; Wed, 04 May 2022 12:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=z+YqpAOTah9pc8vPfbe4FTGEgsMWzdXy9y5ywTDzS4k=;
 b=Nmcj79C4XLDqUN0E1m+rOiSvWSuBOrQnS/R538sULL0hTSG0Dxff3PGO2qzyrYWmDQ
 lbSon7dT2QAz0nmheSoNIc8N2+DH4UIFTqUWFa0ShU4Oa6Uwm8shD2T4X5949V6jORBR
 mOoiUPcLSbJexPyODRXhZBjifIuJwASBZ6VcoZPIePweqb40LYzML2+vKycK9YusN7NE
 HJEA+ufy/L4Ht1fxb7RSRxyVUbmKvQna/4VUkN6/pO6LjSzoCwkywzLcJkJSfYtpKuMH
 IFb/y/uclyByHCabVtZ/7mb4wVE08YTGeJTl+zYJg4NX9/yFn1OJe9Mb75CPM6DXJzoz
 1OXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=z+YqpAOTah9pc8vPfbe4FTGEgsMWzdXy9y5ywTDzS4k=;
 b=rfYu4XQ2igCVPjBmM/NIlGM2lZ8FsveC7bPTBKr1EnicvQcYc2kdHU/DEaFWE1sdaf
 ABTxwslnrsdnderLeKmZTQP4F9x3b430Ha+K6x8XMw4v5UqJQlRK5ysEWu1s40S1jKyu
 uyFmDw23JnHEjXqAwGTQcZqH1XAAOlSlqY4VZMvWdqZl5LInkoZhMu2mPNUNZPhobL7j
 WfLYFJSjGKVqyv77v626jkr1wYypcM7plfnucXk1eKpi2yKdyMktAISQlzm67beyydJV
 8vSSpC3KfkIZgwCQChYxO1NzqzpwKorkozRsjsHOsFdoH/PC4zz366IIJ9K4NkInaCEV
 hZyQ==
X-Gm-Message-State: AOAM531Hxu5CPTFNJtRzzk3ZA3wzlMkMWUmPGqynEG6UeDHQxtdDNv0B
 xv4cw/uMeLclqKCYt7jUWjnV6M8oTsTiXg==
X-Google-Smtp-Source: ABdhPJyi+/ELAZYKE6vhhEjdNMmnf+8r367bStRbN5URWA9Fodwgubo0VFrMUl/N/X7jLdWM5mMx8A==
X-Received: by 2002:a17:907:9723:b0:6f4:77c7:8fef with SMTP id
 jg35-20020a170907972300b006f477c78fefmr11061024ejc.680.1651693635180; 
 Wed, 04 May 2022 12:47:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 e25-20020a170906845900b006f3ef214ddfsm5985107ejy.69.2022.05.04.12.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 12:47:14 -0700 (PDT)
Message-ID: <9164954a-2886-5a8c-39a0-85070093da6f@mind.be>
Date: Wed, 4 May 2022 21:47:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20220504080847.3209785-1-peter@korsgaard.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220504080847.3209785-1-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH] package/libopenssl: security bump to
 version 1.1.1o
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



On 04/05/2022 10:08, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> - The c_rehash script allows command injection (CVE-2022-1292)
> 
> The c_rehash script does not properly sanitise shell metacharacters to
> prevent command injection.  This script is distributed by some operating
> systems in a manner where it is automatically executed.  On such operating
> systems, an attacker could execute arbitrary commands with the privileges of
> the script.
> 
> Use of the c_rehash script is considered obsolete and should be replaced by
> the OpenSSL rehash command line tool.
> 
> https://www.openssl.org/news/secadv/20220503.txt
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libopenssl/libopenssl.hash | 4 ++--
>   package/libopenssl/libopenssl.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index 22bb365bcc..ec5fd0fe84 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://www.openssl.org/source/openssl-1.1.1n.tar.gz.sha256
> -sha256  40dceb51a4f6a5275bde0e6bf20ef4b91bfc32ed57c0552e2e8e15463372b17a  openssl-1.1.1n.tar.gz
> +# From https://www.openssl.org/source/openssl-1.1.1o.tar.gz.sha256
> +sha256  9384a2b0570dd80358841464677115df785edb941c71211f75076d72fe6b438f  openssl-1.1.1o.tar.gz
>   
>   # License files
>   sha256  c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c  LICENSE
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index ae6658ed40..0c039dc7d6 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBOPENSSL_VERSION = 1.1.1n
> +LIBOPENSSL_VERSION = 1.1.1o
>   LIBOPENSSL_SITE = https://www.openssl.org/source
>   LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>   LIBOPENSSL_LICENSE = OpenSSL or SSLeay
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
