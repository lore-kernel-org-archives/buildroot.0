Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF6BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E27E7419C9;
	Sat, 23 Apr 2022 15:09:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zp2qc_KXXlfG; Sat, 23 Apr 2022 15:09:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4D9B41763;
	Sat, 23 Apr 2022 15:09:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 777E61BF421
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6698C81842
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:09:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e1UNS9qY-3MS for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:09:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4EA2481753
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:09:32 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id y10so21550351ejw.8
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 08:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=zsbDC5vzZCOHs05BDHblW5I1zT4S/tTaK7Rw5sGt4R0=;
 b=CeodCosb6NCvaTRZzyt1MGGzelraKiSslNtOxQ8rlPayuVHcgWSE+d5lluS15bRGqS
 P/HyshT1/f5+LrfYmQXQPWr70OpXx+aWtzAz1g6Walc3ppqKbB04d6NGl1y/HKze1dJs
 /P5eo+XpxFuMF0HwE0KibwZouQHI2JLZaFsd7M59JkpCAK8ls27Ob4xnLPvrKLRHUf+v
 gPA2ZTyqUj9AAq/qfQG3HPIPDwfiYpXRphHvins3b1eKFUcj925wKDJ8Asy7ZOpCDW5Y
 fXH5kmD9s+uKBrWNh4n/Md/4AF0YAn/WD7SjthcH0hwvuUetgwIpAdsazq7K5aHOi8rq
 42LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zsbDC5vzZCOHs05BDHblW5I1zT4S/tTaK7Rw5sGt4R0=;
 b=fkde99POl/e64dQHM1fmZiPO8lMj5zr7RCR9FBOtlcJ/ONG+Q/9RsXp57A7NsklAom
 9VdTGZvc6Oav7oUZJZqV5gml/spSE4qewA3N9yRH7wytmua6E7aw6yTr9pF6LoB8umaY
 e8ZyINh3DOQqkSaIxc0aAdPCv6kP6Jehrknr2gPWhCv0GEUsS1uwSqQdsGDuTsIgxlBk
 /VFT7URxZXOf1MsM6yLJTjPdX3Hew9pVpoZTjMJ+HqKTmQIo7ORZ8zBvErTWhrNw2XXp
 OdQ5kGhCP0wUG81USCSJRZRzFhKFgGcwc1dbc709dbrbZlj2ueu/33spD6qaEe+zNXxj
 Wn3Q==
X-Gm-Message-State: AOAM531i7B++JF86vzJTPT+lD66sRNCByOktprZ/Lc7O6R9vfz7wdMND
 W5w6dHFqE9E8qfnVNyEJgLzetA==
X-Google-Smtp-Source: ABdhPJy+ddipVGlgRHBzwj/Nl0fhjUb1ESFAkg6S6LFx2TccnLLNe1/+6eSd2dMiHsDrrzWoxnwiYQ==
X-Received: by 2002:a17:907:214d:b0:6e8:bf62:baed with SMTP id
 rk13-20020a170907214d00b006e8bf62baedmr8742333ejb.33.1650726570472; 
 Sat, 23 Apr 2022 08:09:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a17090666c700b006e8688d5fcbsm1753668ejp.135.2022.04.23.08.09.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 08:09:30 -0700 (PDT)
Message-ID: <cf2e3f9e-fdca-b28c-b859-8954b7168cd5@mind.be>
Date: Sat, 23 Apr 2022 17:09:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220419185821.4087483-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220419185821.4087483-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/batman-adv: needs CONFIG_CRC16
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



On 19/04/2022 20:58, Fabrice Fontaine wrote:
> CONFIG_CRC16 is needed to avoid the following build failure:
> 
> ERROR: modpost: "crc16" [/nvmedata/autobuild/instance-6/output-1/build/batman-adv-2021.4/net/batman-adv/batman-adv.ko] undefined!
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/64bf0f89ef444dda4d1277c0e46d189ad2515713
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/batman-adv/batman-adv.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
> index 838f9b1851..6a1aaa699c 100644
> --- a/package/batman-adv/batman-adv.mk
> +++ b/package/batman-adv/batman-adv.mk
> @@ -35,6 +35,7 @@ define BATMAN_ADV_CONFIGURE_CMDS
>   endef
>   
>   define BATMAN_ADV_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CRC16)
>   	$(call KCONFIG_ENABLE_OPT,CONFIG_LIBCRC32C)
>   endef
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
