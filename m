Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 823EBC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 16:07:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BD4661078
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 16:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BD4661078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5A0C40526;
	Tue,  3 Aug 2021 16:07:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cC854-6g-l-x; Tue,  3 Aug 2021 16:07:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19D254051D;
	Tue,  3 Aug 2021 16:07:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9106C1BF868
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 16:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FB464051D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 16:07:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mYyMN23lkwI7 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 16:07:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 305D940518
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 16:07:39 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id y12so29670453edo.6
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 09:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tkWWNT19eJEAtFf6WoaXr+Bd7NSEZHUVYdvtREaePNk=;
 b=M/NR3uoUppnFNGFsJBF6KpsJ9pA7YYwCTcmO2L9JxA6SAW7J5wxG7+TaPOkWDoJE4i
 PfPMDABASNBsHjpv4+7TLExe1eeBlBrzus7QLoehJB5xziopwgiwf5pDozc0lfeMdGKJ
 pLV+eBMvi5204Xn/ay9fycgPo9E5Ge+FE8zPpOVcS4WgZujEehPBSxkQ4bD1JgME5cn2
 FgQpziX4Yp5Qt/2wOPNDaNUY/dIsQVcW3UnG48WXNDOuwZzpdJYzHmTGPhLuB+taf1ac
 ekl5LwTsaXqschMT5rBT0W6NHI5Uj4a8LbUpWh3vNQ0iM2ZRRqWPTPfnGPqomvaH+I/+
 1bDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tkWWNT19eJEAtFf6WoaXr+Bd7NSEZHUVYdvtREaePNk=;
 b=enVdqzkcl1yboTb6lWAtGO06AWJ/80gMb95NaYZIn3C8n2hWMnKDrhhZNu3ICpSTbl
 csFmcgQHqEsOe2AF3Q0ouXOZs3p4QhLFPCFcQ9+fxBgPXkh71V816j7paK/H11mCnLDD
 xT6eTfU8wK4BcvBCZTgDdLeyiHzGiN9pFk8DYHS0byOc0sH4o18f7SvRc/OIQFGxrLtP
 KCPilpHwi9q8uqgnEwr6/k7M1wTmHT6h3N5NTeRgT7NHvhOpevb/YCx6lZJ5uJAtEC/W
 +Q7DItfDA0e/mGoYDzTO9K+BFsWG2VcXsPNnKZiL/7PWb1pPY3R3KgzH++aTTA63rxBw
 Xt/Q==
X-Gm-Message-State: AOAM5319X97pUl4Jiv+DFU63420nsvXKhp6cwwf9fi6WOoFzrH0F9FyJ
 OAZ7lt5KBZYeIW6JheexBP+2GgzB4K2nztXG5sw=
X-Google-Smtp-Source: ABdhPJzV0s3sQV3r2syTqzbBURq4gpEpeYP0WDQprvCvgP25894JxViLLAD9bPwXwRqQHXKfjtbGpw==
X-Received: by 2002:a50:da0e:: with SMTP id z14mr27012356edj.73.1628006858339; 
 Tue, 03 Aug 2021 09:07:38 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id c14sm6408356ejb.78.2021.08.03.09.07.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 09:07:38 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210801223509.1360022-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <f0f2a234-1fb5-c699-f983-80d44d49cd13@mind.be>
Date: Tue, 3 Aug 2021 18:07:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210801223509.1360022-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/fluxbox: fix build with gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 02/08/2021 00:35, Fabrice Fontaine wrote:
> Fix the following build failure with gcc 11:
> 
> util/fluxbox-remote.cc: In function 'int main(int, char**)':
> util/fluxbox-remote.cc:76:32: error: ordered comparison of pointer with integer zero ('unsigned char*' and 'int')
>    76 |             && text_prop.value > 0
>       |                ~~~~~~~~~~~~~~~~^~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6e718bb662aa4961ea264eb81e4b7e7b20485e30
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/fluxbox/0001-fixes-bug-1138.patch | 25 +++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 package/fluxbox/0001-fixes-bug-1138.patch
> 
> diff --git a/package/fluxbox/0001-fixes-bug-1138.patch b/package/fluxbox/0001-fixes-bug-1138.patch
> new file mode 100644
> index 0000000000..9c02e93350
> --- /dev/null
> +++ b/package/fluxbox/0001-fixes-bug-1138.patch
> @@ -0,0 +1,25 @@
> +From 22866c4d30f5b289c429c5ca88d800200db4fc4f Mon Sep 17 00:00:00 2001
> +From: John Sennesael <john@aminking.com>
> +Date: Mon, 2 Nov 2015 15:14:32 -0600
> +Subject: [PATCH] fixes bug #1138
> +
> +[Retrieved from:
> +https://github.com/fluxbox/fluxbox/commit/22866c4d30f5b289c429c5ca88d800200db4fc4f]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + util/fluxbox-remote.cc | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/util/fluxbox-remote.cc b/util/fluxbox-remote.cc
> +index 59852e6a..504015b5 100644
> +--- a/util/fluxbox-remote.cc
> ++++ b/util/fluxbox-remote.cc
> +@@ -73,7 +73,7 @@ int main(int argc, char **argv) {
> +     if (strcmp(cmd, "result") == 0) {
> +         XTextProperty text_prop;
> +         if (XGetTextProperty(disp, root, &text_prop, atom_result) != 0
> +-            && text_prop.value > 0
> ++            && text_prop.value != 0
> +             && text_prop.nitems > 0) {
> + 
> +             printf("%s", text_prop.value);
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
