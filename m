Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A23DC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 14:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4FAA408FB;
	Sat,  5 Mar 2022 14:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QfbGjEytuNI7; Sat,  5 Mar 2022 14:47:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D95ED408F7;
	Sat,  5 Mar 2022 14:47:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D80591BF616
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3EC440438
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SpNMPujoUUWQ for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 14:46:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B85EB4018D
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 14:46:59 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id yy13so14296248ejb.2
 for <buildroot@buildroot.org>; Sat, 05 Mar 2022 06:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=URCehMwehoFOy9CTKvauerENS2bXkuEZnMMNqiDB544=;
 b=cRV8xYjeNEYjEBEH6VHo1wtSVXaLOBya0VuHDAjL9+58EGROyFbyfj2ExiOLktHo0C
 l+nTI91GvML+V+eRyN1ozqJxcfW2/iDNdYYwadiY6GuHgN7mXTpmvYq26byxl4tzSLa9
 nKivhtdqjRU+fgI0pyzqcjmqmNsTlR7IiY43EnpU4UE11Ux5KQA7tr4J98anLr5hahGu
 js/rr5KYT33aowYD7blNSdg2rJ5deOiOkzw/wNkgMYMbncIQVzFnw+hzhHQcdLXeSZbK
 95/6qMxbzx/r8UsMqz4p2MIUU00bhn58yLZswoOJGT+iFhMe6aXG6WgS4OU6pthKHe+G
 o8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=URCehMwehoFOy9CTKvauerENS2bXkuEZnMMNqiDB544=;
 b=nTHg6RpzRvEYY/Gbh2shw4qmoeQzolBU5M3ZT5Fi0H17V7GoPKXXHUeBsxQJPzlNbL
 g2XXm5T/iXMHAdGLyUFteMUjPjDWJekmFYOOYCSOrGCrdOsaa1znJH+JYMN6AWBOoLg4
 yLRC7BJ9Vv2nKmZLBJlE3INJh/g9uUs5qSie0IcmvwCl/ijJc1MkTysihnemgHs/7NkM
 9I2LOLy9gyEDwrMyr50v1VJ42QRQ8Knm4lTbAeE3vWC6YD3pfhEDuT9o1aNPsWLY4duS
 4ljEXqVD35U3bznYrG7vDNa/3NqNlwqY2+fTgV63dZ/+r8nWbOv8pGlgMVGuNokQg2Kz
 pRuA==
X-Gm-Message-State: AOAM533PwjuU7tMf5kiVf592naAdbvDmk/A80vJbfUhQpEYJaQbEJbGG
 Xzxr8+1B3KemUWPwFRTyROPxeQ==
X-Google-Smtp-Source: ABdhPJw7+/IAvDKPaSoXbMuC17s60BQKc9iQSAK5DmcpI+Zb6YdYXD1IXBRLyV4ICrZMknWLpUzPbQ==
X-Received: by 2002:a17:906:974e:b0:6bb:4f90:a6ae with SMTP id
 o14-20020a170906974e00b006bb4f90a6aemr3082561ejy.452.1646491617962; 
 Sat, 05 Mar 2022 06:46:57 -0800 (PST)
Received: from ?IPV6:2a02:1811:b032:6b00:cb7e:b535:458f:f512?
 (ptr-cyunlkwzu35hsouvwnm.18120a2.ip6.access.telenet.be.
 [2a02:1811:b032:6b00:cb7e:b535:458f:f512])
 by smtp.gmail.com with ESMTPSA id
 gl2-20020a170906e0c200b006a767d52373sm2911549ejb.182.2022.03.05.06.46.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Mar 2022 06:46:57 -0800 (PST)
Message-ID: <a29a322d-70bc-800f-24a7-e6c3af6254cd@mind.be>
Date: Sat, 5 Mar 2022 15:46:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220213203219.1206327-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220213203219.1206327-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/zabbix: add ZABBIX_CPE_ID_VENDOR
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2022 21:32, Fabrice Fontaine wrote:
> cpe:2.3:a:zabbix:zabbix is a valid CPE identifier for this package:
> 
>    https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Azabbix%3Azabbix
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/zabbix/zabbix.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
> index e72d831b46..e6564e68fd 100644
> --- a/package/zabbix/zabbix.mk
> +++ b/package/zabbix/zabbix.mk
> @@ -9,6 +9,7 @@ ZABBIX_VERSION = $(ZABBIX_VERSION_MAJOR).9
>   ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/stable/$(ZABBIX_VERSION_MAJOR)
>   ZABBIX_LICENSE = GPL-2.0+
>   ZABBIX_LICENSE_FILES = README COPYING
> +ZABBIX_CPE_ID_VENDOR = zabbix
>   
>   ZABBIX_DEPENDENCIES = pcre
>   ZABBIX_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
