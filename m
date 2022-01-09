Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DB3C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 12:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBA75817A3;
	Sun,  9 Jan 2022 12:55:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p0UETkKxV9a1; Sun,  9 Jan 2022 12:55:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 014A681772;
	Sun,  9 Jan 2022 12:55:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E21A71BF417
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 12:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA8F660B44
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 12:55:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g8r2eE4GiuUT for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 12:55:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 817DF60AE7
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 12:55:48 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso8134494wmc.3
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 04:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BXrcZQkFcYWIaw8U8NR/yJHRjKor6VbzA0ZcHxlRVAA=;
 b=c8yV8JaIPlqcsLb8RIbtrRUH/WSDD6JJcPWanMcrTMfM6mpV90rjr5ursvHwACmCN4
 LmawB+8Pby1R+dpbHyMCW67kUiYSA9g0Xjh4yawLg4XBWn9YY03viRXIswUtCA+NOzvB
 7/fk+oUs5LkxwI7D1tuQe2aLDKBMMe8Yq4vHRrcq9nQgaMayU8l5knqHaYtgb6Qiqzdb
 xGDaPQynYeZ7m/bPyTLgneG+pV1wANA2mGmJ6Zu+k30yjvWE7WY2GkQm7VQQ5oxx7RSv
 7r4hyYREp5V4qsGRcxURrgQRW6GR9aUgn/rg2wMTCEhtbuLpWJwz6y+5iqroexVwQnPM
 C+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BXrcZQkFcYWIaw8U8NR/yJHRjKor6VbzA0ZcHxlRVAA=;
 b=f/8uDC/VPOJzCQ8FH7VKAe81bFJNzEeKuX91vWP3AKg1eVtMp0E60hoV6n81DmJVVa
 cui2AfHW4AvGAXaC64Ut+msr5yhn1/CXDzO3tlfKKqrzHlZ+ls7Xr2YMwQhYgTOxKcvg
 Up5LJ0ahitKIEosAbL9Cv4Ijq+5fSd9+hmaE4nu1hvMfbSUZLXkafxzpI3OOovBzQxjv
 Jppj1XRwDdIh+0bUQK9xTUul8T/R+EzxCqqkg3MdG3J1GUDpnD9qjunuJTnPNPE2CMF/
 ddanNOEDaDSO0BYG6TmQtoSg3vrbWnUdTOrOMbG+G5vMSmUolpS0JELaIA0vv4zgr5qu
 g+AQ==
X-Gm-Message-State: AOAM533kgJJNW1d67/A2FMUnUlKt6g1sD4RY/AZJ1O2EQ6GiF7lFL1pO
 VN8+znGHSXCVxmQc7tFElQGN5w==
X-Google-Smtp-Source: ABdhPJwxsg8kCoHoVPpAcsUJAp0W4YzUq5b6IXbcsH4Dsxfnu00PBK7FsOgOmNcOwUm7Q8JBn4v2WA==
X-Received: by 2002:a05:600c:4b95:: with SMTP id
 e21mr18306335wmp.187.1641732946761; 
 Sun, 09 Jan 2022 04:55:46 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id h14sm3981909wrz.31.2022.01.09.04.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 04:55:46 -0800 (PST)
Message-ID: <f704eca2-7e54-8a37-d261-bdb655a2c31c@mind.be>
Date: Sun, 9 Jan 2022 13:55:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20211203223127.274985-1-nolange79@gmail.com>
 <20211203223127.274985-3-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211203223127.274985-3-nolange79@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 3/4] package/systemd: adopt odering in
 nsswitch to newer versions
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/12/2021 23:31, Norbert Lange wrote:
> This modifies the order of the nss modules, reflecting the current
> state of the documentation.
> 
> nss-mymachines lost support for resolution of users and groups,
> and now only does resolution of hostnames. Changed in v246.
> 
> Multiple changes in regards to nss-myhostname now recommend placement
> after nss-files and before nss-dns. See commits ce266330, f918c67.
> 
> nss-resolve handles the nss-files logic itself, and its suggested to
> move in front of nss-files. Changed in v249.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

  This patch was superseded by [1], which is marked as v2 just like this patch. 
I hope you understand that this is a little confusing for the maintainers (or 
for anyone reviewing it).

  If you want to make life easier for use, please:

- Re-post the entire series when one patch changes.

- Make sure you include a patch changelog (you do that, I'm just saying it here 
for completeness). Patches which haven't changed can have a "No changes" 
version, but personally I don't care too much about that (it's implied by the 
fact that there is a patch changelog but this particular version is not 
included). That saves a bit of time during the rebase since you don't have to 
reword every commit.

- Mark the old series as Superseded in patchwork. When you create an account, 
you can always update your own patches.

  I applied the series (including the [1]) to master. There's one comment I'll 
post separately.

  Regards,
  Arnout

[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20211203230919.683527-1-nolange79@gmail.com/



> ---
>   package/systemd/systemd.mk | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 373e5c82bb..16202d4ac9 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -563,13 +563,11 @@ define SYSTEMD_INSTALL_NSSCONFIG_HOOK
>   		-e '/^gshadow:/ {/systemd/! s/$$/ systemd/}' \
>   		$(if $(BR2_PACKAGE_SYSTEMD_RESOLVED), \
>   			-e '/^hosts:/ s/[[:space:]]*mymachines//' \
> -			-e '/^hosts:/ {/resolve/! s/files/files resolve [!UNAVAIL=return]/}' ) \
> +			-e '/^hosts:/ {/resolve/! s/files/resolve [!UNAVAIL=return] files/}' ) \
>   		$(if $(BR2_PACKAGE_SYSTEMD_MYHOSTNAME), \
> -			-e '/^hosts:/ {/myhostname/! s/$$/ myhostname/}' ) \
> +			-e '/^hosts:/ {/myhostname/! s/files/files myhostname/}' ) \
>   		$(if $(BR2_PACKAGE_SYSTEMD_MACHINED), \
> -			-e '/^passwd:/ {/mymachines/! s/files/files mymachines/}' \
> -			-e '/^group:/ {/mymachines/! s/files/files [SUCCESS=merge] mymachines/}' \
> -			-e '/^hosts:/ {/mymachines/! s/files/files mymachines/}' ) \
> +			-e '/^hosts:/ {/mymachines/! s/^\(hosts:[[:space:]]*\)/\1 mymachines/}' ) \
>   		$(TARGET_DIR)/etc/nsswitch.conf
>   endef
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
