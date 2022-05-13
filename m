Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C08C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 20:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A829441911;
	Fri, 13 May 2022 20:56:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bpGZ0Opr5SZr; Fri, 13 May 2022 20:56:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EE83418B2;
	Fri, 13 May 2022 20:56:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF1131BF3CD
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 20:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC38E8291C
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 20:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9MeX2Ul1MJF3 for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 20:56:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC1A3828B3
 for <buildroot@buildroot.org>; Fri, 13 May 2022 20:56:16 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id bv19so18418731ejb.6
 for <buildroot@buildroot.org>; Fri, 13 May 2022 13:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=5sSBTDurFhDT15u3sgRKkvYJI1+qgjrEfugJZIEN6uo=;
 b=VMS+91Ju6lJ5SwQFmhf9zlrx/ucC9qMXwN1xdRVm5tN80ubBXy2D4jNCocSU9Hb5XT
 Y8lcZm0LCjJHMnSONEBfIyo7FqRq3+pppq79MEzyhD79aodbI+tUowS/sGY7nf/qDRc7
 s7d5WLf7oKY8RlNNY3sR+o0qxnvvHK49QNv3ByPjNqs4IEq0hkAzJHIrWbbvW+7OAyH9
 hHG4kvOnw4FFslF1E0fWauVNjxypZbs1r4EPlOkalCO1pb+kj0xPJ6fzo+nrsEy1rJ2i
 c2AK6aj1L3UFRtMuAHOtqekAFLElQ6yVgUMOoqi0VNsOrpLF5UREEyMm5CZN5RtYkcSs
 oasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5sSBTDurFhDT15u3sgRKkvYJI1+qgjrEfugJZIEN6uo=;
 b=a/rWOxb4vLwvRL5UGjpKb9IyozjxsihZhB7kJvd34lPeDRcp4W5obydITcOTtoFFJw
 BIMhej6aFOclCJebsxuc+enkKOHEk5u2obpFrYDFW8xupIwd8AgcbNbMSoxz2dmrK/m5
 CuPU3jAPBxP6hO5/pffESZ0j1VgEMkIRfQ1qpdKLaWKva4+z1tcxnM7JAiXvw38Cq90a
 8MWJIiiYrEUWKOLLxKdiXpxLMdRyAHnyF74RKrP3TTL+6eOD98C9oeof0eFu17cZfwo3
 vXJE2pGFcd8uBpE1E3Fo1mBf9jIGjMi44QiihM3Nt0TmVn9gADB8OfIST7zOnCfb21Fd
 LJCw==
X-Gm-Message-State: AOAM533bY+1+Hmy9sLJ2Why88vpLhGJIb/NXwwHvIXT3d49CSoBtZiRX
 HupIaCMXpng323itYnNhOik4MPHDZN7XJQ==
X-Google-Smtp-Source: ABdhPJz5ASQYYzeZCVSib5puBYkBRH68pv0AUUTxpbk2+MCfNBI0mY6lBwev9xCEErsFUCi6dT5uYw==
X-Received: by 2002:a17:907:7b85:b0:6fd:d799:ef4e with SMTP id
 ne5-20020a1709077b8500b006fdd799ef4emr5917150ejc.319.1652475374823; 
 Fri, 13 May 2022 13:56:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 zd7-20020a17090698c700b006f3ef214dfbsm1127396ejb.97.2022.05.13.13.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 13:56:14 -0700 (PDT)
Message-ID: <65f9c9ef-9074-4d87-1702-c8a6f6c8fc38@mind.be>
Date: Fri, 13 May 2022 22:56:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
References: <20220507202905.397732-1-geomatsi@gmail.com>
 <20220507202905.397732-4-geomatsi@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220507202905.397732-4-geomatsi@gmail.com>
Subject: Re: [Buildroot] [PATCH 3/3] package/xr819-xradio: enable for ARM
 only
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



On 07/05/2022 22:29, Sergey Matyukevich wrote:
> The xradio driver is broken for kernel configurations with disabled
> power management core functionality (CONFIG_PM). The xradio package
> makefile attempts to enable all the required kernel configuration
> options, including CONFIG_PM. However certain architectures have
> no support for CONFIG_PM. Those are or1k, nios2, csky, and more.
> 
> One possible fix would be to exclude those architectures in the
> package Config.in. On the other hand, the xradio driver is rarely
> used: orangepi_zero is the only such board in Buildroot. So it
> makes sense to keep it simple and enable xradio only for ARM.
> Any new xradio users will be considered on a case by case basis.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/2ad11cd7a9ca6b694854730e46260a944e8c4bac/
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

  I've applied this one as well, so forget my remark in the previous patch about 
s390 :-)

> ---
>   package/xr819-xradio/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/xr819-xradio/Config.in b/package/xr819-xradio/Config.in
> index 9d7fa4b0f1..351ea95c79 100644
> --- a/package/xr819-xradio/Config.in
> +++ b/package/xr819-xradio/Config.in
> @@ -1,6 +1,7 @@
>   config BR2_PACKAGE_XR819_XRADIO
>   	bool "xr819-xradio"
>   	depends on BR2_LINUX_KERNEL
> +	depends on BR2_arm

  aarch64 is likely as well, and why not add the BE variants too... So I added 
those and applied to master, thanks.

  Regards,
  Arnout

>   	help
>   	  Wireless driver for SDIO WiFi chip XR819
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
