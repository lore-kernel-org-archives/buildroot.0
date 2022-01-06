Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FF0C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 21:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D76A08329E;
	Thu,  6 Jan 2022 21:29:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eu25j52BMGeP; Thu,  6 Jan 2022 21:29:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A1BD831EF;
	Thu,  6 Jan 2022 21:29:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EFEAB1BF38A
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA6BB40286
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:29:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kAVEhWiuZE-H for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 21:29:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC492400E5
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 21:28:59 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q8so7274858wra.12
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 13:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=HNVebamJtLD6Igjl9y0CzXZ8vgh6YYCLATVpxk0u/Lc=;
 b=MtqxJDSygpl/TVSbw2R2F7HiMJ1M4sKwRCTRY2oPqvuq3JyMA5X/yZv1MILmyxsfuL
 tn+LRP9xVTAtXv+0P3fSztUWMQAFGfM20fJH/YmxBvk/NJFdtY0I3o4gIs724sC4WJt0
 Vs1OGK5jq/vRelL7ZZ3dZddWGYyLcO24ixrj0waVK8eNR91o1IsYgOnp5Nknf0gkjU9x
 BA39Kl45uTwNwuWWf2Bl2AdjA9ck2ZTaKRulzIYOArR0uZ1416Qtyc4/JYpCqg9WPM8b
 +SPfwtPqJwqmJVzFj6TiXVXRePw9qKuJ9zyj/W6OtMSCIJ2/T0TNQCs/tYat0da3/hnW
 8oDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HNVebamJtLD6Igjl9y0CzXZ8vgh6YYCLATVpxk0u/Lc=;
 b=zMGXckVhqBS3UAZhWVnY4OcHSAE93ck7ufRyusJsBn6qQGQAYbIuDCQlZ0vFDn+tuS
 8Lsh4EMiqYeFunBEFE6r31i3kWKEooMGNPUKXtsGZkO4xCueV3wjTqvCsN1fms/KbevY
 JGSJQeA46qlkHOsUfIZ9m1FTdyswpzbqcFq4MgyycyO47gmF0XvUKUVMammBo9fKP6El
 s1frw3KCX4gsAZxfxlhkTIiTpJEZHr/ozch33zfpFMs5rs9F03FWBTH6I8TvD1vowGkV
 cuA80NX1FaF6Hd8HKLU5EfG7EXMYoYSXAKsveo+7FMsjAhZIYWGntFDsRhAe5dBUB1MH
 GyCg==
X-Gm-Message-State: AOAM5307t2DXdQhkpPKaJgLzLOsaUGioVN04X86XaoEYgIuL9x80JL6M
 u9IStl3kEauW/6emuurgMQ5R6+qQw9GodN4E
X-Google-Smtp-Source: ABdhPJxBGtRnSDFfwqYJBPKxvVR6w70ldejre5pX3cYILGjAm6Avk3pySUSxlv/zxLZ6IexzqTupcA==
X-Received: by 2002:adf:fa4d:: with SMTP id y13mr8040760wrr.278.1641504538116; 
 Thu, 06 Jan 2022 13:28:58 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id a71sm125094wme.39.2022.01.06.13.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 13:28:57 -0800 (PST)
Message-ID: <7a3b641c-93a1-4d20-b32e-8ff88bae8fef@mind.be>
Date: Thu, 6 Jan 2022 22:28:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Gleb Mazovetskiy <glex.spb@gmail.com>, buildroot@buildroot.org
References: <20200328234945.12552-1-glex.spb@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200328234945.12552-1-glex.spb@gmail.com>
Subject: Re: [Buildroot] [PATCH] relocate-sdk: Allow relocating to any
 location
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



On 29/03/2020 00:49, Gleb Mazovetskiy wrote:
> Previously, the script could only relocate to the current location.
> 
> This caused issues for SDK maintainers, as the default target location
> (e.g. /opt/my-sdk) would need to be created and the content copied
> to it during the build process, which is error-prone.
> 
> With this change you can now pass a target location argument to
> ./relocate-sdk.sh (this does not move the directory).

  Even though, as Yann indicated, the use case is a bit iffy, the patch is 
simple enough. So I applied to master, thanks.

  Your Signed-off-by was missing, so I added that.

  Regards,
  Arnout

> ---
>   support/misc/relocate-sdk.sh | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/support/misc/relocate-sdk.sh b/support/misc/relocate-sdk.sh
> index caabeaa6f6..981d272425 100755
> --- a/support/misc/relocate-sdk.sh
> +++ b/support/misc/relocate-sdk.sh
> @@ -1,15 +1,20 @@
>   #!/bin/sh
> -#
> -if [ "$#" -ne 0 ]; then
> -    echo "Run this script to relocate the buildroot SDK at that location"
> +
> +if [ "$#" -gt 1 ]; then
> +    echo "Usage: $0 [path]"
> +    echo "Run this script to relocate the buildroot SDK to the current location"
> +    echo "If [path] is given, sets the location to [path] (without moving it)"
>       exit 1
>   fi
>   
> -LOCFILE="share/buildroot/sdk-location"
> -FILEPATH="$(readlink -f "$0")"
> -NEWPATH="$(dirname "${FILEPATH}")"
> +cd "$(dirname "$(readlink -f "$0")")"
> +if [ "$#" -eq 1 ]; then
> +    NEWPATH="$1"
> +else
> +    NEWPATH="${PWD}"
> +fi
>   
> -cd "${NEWPATH}"
> +LOCFILE="share/buildroot/sdk-location"
>   if [ ! -r "${LOCFILE}" ]; then
>       echo "Previous location of the buildroot SDK not found!"
>       exit 1
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
