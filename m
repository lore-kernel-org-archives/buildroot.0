Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5FEC433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8680B408B2;
	Sat, 23 Apr 2022 16:32:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sXOBfLE_YpzG; Sat, 23 Apr 2022 16:32:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 749A14048A;
	Sat, 23 Apr 2022 16:32:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A16E1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61886417CA
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:32:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xSZ_Go21T0bZ for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:32:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56D9F414D1
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:32:31 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id w16so586904ejb.13
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 09:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=rQ1kC5UY6ngiEG+LcmS9/mgL9xf9oqiyYj31srHixJw=;
 b=V+kD0tn10oTFuX5AdnlpZqro7H0ehz82GF8siK8BWPvbHlFTBJXf5cUQnSONsdh0P2
 8JyFYJ0FtKfzDqGdIw0pCnAqOb3bRYxPoBzuDHuQBx2IwlvRpzYwxfDwxEDp9CCn9RkN
 KE3bJDTcH3kzYiWB/QnmjyXx1zzTiOO/zYeRGvrs45yV9+3JH+3sX9MNx2DHQGdVWNmW
 jxW0h5WgyJZ1NSbx0ihFYU/uJbjhJsyDYsQZb5rEQPijr+cteu7gulxL1LlDjVA8nY0f
 ohQE1UHokQSjQqLpx86JZ8zaNT86Xz8gN/g39EyNH9Bw4peAk/15MXHBl0nU9u2Nvh9d
 Hu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rQ1kC5UY6ngiEG+LcmS9/mgL9xf9oqiyYj31srHixJw=;
 b=jvtiHfzrKDlaHt0HNLDk/PikIpBvYu9Tm2TpDQ7IKcAAjfst8TkWSnj7phVlT/g/WB
 HQrI4IjxHn23WdXVfNhElkQ5hewtOuETrWnjTfuuIgktlEZvWIQPG0T7Xl0TH+gFk1o8
 fjS4uj9GRGJB3/5e0xC0Q/7SGZhLFtpsorQFT7k+a6XIVmj1jjHCjdmLbLdg/SAeHWrH
 lX6IMchTMnEpxR5fXdPDx5rNj1sk98TcGnhHs1XQekd37zyfLRSbPjnvMJuDxmOCxGFo
 S/gSctixRlOF6OrMf3w6jPOWsxoqvrQJamHeIGpWCdh7O2UXaS9ptzu4XmKIM5u8jw95
 +IYA==
X-Gm-Message-State: AOAM5326Nfq7Dx69WvyfNY54hqrNviohtbrdSHu28ghvmap71jjiWBW+
 YHIPVfnvtqxoJa5i/sOl7WOfcsqy2wr21g==
X-Google-Smtp-Source: ABdhPJyVZc5gvlKEPmKHD3sr6Efv1o958Rfn3Vn5zGbnI+HNqunfvOvndYIQ6kjm3c+0nTZeTpWRww==
X-Received: by 2002:a17:906:6a24:b0:6f3:78cf:1575 with SMTP id
 qw36-20020a1709066a2400b006f378cf1575mr2144904ejc.760.1650731549528; 
 Sat, 23 Apr 2022 09:32:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 x7-20020aa7cd87000000b004207282701fsm2325928edv.63.2022.04.23.09.32.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 09:32:29 -0700 (PDT)
Message-ID: <a44c2481-bd4d-1b0a-ad8a-93820b47a19b@mind.be>
Date: Sat, 23 Apr 2022 18:32:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220421215444.3798671-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220421215444.3798671-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/zlog: add ZLOG_CPE_ID_VENDOR
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



On 21/04/2022 23:54, Fabrice Fontaine wrote:
> cpe:2.3:a:zlog_project:zlog is a valid CPE identifier for this package:
> 
>    https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Azlog_project%3Azlog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/zlog/zlog.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
> index e2410d3665..c7b7035c1f 100644
> --- a/package/zlog/zlog.mk
> +++ b/package/zlog/zlog.mk
> @@ -8,6 +8,7 @@ ZLOG_VERSION = 1.2.15
>   ZLOG_SITE = $(call github,HardySimpson,zlog,$(ZLOG_VERSION))
>   ZLOG_LICENSE = LGPL-2.1
>   ZLOG_LICENSE_FILES = COPYING
> +ZLOG_CPE_ID_VENDOR = zlog_project
>   ZLOG_INSTALL_STAGING = YES
>   
>   define ZLOG_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
