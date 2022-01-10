Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA993C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 07:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 752CD827F0;
	Mon, 10 Jan 2022 07:54:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 31NhHO39s7vu; Mon, 10 Jan 2022 07:54:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97A0D827B5;
	Mon, 10 Jan 2022 07:54:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F3B951BF334
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF97D40327
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WiPQZ4Z-Ch3j for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 07:54:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D60224031D
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 07:54:32 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 o203-20020a1ca5d4000000b003477d032384so5099158wme.2
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 23:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=h/fSqb0JSCIHA91ZrUJJbg94Q6zIzN7XQpMKu3C1Ft4=;
 b=aSfyVKbEX3OTg36TuI6Txvp45I7r/DI4IRe8VM0K9lqxEsvL3I21XfU0JJT2pcS29Q
 MRhKbWViAN0xWizSRWiznC6WKEL6EthVEhlw8sSvenoT2ySYLJIi3OEUNQHAOysc18IS
 oR0yDwiUcLNcFUx3Ikw0TuBCTp5+ahXiyI7KbrqobbBVHASdRSrp0uH8H433dD4FSEg3
 7Y4N9Arc4ugr+QTXlrcPz9pQc6HNPFmeYVmeZswfpZEpjiQ/ZqUIdhjcxxGapCloKR7H
 KTDgd7IRRlIu/eDjCKvGSuTFXgOtC4kkQq1QvGOGPrvIZosUlstQ9gJtd/w5el4x37Pi
 dMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=h/fSqb0JSCIHA91ZrUJJbg94Q6zIzN7XQpMKu3C1Ft4=;
 b=bEMSuF0LinugTR2fYKcSJZrePDGW+3jMEJExNDjwcMmsRVeaKGcYG5T9K0nhhmsBm9
 DbJCw//NChdfheapWWxZnVnT6JZOY+401TnimeyOVCEGHut4jDhEhhKRjzJsl4sJGOh9
 TWtsbVHQ6I/1sX5SXsHxU0FA0OZLWZQpcRuC5wcY/Sys5p+7f6IhQzIBm91DV5i8YU8J
 R/bLhbm3U6h4wIQTUautZ4vV8nrbdoYd3czdVR+UrOmQDiYtDT6RQgcySUHfXQD4VIyB
 VMvfpMHORSjucT0ya2jJSheLNznpZtjpxkjIcfMghABL8ooXCbDvxFujjcZmt4jG80QT
 piuw==
X-Gm-Message-State: AOAM530XRFrYRpl2Ba54BEy4ATwfgCQ7mqZVPNvgHlTfdcYsIM7VRNFY
 oj9foofIfwUjzjX0L5dWbXRKiA==
X-Google-Smtp-Source: ABdhPJzdGL9CyEAmPXaLKrV2fOtc6lXgiYbzrubJ2auMKo80knAviwuiQ8grhSUdLtN65lo/WXeoMg==
X-Received: by 2002:a05:600c:8a2:: with SMTP id
 l34mr4425476wmp.123.1641801270995; 
 Sun, 09 Jan 2022 23:54:30 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id az25sm5867769wmb.26.2022.01.09.23.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 23:54:30 -0800 (PST)
Message-ID: <3edd836c-3bb1-4ed7-c312-459d3eda75cb@mind.be>
Date: Mon, 10 Jan 2022 08:54:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20210207212101.1527766-1-yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210207212101.1527766-1-yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] utils/test-pkg: add check that show-info is
 proper json
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



On 07/02/2021 22:21, Yann E. MORIN wrote:
> JSON parser are usually rather strict when parsing their input. Both
> jq and the python json module choke on non-conformant inputs.
> 
> Commit e4c284e6b9 (package/pkg-utils: escape \ in generated legal-info)
> fixed the \-escaping case, but we want to ensure that we do not have
> other data that would be improperly encoded.
> 
> To more easily catch issues, also run show-info and send its output
> through jq, to try and validate the output.
> 
> Reported-by: Peter Korsgaard <peter@korsgaard.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

  Applied to master, thanks.

  The same thing should be added to the autobuilder tests as well.

  Regards,
  Arnout

> ---
>   utils/test-pkg | 22 +++++++++++++++++++---
>   1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/test-pkg b/utils/test-pkg
> index a317d8c17a..5e00b589b8 100755
> --- a/utils/test-pkg
> +++ b/utils/test-pkg
> @@ -13,7 +13,7 @@ do_clean() {
>   main() {
>       local o O opts
>       local cfg dir pkg random toolchains_csv toolchain all number mode
> -    local ret nb nb_skip nb_fail nb_legal nb_tc build_dir keep
> +    local ret nb nb_skip nb_fail nb_legal nb_show nb_tc build_dir keep
>       local -a toolchains
>       local pkg_br_name
>   
> @@ -122,6 +122,7 @@ main() {
>       nb_skip=0
>       nb_fail=0
>       nb_legal=0
> +    nb_show=0
>       for toolchainconfig in "${toolchains[@]}"; do
>           : $((nb++))
>           toolchain="$(basename "${toolchainconfig}" .config)"
> @@ -133,11 +134,12 @@ main() {
>           (1) : $((nb_skip++)); printf "SKIPPED\n";;
>           (2) : $((nb_fail++)); printf "FAILED\n";;
>           (3) : $((nb_legal++)); printf "FAILED\n";;
> +        (4) : $((nb_show++)); printf "FAILED\n";;
>           esac
>       done
>   
> -    printf "%d builds, %d skipped, %d build failed, %d legal-info failed\n" \
> -        ${nb} ${nb_skip} ${nb_fail} ${nb_legal}
> +    printf "%d builds, %d skipped, %d build failed, %d legal-info failed, %d show-info failed\n" \
> +        ${nb} ${nb_skip} ${nb_fail} ${nb_legal} ${nb_show}
>   
>       return $((nb_fail + nb_legal))
>   }
> @@ -183,6 +185,20 @@ build_one() {
>           return 3
>       fi
>   
> +    # Validate that we generate proper json as show-info
> +    { tput smso; printf '>>> Running show-info\n'; tput rmso; } >> "${dir}/logfile" 2> /dev/null;
> +    JQ="$(which jq)"
> +    if [ -z "${JQ}" ]; then
> +        make O="${dir}" host-jq >> "${dir}/logfile" 2>&1
> +        JQ="${dir}/host/bin/jq"
> +    fi
> +    if ! make O="${dir}" "${pkg:+${pkg}-}show-info" > "${dir}/info.json" 2>> "${dir}/logfile"; then
> +        return 4
> +    fi
> +    if ! "${JQ}" . < "${dir}/info.json" >> "${dir}/logfile" 2>&1; then
> +        return 4
> +    fi
> +
>       # If we get here, the build was successful. Clean up the build/host
>       # directories to save disk space, unless 'keep' was set.
>       if [ ${keep} -ne 1 ]; then
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
