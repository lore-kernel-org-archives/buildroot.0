Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E46C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BDC54092A;
	Tue,  4 Jan 2022 17:59:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 85czU7gxUPVp; Tue,  4 Jan 2022 17:59:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CD9640924;
	Tue,  4 Jan 2022 17:59:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D1401BF2EF
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A4BD40924
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:59:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZkztRUaYETPG for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:59:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F4D940920
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:59:24 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id w16so151695070edc.11
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xJHyAWThYlfxLL1jpNDUN+V6YcYIVZ4sZgKTpKgBEpA=;
 b=RXiLkZlH+Ysk8AVIOxdaDiBMeyG6msISOt9CEkI+ftpelP8TpWL7eedetnM5fJDVLm
 loKIBb9WpyBE3lVEOH7PJaMLuwEhFQNRobJ9xPpW7pOGgb/LZtBjkULfLxDbKWPm2m3H
 N/JvOYoaWaYXH5UBigYpBEU7LJKDvriRPGwq+IaQlq4FdOtalwpEhMoJkgA+kNbAaeSh
 VRdiY5ykuHuyYCdb3564G0fq+4gF3tsQrGOgc8JAc3/AmmW4TD12efDMnSyohaaqAPAA
 GCD5f05ayZf7FAHBO8GEU6jqjuo4Sz85M/aBOrPHTRqgNNeopBt4pxuWJFt27/BqbrMX
 w6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xJHyAWThYlfxLL1jpNDUN+V6YcYIVZ4sZgKTpKgBEpA=;
 b=pMhrhgcJcIADJoQYpxLyziGEkC8N0uLXEHAUXViQ3eTgdxWzH3rZpOT7OIC/iTiZK/
 53T3WFe854lfXKwPetzk3PlOpu3DfU8AXrjnnRk4Jc5P4q1Yg71eO8rUCctRIjgUj13e
 x2d8Dd83vRQYdG+IICkY8ijo4t/nXVMsgDzMPlX29tIiZ2WuH5NOH8wgle1WHkJ4J2EI
 hGGCxOXsJHCVxuHqPGNOnNeLP5csw3eyNgAwEW5tVA4vN1EBXXzMxNFmA6dId4tr1R8s
 H93774h9RwHJXuGX3gIb7Ljt84AAO4zsUauvZHiRbK0hAb9f/TyizyPjOFGu6Hh6VWsA
 QsfA==
X-Gm-Message-State: AOAM530UC8NHyd/bvPRKBc3nAMKB8ySa43q7h5KKm2lED5XHdJ7dhFFP
 emVx/E9fc6qbTouKpmRw9cUiUw==
X-Google-Smtp-Source: ABdhPJzJWrkaw6T+4ihm6jHzozRC/qSf3KPJPSc0pNQO6FeHwHEeQT8GSoMdN5kpobT6861D5YqreQ==
X-Received: by 2002:a50:934f:: with SMTP id n15mr48748967eda.339.1641319162592; 
 Tue, 04 Jan 2022 09:59:22 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y21sm14511579edc.32.2022.01.04.09.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:59:22 -0800 (PST)
Message-ID: <9d62c676-5055-b373-0ece-7b83d5aa41a6@mind.be>
Date: Tue, 4 Jan 2022 18:59:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220102174226.2823845-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220102174226.2823845-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/zchunk: needs MMU
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/01/2022 18:42, Fabrice Fontaine wrote:
> Fix the following build failure raised since the addition of the package
> in commit c618da772df32679fdd338b99f44133655c9113f:
> 
> /home/giuliobenetti/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: src/zck_gen_zdict.p/zck_gen_zdict.c.o: in function `main':
> zck_gen_zdict.c:(.text.startup+0x254): undefined reference to `fork'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/582b994372435b8c35a56345c15bd0ffc722af79
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/zchunk/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/zchunk/Config.in b/package/zchunk/Config.in
> index 2c8db434ce..2d2a78a210 100644
> --- a/package/zchunk/Config.in
> +++ b/package/zchunk/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_ZCHUNK
>   	bool "zchunk"
> +	depends on BR2_USE_MMU # fork()
>   	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
>   	select BR2_PACKAGE_LIBCURL
>   	help
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
