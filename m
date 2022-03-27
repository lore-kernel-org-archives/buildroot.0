Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E38C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C096A40616;
	Sun, 27 Mar 2022 16:31:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9fken8rbQHpJ; Sun, 27 Mar 2022 16:31:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83F0640423;
	Sun, 27 Mar 2022 16:31:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 337B11BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2287460681
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:31:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ysYc0wqhQ8v for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:31:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51DE060625
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:31:02 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id a17so14423718edm.9
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 09:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=ON7iTGBs8iRoWxJETParjyVkXou3fh19qQWihewmYuo=;
 b=YjVkKDPOX8Fg8I9JLHrwPuRdItx0pLLIU/cPYXndz2TsR5GAokkHO3ha+JqEc6Gavx
 +8JDIg9bQlPQTvuQUpyIBhl7dcU08XdbjjSI85jidIJAF3D4jGjSBVsx+bez0jCL9WmW
 qS/nHnmyeRErWEDCseEHT1e7/tuOKDpXVZBdI1ARMKgNPLcij9Nl0TEkJQJUp98vYBYF
 +r7bdLok2VZewChgKwytrql8N9m06he/Gdmxb8XnIfg4fHL1LlbdTG08rZF1qWqu7foj
 L0CKAG2NqKPxHaDsC/dh7TJ3qhjMbt0sok7661/92dD5q87amkyI98prXPAYPe5Jx54m
 sCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ON7iTGBs8iRoWxJETParjyVkXou3fh19qQWihewmYuo=;
 b=3avCOamfn802WBdUu46T0vBpP66w+eirvH4gQFY1cuAgxVJc6Co3QlxIDWlaFktWqd
 i0oabkIrPghcQ7Gb0VRJFDLV4ZojghCh3Y28XzCQEke9nrIg17XEaSMubC+tbLaZEtEt
 tDcgr31zS5W5XBqZBQRjAsKV8493oJU8tEeDtMUihFxQRPWVeX5FbJQmiyR0DRom7Rup
 HECD5JQeG+U5MI6I2ot55ElxBxbNLuM91qRWGNurOx8yaKGMf+eVzN9IMSnrrEZ690AO
 wzVYANn0zH+lxseruffWol6RFarFJXubuuDsM4wicIaD8uVFuCK/1h0RNx1zEJRemHpK
 41Zw==
X-Gm-Message-State: AOAM532t5yM/kVXeWQIy4pVsl1gjGuxRAHZi1hlT5k1ax1rtKX6ebG53
 dXtqEGfoH4JSxfbuC+esCsi8hg==
X-Google-Smtp-Source: ABdhPJwXBbuZ9s39se4Nf0AagnzHhkSr1mmlpvOHy7yftz45RxJf8xRobugUwndqgCojjAurmT5NPg==
X-Received: by 2002:a05:6402:254e:b0:418:d759:dc48 with SMTP id
 l14-20020a056402254e00b00418d759dc48mr11216482edb.104.1648398660642; 
 Sun, 27 Mar 2022 09:31:00 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 qk30-20020a1709077f9e00b006dfae33d969sm4787324ejc.216.2022.03.27.09.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 09:31:00 -0700 (PDT)
Message-ID: <8d7d7ad2-26a7-bcf4-8124-5859243560ea@mind.be>
Date: Sun, 27 Mar 2022 18:30:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220326204915.1019331-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220326204915.1019331-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 8.2.4632
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



On 26/03/2022 21:49, Fabrice Fontaine wrote:
> Fix CVE-2022-0943: Heap-based Buffer Overflow occurs in vim in GitHub
> repository vim/vim prior to 8.2.4563.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/vim/vim.hash | 2 +-
>   package/vim/vim.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/vim/vim.hash b/package/vim/vim.hash
> index 8b60b7461f..d2c91dcfa5 100644
> --- a/package/vim/vim.hash
> +++ b/package/vim/vim.hash
> @@ -1,4 +1,4 @@
>   # Locally computed
> -sha256  b0a5acbe83bbdd4b1412abd9dc2ae2e3593c6cff8ff11c551fda3e6e2a87ec81  vim-8.2.4450.tar.gz
> +sha256  acca7330e41d01b53d4455ff98fafbf13282ba6461cd92eb1188836f6b03ec0f  vim-8.2.4632.tar.gz
>   sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
>   sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
> diff --git a/package/vim/vim.mk b/package/vim/vim.mk
> index 28fd33c8ef..71aa735eff 100644
> --- a/package/vim/vim.mk
> +++ b/package/vim/vim.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -VIM_VERSION = 8.2.4450
> +VIM_VERSION = 8.2.4632
>   VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
>   VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
>   VIM_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
