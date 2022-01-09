Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD249C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 12:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7366C8188A;
	Sun,  9 Jan 2022 12:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SjTpztmbi60O; Sun,  9 Jan 2022 12:59:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F5588187F;
	Sun,  9 Jan 2022 12:59:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 881621BF20D
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 12:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 767E160B51
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 12:59:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2zcxkLIbptSx for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 12:59:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71A2A60B54
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 12:59:10 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 o203-20020a1ca5d4000000b003477d032384so4072413wme.2
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 04:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=M8408HUXca855zy1n6p+BguO12VjET0utQdTd3h6um0=;
 b=WLsyZ/5/mc190wN3bYq+mHeJ81SwYay8mfnWlobURTe56qNYpHeGkgf1cXj8Kh2RrA
 08uaoKfCUGrqIRC0peYB3YpXjXMA69xecnBDUf+DFusEVTdIjgaFuhVLXi3IMKDyNBd7
 dJk/0ZaWWbGQ4LPTur4KlQE8b8ixCNPhabf7+AKNJVCwsUB9GkB5O+zd1ERY7ZR2IZ3Q
 lI5SjOMIcwOgLKbqPaqhONtR4jsfweIWv1OhoSZLrsJbZBsKfohee+axAyiGq//Fad4q
 eAX1irpzb0FkYv2JcWVndIWeNmm2D5wgKYhCHGxFJwjw0wx1E9N6mIS4m+x7HdjWMo+X
 PuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=M8408HUXca855zy1n6p+BguO12VjET0utQdTd3h6um0=;
 b=Pr6ehaNAWO9JNkWNPQQz4JrFttQQcbE0evgeLAVBYBOdKKkB5XrBSEA8NJt8tpiWBU
 3297zs4KWxETp7ECLVDTTox+DJUsiPEiBuAmE4AQ+1HQ65OFj8k8eZ6GLgZFHOCp61FQ
 Hb5A3lUBT+pypk5kBbVOLMmyDe+NedQ7HKXoK8o8e4APTETjbl2gxDft69xLCiHZxzVf
 b/s4TYEpnTMUMh5yiVxVqrfCdwvP1htkKQlOcJ97oVCHjaoFlOhgHt8auYd7n8r3RrkL
 6lX16FDa7aCE9E4RnUzs08SzgnPjddwDk8DYGD1MALet34DsgiWxhQPBWYHcZXo8DGVm
 Qhyg==
X-Gm-Message-State: AOAM530CcegT42RyTyxVEqipQW+Xr9y00ik9q+VMj8krerlbaVrJZk43
 EmxeRvcor5msmEHlVKTBoR8fjA==
X-Google-Smtp-Source: ABdhPJyTSvQnuE5j/xSp7eiFkvKoAUOSlkNDefIgBV1uF3TWW5ceN/N9HB2nh/Stxi5BIEw6gfxgbg==
X-Received: by 2002:a1c:7209:: with SMTP id n9mr18094807wmc.92.1641733148665; 
 Sun, 09 Jan 2022 04:59:08 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id l2sm4360491wrs.43.2022.01.09.04.59.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 04:59:08 -0800 (PST)
Message-ID: <b5d9b414-f3bd-f3ce-e03a-6efa0905462e@mind.be>
Date: Sun, 9 Jan 2022 13:59:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20211203223127.274985-1-nolange79@gmail.com>
 <20211203223127.274985-4-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211203223127.274985-4-nolange79@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 4/4] package/systemd: always enable
 systemd-tmpfilesd
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
> this tool and service is pretty much expected to be enabled,
> making this a certainty will enable future improvements.
> 
> The config variable BR2_PACKAGE_SYSTEMD_TMPFILES is still
> availabe and always set.

  I don't understand why it's not simply removed. (The commit message should 
primarily explain *why* things are done, not so much *what* is done.)

  Since I think that the symbol can be removed entirely, I pushed a follow-up 
patch that
- removes the symbol;
- removes its use in cryptsetup.mk;
- adds it in Config.in.legacy, with an explanation of what to do if it's used in 
br2-external.

  It's a separate commit, so if you think that it really shouldn't have been 
removed we can easily revert it.

  Regards,
  Arnout

> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
> v1->v2
> -   dont remove the config, instead just set it to 1
> ---
>   package/dhcp/Config.in     | 1 -
>   package/systemd/Config.in  | 9 +--------
>   package/systemd/systemd.mk | 7 +------
>   3 files changed, 2 insertions(+), 15 deletions(-)
> 
> diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
> index e6e70908dd..515040c612 100644
> --- a/package/dhcp/Config.in
> +++ b/package/dhcp/Config.in
> @@ -13,7 +13,6 @@ if BR2_PACKAGE_DHCP
>   
>   config BR2_PACKAGE_DHCP_SERVER
>   	bool "dhcp server"
> -	select BR2_PACKAGE_SYSTEMD_TMPFILES if BR2_PACKAGE_SYSTEMD
>   	help
>   	  DHCP server from the ISC DHCP distribution.
>   
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 6f622c73f3..52c86aad59 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -485,15 +485,8 @@ config BR2_PACKAGE_SYSTEMD_TIMESYNCD
>   	  http://www.freedesktop.org/software/systemd/man/systemd-timesyncd.html
>   
>   config BR2_PACKAGE_SYSTEMD_TMPFILES
> -	bool "enable tmpfiles support"
> +	bool
>   	default y
> -	help
> -	  systemd-tmpfiles creates, deletes, and cleans up volatile
> -	  and temporary files and directories, based on the
> -	  configuration file format and location specified in
> -	  tmpfiles.d(5).
> -
> -	  http://www.freedesktop.org/software/systemd/man/systemd-tmpfiles.html
>   
>   config BR2_PACKAGE_SYSTEMD_USERDB
>   	bool "enable userdb daemon"
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 16202d4ac9..dfe9a1a5c7 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -49,6 +49,7 @@ SYSTEMD_CONF_OPTS += \
>   	-Dsysvrcnd-path= \
>   	-Dtelinit-path= \
>   	-Dtests=false \
> +	-Dtmpfiles=true \
>   	-Dumount-path=/usr/bin/umount \
>   	-Dutmp=false
>   
> @@ -307,12 +308,6 @@ else
>   SYSTEMD_CONF_OPTS += -Dquotacheck=false
>   endif
>   
> -ifeq ($(BR2_PACKAGE_SYSTEMD_TMPFILES),y)
> -SYSTEMD_CONF_OPTS += -Dtmpfiles=true
> -else
> -SYSTEMD_CONF_OPTS += -Dtmpfiles=false
> -endif
> -
>   ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUSERS),y)
>   SYSTEMD_CONF_OPTS += -Dsysusers=true
>   else
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
