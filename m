Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61261C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 19:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7DBA429EA;
	Sat, 11 Dec 2021 19:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Qrg3u-zvXry; Sat, 11 Dec 2021 19:55:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF430429EC;
	Sat, 11 Dec 2021 19:55:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4EFE91BF414
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 19:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E22C429EC
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 19:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pt5iq7w4FIgp for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 19:55:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B65C6429EA
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 19:55:17 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id l25so40409540eda.11
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 11:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Lqn17UBkRypuHWDKHZTKZjXouk6nNaZEcWLq1xNfTPE=;
 b=cWyb+SNJ9Z94vU2HNQsGTBUn5W9z6SpFXrAX9xnlicPZS9suenVxiiJgXHO2XzbJ6k
 iu1aCW5dG4aYBEa5l41F+dx0cTiM9I3kdZ7ZpodiHlUxf9I/4IRMHkTa2KMdT99bwenW
 IujaRrgM4ybxOD/ozMmgpM+Rh51JqEN9m/kEYY5obs/1eMVAN6otOARVWLkOoEKtb82h
 y6JdzhIe4bylc7vf9bnjn4TepM0tk7GLYMBecuUru8JsYK5mt6x/Xkfn+BNveXS7yGKd
 cuikogZJHcIf+Eb0/yb92w5Tb4Zc4vqDkePh/K5GjdsB6HVVzRfXTmAZpzMG9eLVheCU
 vZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Lqn17UBkRypuHWDKHZTKZjXouk6nNaZEcWLq1xNfTPE=;
 b=7N9c7au54Qq2vzAjkZSMpeXuOqvaKanvZ/k+AjD82k318maTytSaXp1vhTNyL0j1tx
 8Jb6hadIrcv7VPIGQAOV2GTidtsPOkwKhxRXxCHSOBFgtQBfmfaG+zUhCMU6wCKtrIIO
 mBoewlwsh/Q+EVPUaHqFVuXrYFPV6aKAjxMXCJTwtQng3LB2G5puDHFBMt52MHbOT6FZ
 FL4CzZBWFbKH9QoW80EdWlSc2MTJKlUvWyxmNEe9E7II2ZUOphqItbeJaiva26iwsQaN
 dpQ7c6fpk3jKUITJ5qSXHAHiO6Mj4iS81dd028hPfYJmwX6DeP7reKTxU3hzRi4jfQUF
 QLIA==
X-Gm-Message-State: AOAM533KET0PD3kGhRvwlxPWu0szlBxEpniCHwPBtrLE8oex8v+1O6yw
 R0GchtJ61bMwSJ1mI3bCfQ4pyA==
X-Google-Smtp-Source: ABdhPJzAl0JG0CMzA0bMIMNHJ9FgExApK7xm8b5icl+NsDv2m0mHC22v2yXukiVdt7Pud5Qm5xQYFg==
X-Received: by 2002:a17:907:ea5:: with SMTP id
 ho37mr34477109ejc.133.1639252515704; 
 Sat, 11 Dec 2021 11:55:15 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h7sm3585201edb.89.2021.12.11.11.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 11:55:15 -0800 (PST)
Message-ID: <c69ac497-963a-26dc-1290-0e2b467769b1@mind.be>
Date: Sat, 11 Dec 2021 20:55:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20211121170756.3810922-1-ricardo.martincoski@gmail.com>
 <20211121170756.3810922-7-ricardo.martincoski@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211121170756.3810922-7-ricardo.martincoski@gmail.com>
Subject: Re: [Buildroot] [PATCH-next v2 7/7] Makefile: include *.patch in
 check-package
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



On 21/11/2021 18:07, Ricardo Martincoski wrote:
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

  I normally don't like applying my own patches, but this time: series applied 
to master, thanks.

> 
> Since a long time, we have a check-package check for patches. Make sure
> that this check runs in 'make check-package', by including *.patch in
> the find expression.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> [Ricardo: do not run check for SoB for now]

  I've updated the commit message to briefly explain why.

  Regards,
  Arnout

> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> v2 for http://patchwork.ozlabs.org/project/buildroot/patch/20211025192813.159336-1-arnout@mind.be/
> At next branch currently we have 53 SoB warnings.
> 
> I don't want to mess with missing SoBs for now :)
> These are the reasons:
> IMO, someone must check every single one of the 53 .patches to add a
> SoB. What should we do for them?
>   - check where the patch came from? Maybe not possible in some cases.
>   - assume that who added the patch was signing it (is this a valid legal
>     assumption?)
>   - maybe add the SoB of the person checking the patch instead?
>   - many patches missing a SoB also completely miss a header describing
>     the patch
> 
> But while these .patch files are not fixed, we can use this
> '--exclude=Sob' and check in the GitLab pipeline all other parts of
> .patch files that check-package knows already. See:
> $ ./utils/check-package --dry-run package/screen/0001-no-memcpy-fallback.patch
> package/screen/0001-no-memcpy-fallback.patch: would run: ['ApplyOrder', 'NewlineAtEof', 'NumberedSubject', 'Sob']
> 
> v2 of this series can be applied already, see a run in the GitLab CI
> using this series:
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/1804683744
> ---
>   Makefile | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 4062883cc2..55676386f9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1224,8 +1224,8 @@ check-flake8:
>   	| xargs -- python3 -m flake8 --statistics
>   
>   check-package:
> -	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' \) \
> -		-exec ./utils/check-package {} +
> +	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' -o -name '*.patch' \) \
> +		-exec ./utils/check-package --exclude=Sob {} +
>   
>   include docs/manual/manual.mk
>   -include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(sort $(wildcard $(dir)/docs/*/*.mk)))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
