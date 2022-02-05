Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9DBC433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 14:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 845BA40018;
	Sat,  5 Feb 2022 14:10:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lKD3K9dlaJ0z; Sat,  5 Feb 2022 14:10:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6712B40354;
	Sat,  5 Feb 2022 14:10:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C1411BF45A
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 14:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5ABBE408C5
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 14:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 61ymUhtixH6u for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 14:10:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7964F4089B
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 14:10:44 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id m4so28304239ejb.9
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 06:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=hYkXTGTB4PKp3pZRYxLBfTAlhWO+6RXRainUXxsvTqM=;
 b=VeE2453zhBujLC9kFvk1XhqT/al4SaRoFgEunw1r0849O346IiC75S+9TpjJkdbcDf
 biCxz8Ur9jW7jvlMuoCo11AQMEBO7NcmXKZTWQA1I7onYOsDfnHbPLYnqghHM9MP4Zs/
 u14C5iwP+T7Uyb8jojJrrnYkcss0kZQKiCBU9jykHy1mDQ5FH1RdY8PDdVurNUl8UOgT
 EsJZdX3lvf6Hks0A2IqHPv8+Uq528HZsaySTLV8fzUcVdtjlOVYmDpL6lnwAoU75mRjC
 pqd0JBFHUYmxA/AK3ywCq5RfMnsmAUANR2IQ8BbFinZg9lLxeO0ME8DV0FNJkZsMPZs9
 eP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hYkXTGTB4PKp3pZRYxLBfTAlhWO+6RXRainUXxsvTqM=;
 b=DluFP9igQHbJ3RAyns3/erx/T441r9l5PpQn66SwI1NcUoX45oJBkBJw+1OyIvDKVq
 TemVedmrfoCyES8D2fPAeJ0YbATeCQ8lLZkT52hVigo70mLqoHGMLWeaf46ZG/bqVAGl
 +HHYX8EkGtDBehdXDnmzpVH6cfrPA9WDl+35MHEQLbsdgxPLz5msl5P6nYOUnl3yYi8s
 LTq9Crjg8AITllYCtTZ+CvoEJOksEnqqsnP3DM+46QJpqKe1qjAb14wWCNw1R4OVER6A
 JtwUEWOyKljnRNxMNBlJmchi+FRo/cVxruJ28z7K1UIvZa3afJeXY50Fc+wimVYFKdSW
 PcjQ==
X-Gm-Message-State: AOAM531xujnygly2pydvsJE0ra+GE8r7mmWcpArM/O8h9w2bmnNpOL7/
 FBzjWNR9akROBkotHLPdpzeb1Q==
X-Google-Smtp-Source: ABdhPJw9BrDufp3cDcPYFtfKjjfLXRLsmXJu8a63hJ59jD8Xn7epFoPoIMuyoIUsq2Y6eM4m0lJr9w==
X-Received: by 2002:a17:907:1b0b:: with SMTP id
 mp11mr3230435ejc.499.1644070242574; 
 Sat, 05 Feb 2022 06:10:42 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g7sm2251481edr.71.2022.02.05.06.10.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 06:10:41 -0800 (PST)
Message-ID: <98670320-83fa-c6e9-9bc4-aa30d9deb6ff@mind.be>
Date: Sat, 5 Feb 2022 15:10:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220204005610.897894-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220204005610.897894-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] board/pc: fix build failure due to new
 genimage 15
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

  Hi Giulio,

On 04/02/2022 01:56, Giulio Benetti wrote:
> Actually genimage fails to create final image with:
> ```
> ERROR: hdimage(disk.img): partition [MBR] (offset 0x1b8, size 0x48) overlaps previous partition boot (offset 0x0, size 0x200)
> ERROR: hdimage(disk.img): bootloaders, etc. that overlap with the partition table must declare the overlapping area as a hole.
> ```
> 
> This is because genimage 15 is less permissive than before, so let's add
> holes = {"(440; 512)"} to leave room to MBR.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935249
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   board/pc/genimage-bios.cfg | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/board/pc/genimage-bios.cfg b/board/pc/genimage-bios.cfg
> index 26d12d9ab3..54026f6527 100644
> --- a/board/pc/genimage-bios.cfg
> +++ b/board/pc/genimage-bios.cfg
> @@ -7,6 +7,7 @@ image disk.img {
>   		image = "boot.img"
>   		offset = 0
>   		size = 512
> +		holes = {"(440; 512)"}

  Have you tested this change on an actual board (i.e. a PC :-)?

  Regards,
  Arnout

>   	}
>   
>   	partition grub {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
