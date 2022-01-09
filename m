Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2496CC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 19:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4FCB60BC5;
	Sun,  9 Jan 2022 19:57:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HyDSyeBt6S0S; Sun,  9 Jan 2022 19:57:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9E6960B97;
	Sun,  9 Jan 2022 19:57:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 02EC81BF20B
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 19:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F347160B59
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 19:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GrYIwPpMRc83 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 19:57:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6999607F7
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 19:57:35 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id e5so7475092wmq.1
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 11:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qCBCCvbLqyqNG7LCWPK8sZu0Lr5/3JrtoLn4IiqgEqw=;
 b=MG9ab5g3zIQ6UZckPi7gWoK/4zgdNJ0FAYq/AP29csXCfHLMJjsrGIK1R04KA1lqav
 acy5yLMeCbbLGTR2vmHd014CnXCunWFJAiNX5lUa8dSZ6ch45FlybhxW3Idp7EFPLsCo
 1FvvowcNaaw/yWI7Hly/moo8SdeA7IftDqVEWmFSM7iOei9tU84ASE4PnigDxa4kbpSx
 McPLvpdsPlebnCj14M8dKsl19ibjdMshhpwKTe+mvP/NBXVC64WPNiorCD+EE4/VtB6h
 d2khHSWHZFERY2RJlyYb/FwU7GAJmsJHNejcYFnGHlzzxhnJU7ZZQ07Hnamt1Kf4YnnW
 7wZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qCBCCvbLqyqNG7LCWPK8sZu0Lr5/3JrtoLn4IiqgEqw=;
 b=SCABLKnN15W/uXqJgBxYxwULTDCx7wVI8aD1ZkYkTH9LYu26+XBHf19O1P9nVT9OTA
 vVgtwaeWqrs6Gxf+w47T3zP2O6TrBWUQxwY9oEFjqXxTYMOGuHESlNblkrB9/OhkJt0i
 kK0HHe3Gjc/mhkTFYEh1Mn8NpJ67+zO5rfsojlckCfcxG9cHoPBEnDWQcDZ7u1WV1YKW
 UhP9K4mH1CQ7oKK+OIwCTBoYh9uUqiGVyTYVFIzQxILMvf3DfitWwyXXUSrSkbnoAgQg
 7ceInie2ZAePpcjLJEe1Z1PLu5ZvChx9NJheEKu9JpKEpllgjnPNtyTGOX0dTFY0bn3H
 v8hA==
X-Gm-Message-State: AOAM531XyF8LrmsDO41P6XJwUWMcaCh93WErtn35hBn1EYewoPAC8eZu
 mr5auEjbClY5QNXRPmDVTqEYOEfi2kwZsRZH
X-Google-Smtp-Source: ABdhPJxoYAyDj4XXCTGj7VDBPWX5eWi0S8TCjTakEvKOaW0GuNvINg0HRUcPvtRyjM56zWQoOyt8Mw==
X-Received: by 2002:a05:600c:4e4a:: with SMTP id
 e10mr18961334wmq.15.1641758253638; 
 Sun, 09 Jan 2022 11:57:33 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id t7sm1874938wrx.48.2022.01.09.11.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 11:57:33 -0800 (PST)
Message-ID: <84bd72d3-426f-f028-b4fc-a5337fa8defc@mind.be>
Date: Sun, 9 Jan 2022 20:57:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, nolange79@gmail.com
References: <20220109124415.8A8BF82CFA@busybox.osuosl.org>
 <8735lxca4s.fsf@dell.be.48ers.dk>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <8735lxca4s.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [git commit] package/systemd: Update description
 and kernel options
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/01/2022 14:27, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
> 
>   > commit: https://git.buildroot.net/buildroot/commit/?id=eb49354eb34842f88218fcf9ef60576b85653e38
>   > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
>   > realign the configuration to the README.
> 
>   > enable CONFIG_AUTOFS_FS (kernel >= 4.18) as well as the someday
>   > to be removed CONFIG_AUTOFS4_FS option.
> 
>   > Signed-off-by: Norbert Lange <nolange79@gmail.com>
>   > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>   > ---
>   >  package/systemd/Config.in  | 22 +++++++++++++++++-----
>   >  package/systemd/systemd.mk | 16 ++++++++++++----
>   >  2 files changed, 29 insertions(+), 9 deletions(-)
> 
>   > diff --git a/package/systemd/Config.in b/package/systemd/Config.in
>   > index c8c5a9c47b..27a12bc947 100644
>   > --- a/package/systemd/Config.in
>   > +++ b/package/systemd/Config.in
>   > @@ -22,7 +22,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
>   >  	depends on !BR2_STATIC_LIBS # kmod
>   >  	depends on BR2_TOOLCHAIN_USES_GLIBC
>   >  	depends on BR2_TOOLCHAIN_HAS_SSP
>   > -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
>   > +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
> 
> Is that correct? The corresponding BR2_INIT_SYSTEMD dependency was not
> updated.
  My bad, fixed in efa07944c59acd312d392d4e39f8470b38735282.

  Regards,
  Arnout


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
