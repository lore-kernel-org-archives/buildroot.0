Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6612C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B9D74020E;
	Sun,  9 Jan 2022 22:41:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qRUaLRwUSf2I; Sun,  9 Jan 2022 22:41:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7ECE401E1;
	Sun,  9 Jan 2022 22:41:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E31A11BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFE11401C2
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:41:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HZmH_S8Io4cW for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:41:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FA7E401B0
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:41:46 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id o3so23369208wrh.10
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 14:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=idfNs/jdUsgPflFEg8ZwpaAWwUDsFX6vQYezakp9+qw=;
 b=g9eKmQugbTU6KTSbY1vekURWxEOnq0sSMflCF8+J0PtNhdvzUVeGdFG+zvfW4ITxu8
 ufXFLkgAmKrjlSAEhJBDjmxQpDE6vDs6jglmXA3CJ8f6xCM+lymjyWrSnKArAXYE9579
 akwVILEW2phq8dBishRv/FlOXmU9Yq1nfom0cPz4CDP14MYM1/6PpZk6iCHDFImcp1BY
 Fl24MjUFyve0nPKJTEo6R/DM6uEFJbMuceUpTVPIWHSHrta/OL/Wm4JUdRZYuB1DgUtQ
 K8Ac5nfhLboKJmjqSiChqks29Ilu3g8xw9Rs+usl77i2WOmz5fUYSKE163CEh/gj/QEU
 ljkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=idfNs/jdUsgPflFEg8ZwpaAWwUDsFX6vQYezakp9+qw=;
 b=oVkBXvaxIZHwcecU80+x/FgrecUVtdET7VvadtR09zNo0ncY3OGKzYH+MlUaQxcK+s
 kVCxkB93Ih8dpOjdPeQ3tIy4t7OYfFIHUMEjGWNHzmheUqUqP5VMPcrV67lEQ3bPHdct
 usOmyV3crJCoQNRKqvMmSPo0HW6PzVZ3eYDYkUgijB+N+6heW7T3BlQOHrwuDIE/M2+N
 RKy7lSfGC64EBUJSvjTHl+tTKPIY9COSw6CIpvcmXPYSvITJQgD3Lgf0Gi7kBJV4ne4V
 1Cf/4g/ClJqzikasZB0DPAp9WrB5GGSzVbDBuo+UfRBpzvReG1qFvnRURMW88WrIeRpY
 ryxg==
X-Gm-Message-State: AOAM530ReXbD7d52Aeclay1nhR9rb0hoOvhTre0281YRcg/u3pSebIOz
 W9MwUG/G/Fms7YcKEYyiG+gemXjawk+/7xVE
X-Google-Smtp-Source: ABdhPJxh4juELm9ND0mYfuoGxTVsJAOPzTzpcZ6/Vy570KDJ/G+i0sGFW1sum0NolziwsPYioOO4VQ==
X-Received: by 2002:adf:ea49:: with SMTP id j9mr2217899wrn.151.1641768104537; 
 Sun, 09 Jan 2022 14:41:44 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id i15sm5452900wrf.6.2022.01.09.14.41.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 14:41:44 -0800 (PST)
Message-ID: <68cd9523-d7f3-3f7d-0cc0-cddb7711a1f9@mind.be>
Date: Sun, 9 Jan 2022 23:41:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20220109214724.94900-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220109214724.94900-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti as
 co-maintainer to mali-driver and rockchip-mali packages
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



On 09/01/2022 22:47, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ed65c74319..09da2dda1a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1093,9 +1093,11 @@ F:	package/harfbuzz/
>   F:	package/libfuse3/
>   F:	package/libnspr/
>   F:	package/libnss/
> +F:	package/mali-driver/
>   F:	package/minicom/
>   F:	package/nfs-utils/
>   F:	package/python-uvloop/
> +F:	package/rockchip-mali/
>   F:	package/sunxi-mali-utgard/
>   F:	package/sunxi-mali-utgard-driver/
>   F:	package/trace-cmd/
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
