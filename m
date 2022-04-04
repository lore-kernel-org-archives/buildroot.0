Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926B9C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 20:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 199BA409DA;
	Mon,  4 Apr 2022 20:16:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vYut0hqXBlDY; Mon,  4 Apr 2022 20:16:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7637D409DE;
	Mon,  4 Apr 2022 20:16:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F6731BF232
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ACB9409DA
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:16:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Up8Xhzd2FxJr for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 20:16:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3ACBC409BE
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 20:16:02 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id k23so18896259ejd.3
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 13:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Sdr9JSXwuVMtZTCi5Pm1vbOV2hkQcxbSbjgXUeVjrRw=;
 b=BQoLd3jnk3o0vdU+MPkqqyLdz9NlSdVbtNQvUjQ+a7z2DE6TefWlvqXDNqq6yL8z6E
 qU3Efu8pdtyxkJ/iX1gHI4EHZOq9VXCpREIg3BfF/XXgKCSEWkV6Ul/aKR7AOfxLj+Am
 +MoGavIKrOROBM5yasU438K/MB7zyD6ZW69GuZ0tT23mXTS/2K7dE/0a+jm3fWr6M8AH
 IHUVTSiR8z6sDYRn4WTlrhZoL6IhESvsYGfC7o8SPWP1OBgsWYbWLmE1yt9KPB7znkjE
 7yEp/b5EQ9NfbMQZOhdy7LhpynT4HdxyGGZ2oD0sn6a5rFOSHT4liFDyuXWMmIeHyzZ6
 joCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Sdr9JSXwuVMtZTCi5Pm1vbOV2hkQcxbSbjgXUeVjrRw=;
 b=Eh1KIOMNskgm+dXJJw7mflrXdIUYgWXfMqkmk5cjzrb3FW9KKb2liMuTG0lwzLp5Un
 Us1xQelCPZe7RKlCp7kuKrSGKMD8Jl/VFZ7kHvbHofgh8tizoL+FP/Ro68uHkdX/wnj0
 ynzr+52NkvfKX+VQhqUgmAmCCIh3vxLZpIOMSPL4ie+qQAi9+uGBxU8z6V4xa8Nq5nSF
 qbbeWeQD0AuJoIUanOfLi5lXaezi9XP3B6iJVJK+jjEeQJDql6DkACdxTNq3TqAGIrKj
 rddWZSTOa64KcIMfwhZ0QJ8qN9CbZpN01ikPJdwbjCeB/TGGkqCd6ZCINE5+q6d46gDS
 Bm1Q==
X-Gm-Message-State: AOAM5315s6HSt+7zE32B8M7SwU1aYFyPA4POpWFuLdXFeJiwrE2lEPCs
 zgwY4SgfP0Bk4SQjBTGkyL37kg==
X-Google-Smtp-Source: ABdhPJxoCe4/k2a3fdYsjK7VpeWwn7wkYwnSZPS+yBYdcsZ9b/j2ZWvohtr2DIiRHqrwmsg5yQKKow==
X-Received: by 2002:a17:907:7205:b0:6e7:ee50:ea94 with SMTP id
 dr5-20020a170907720500b006e7ee50ea94mr1825882ejc.351.1649103360414; 
 Mon, 04 Apr 2022 13:16:00 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a170906390200b006e7f5fedbe7sm1249753eje.3.2022.04.04.13.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 13:16:00 -0700 (PDT)
Message-ID: <16ed1f4b-54e8-9048-13a9-f265c599dfcb@mind.be>
Date: Mon, 4 Apr 2022 22:15:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: scritchlow@bioshall.co.uk, buildroot@buildroot.org
References: <20220404062743.9199-1-scritchlow@bioshall.co.uk>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220404062743.9199-1-scritchlow@bioshall.co.uk>
Subject: Re: [Buildroot] [PATCH 1/1] configs/licheepi_zero: bump uboot
 custom version to 2022.01
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
Cc: Michel Stempin <michel.stempin@wanadoo.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/04/2022 08:27, scritchlow@bioshall.co.uk wrote:
> From: Steve Critchlow <scritchlow@bioshall.co.uk>
> 
> This also removes the dependency to have Python2 installed.
> 
> Signed-off-by: Steve Critchlow <scritchlow@bioshall.co.uk>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   configs/licheepi_zero_defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/licheepi_zero_defconfig b/configs/licheepi_zero_defconfig
> index 2e1a413988..d7a281a0a0 100644
> --- a/configs/licheepi_zero_defconfig
> +++ b/configs/licheepi_zero_defconfig
> @@ -36,7 +36,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="LicheePi_Zero"
>   BR2_TARGET_UBOOT_NEEDS_DTC=y
>   BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
