Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C90C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 21:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0514A847AE;
	Thu, 17 Mar 2022 21:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gU2lTZY3tIDu; Thu, 17 Mar 2022 21:36:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 321BE84756;
	Thu, 17 Mar 2022 21:36:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 773E21BF315
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7459C418C2
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:36:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WuokFAuUeoQa for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 21:36:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78BB1418BF
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 21:36:24 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id dr20so13101657ejc.6
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 14:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jD1JuymJkYgvIy2sREahSUlR0ss/W1qH+yZ0tEdLmBs=;
 b=dzNmJfAxT9XjS2SWNLw/zbtdQ9SVNPyx983AkrslQgTPdWFeZtEIxzO0z8q1DWtwOt
 VFQ4+iPv1Fg3dL8Ryd4jyvPTw7S8gmlgY4TcTrno5myw1w92wqJa8HDcJtkie6NWZbgF
 P2Jqt5w6xOaPWoL/4MewUKrO0iHgVWGiSSAKMDMO0oCZNc5jQDsHo9bzC60nKG1HVLwV
 CY3BIJAoxC6R5XOyxylVH/IthTBrONXilL02nMLGLvi6r1ipSiAbnIEo3e+dx0JMojid
 z3EstZLwX1LhMCnxchGTvnglnRajyvqEwqAeQ856gljsBLrwJFKzyWZL2DzRu21u+nqm
 NKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jD1JuymJkYgvIy2sREahSUlR0ss/W1qH+yZ0tEdLmBs=;
 b=HRrPqew1pKd0iwCC8iAuReJfJN5SnG1ZrfgRfg9UxC5trAP+fQ3qmWKVWmcmsq32cz
 cHENzNiYKO7lBB+WOCDupiGsHaF2qDd0r4QdEIA91a59Xi3eX5yhUBba3ptMLYlNzyqY
 eV0JYR7QQivOhi3KwEeUJjKGkWucIXdokrUZJtYCYNV2Jp2+vHHSJo4+UymMx6Da0sC2
 XwjKa0sPangzFmfJzVahd7PaXqq92hvR41hudyBu3aRBR1GJWB67TFebkriLp5XdRmaV
 vXrEtuEJBAH/DJTriVF+Z4cU6ttTwRZs/PXhm5S8Lb+6qYG/bVG7eTGWMUQ1mjgDjXie
 eQHw==
X-Gm-Message-State: AOAM531eGVFMAjSvhw5qXp95cduts/qiGywNJSmt9l+ukmuys6Biupnv
 dyhi2YQy4J28icr9OZnDZ2jTNm2ZaFEj4Q==
X-Google-Smtp-Source: ABdhPJzYTiZW6xGc6OXARMUFVOVCmI58jx7gediK7QyrAjr102JtdmXSAkoYtkYp3NAJz7XW9oaVMQ==
X-Received: by 2002:a17:907:3e03:b0:6da:8c5a:6d4a with SMTP id
 hp3-20020a1709073e0300b006da8c5a6d4amr6468771ejc.585.1647552982152; 
 Thu, 17 Mar 2022 14:36:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 by4-20020a0564021b0400b00418fc410299sm1366818edb.62.2022.03.17.14.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 14:36:21 -0700 (PDT)
Message-ID: <d616bbf5-444f-d248-fb88-057437ad8721@mind.be>
Date: Thu, 17 Mar 2022 22:36:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
References: <20220311041821.3078930-1-christian@paral.in>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220311041821.3078930-1-christian@paral.in>
Subject: Re: [Buildroot] [PATCH 1/1] package/moby-buildkit: bump to version
 0.10.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/03/2022 05:18, Christian Stewart via buildroot wrote:
> https://github.com/moby/buildkit/releases/tag/v0.10.0
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>   package/moby-buildkit/moby-buildkit.hash | 4 ++--
>   package/moby-buildkit/moby-buildkit.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/moby-buildkit/moby-buildkit.hash b/package/moby-buildkit/moby-buildkit.hash
> index 3015e479f6..e22e97cb3a 100644
> --- a/package/moby-buildkit/moby-buildkit.hash
> +++ b/package/moby-buildkit/moby-buildkit.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  0cc31aa4b6dcdead63b07d75e0b89495ecffcc183f4f62695d8bb507433fc8ff  moby-buildkit-0.8.1.tar.gz
> -sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
> +sha256  5877faf02cbddfb6c988f44b5b373739fed87f4aeb8802c6777fe7be2f772506  moby-buildkit-0.10.0.tar.gz
> +sha256	7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE

  If the license hash changes, you *have* to explain why in the commit message 
(in particular, you have to explain why the license hasn't changed).

  Also, as reported by check-package: two spaces.

  However, the license file is actually still the same, this hash shouldn't have 
changed. So applied to master after restoring the original license hash, thanks.

  Regards,
  Arnout

> diff --git a/package/moby-buildkit/moby-buildkit.mk b/package/moby-buildkit/moby-buildkit.mk
> index 3f0df351ef..d34ff96252 100644
> --- a/package/moby-buildkit/moby-buildkit.mk
> +++ b/package/moby-buildkit/moby-buildkit.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MOBY_BUILDKIT_VERSION = 0.8.1
> +MOBY_BUILDKIT_VERSION = 0.10.0
>   MOBY_BUILDKIT_SITE = $(call github,moby,buildkit,v$(MOBY_BUILDKIT_VERSION))
>   MOBY_BUILDKIT_LICENSE = Apache-2.0
>   MOBY_BUILDKIT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
