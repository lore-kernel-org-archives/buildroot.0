Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E9CC433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFB708144E;
	Mon,  2 May 2022 21:53:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i_6TOii9iGWq; Mon,  2 May 2022 21:53:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08544813D3;
	Mon,  2 May 2022 21:53:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C34D1BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05F6B403BF
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:53:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6GExw7qS3dvP for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:53:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 211DD4063F
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:53:10 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id dk23so30152886ejb.8
 for <buildroot@buildroot.org>; Mon, 02 May 2022 14:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=jbXvFC3a5tlQG9EQjsR+KeuOEIUO+HQ839MtFVOU+ZI=;
 b=TH5AXsAi2Dqz10a38omA5XZiq/VNXST9UQn1mFb8YANLpZxKQccG/qOlpzuzxuY4mp
 gBijQkpoQE7MKffCEzIhxJHHxy/sxqfYmCNLabYusoII5d0SSDTDSpreIJgq4gVUs8sg
 lUOOVjrpcBHgrjR/B/r3KeEzaRYlaeLJW8z9wXlvcUI22bYAp6vPFSPZ9gMexjGXeuPE
 RYKQP+Lzxun0EELnqQmH7tsjKk0F5YtULxcFaoURSA/jcQufqjjuQS/9xu0ALt3PU6s0
 e4lW/5DLPmSoMj/HtvcNk9uyVE3+1m7x+xgprpkKouZ3WIOjnCcBIkrqAwfwit91qp0X
 eB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jbXvFC3a5tlQG9EQjsR+KeuOEIUO+HQ839MtFVOU+ZI=;
 b=UVHq9L1RS7DbKvzeMjKcMMiM4SRRZQSl7RcGJydTWm0L9djwfLrAXV4wKKGcoau9dT
 qinGGLlVD+em8FH5zwytL4Ip59MBPEbvd74NdxWHA4eOTFve+arGu1PgsTOainkBOwBz
 KEIiFWe2MmdJyg1r+LLCUYdGZS2dsACFdVy2BxPYQuX6BPI+WsEGNGo6hO0C5bH4P9Uq
 vMWJRX3OtHppR8w60UnHowuc4aKMYJOS/lKfJYky7M7wwCQV3Q0xB9vOTCLka0gQ/5PP
 azKwO28nNV4U30dDGc9x8NgydPoGZDwdGXSJE7ISDtl3xNc82Bgv04UZaHIsX56GAgc6
 TkEw==
X-Gm-Message-State: AOAM5337tLYPUS0MuVdJ70tHydbEI6adK94DuJw/8uS7gbQg6RN8tu25
 d05wE144W4Jpavi+BTh0ZpMXEA==
X-Google-Smtp-Source: ABdhPJyvWzN6+XjNxPRthsmHCIgAhflALyOAXAZfVpVvy8yaX1UCjtC0jrNzmRL07A27UypEUwB8gg==
X-Received: by 2002:a17:907:94c9:b0:6e8:ab67:829e with SMTP id
 dn9-20020a17090794c900b006e8ab67829emr12455832ejc.313.1651528388291; 
 Mon, 02 May 2022 14:53:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a056402078b00b0042617ba63c0sm7117908edy.74.2022.05.02.14.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:53:07 -0700 (PDT)
Message-ID: <c2d6ef95-5bb3-d23d-dc5e-3fd0ce6531b0@mind.be>
Date: Mon, 2 May 2022 23:53:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220501073844.317391-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220501073844.317391-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: fix ext2 config
 variable
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



On 01/05/2022 09:38, James Hilliard wrote:
> This should have been BR2_TARGET_ROOTFS_EXT2 as the
> BR2_TARGET_ROOTFS_EXT2_GEN variable is an integer variable used
> to indicate the ext2/ext3/ext4 variant.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/5d7/5d7833212bd8a2b575945f848d8c91dabe7d3c30
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   utils/genrandconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index ab1f6f43b1..70af84f002 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -443,7 +443,7 @@ def fixup_config(sysinfo, configfile):
>           configlines.remove('BR2_TARGET_OPTEE_OS=y\n')
>           configlines.remove('BR2_TARGET_OPTEE_OS_PLATFORM=""\n')
>   
> -    if 'BR2_TARGET_ROOTFS_EXT2_GEN=y\n' in configlines and \
> +    if 'BR2_TARGET_ROOTFS_EXT2=y\n' in configlines and \
>          'BR2_TARGET_ROOTFS_EXT2_SIZE="60M"\n' in configlines:
>           configlines.remove('BR2_TARGET_ROOTFS_EXT2_SIZE="60M"\n')
>           configlines.append('BR2_TARGET_ROOTFS_EXT2_SIZE="%s"\n' % ROOTFS_SIZE)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
