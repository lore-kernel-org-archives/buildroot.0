Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D2DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 07:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D744940004;
	Mon, 10 Jan 2022 07:29:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9QCpT1wrsXmL; Mon, 10 Jan 2022 07:29:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C72F54031D;
	Mon, 10 Jan 2022 07:29:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D22F1BF334
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AFB58270B
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:29:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nhVJyuczFrG5 for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 07:29:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D04B826C0
 for <buildroot@busybox.net>; Mon, 10 Jan 2022 07:29:45 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id v6so24855259wra.8
 for <buildroot@busybox.net>; Sun, 09 Jan 2022 23:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dee21Ij462sIjvSC4LnlGWpSWNR80hwlDfHNcW6NGSI=;
 b=VbWGGeghvV6ZULnzN/q7iKhF7tWpHeE4QTK49C8HvT0i1fGdX9FzUrgYPLXePyOI/h
 racU5N3pKsNTLOFis++V50tSh/mwVD8ZgHIVQO5l2igqSNwh18idWayEDsy8IuJ7rUXG
 iWo0/qN9MIiPp6ebY0UK9O+3iKQirgamUj57Z9jxsZgl0fQmsW6D2wxM0FZ4ZJ8mSXKx
 mwXuWDLDaTwnuOoQ3q0RaBxa4GRi+CskqV6CmD7B+h2LrFEUKDiVwuo3Uft4/jdPSoJ2
 9I8iCgvulJNA+m/1NuGfqKRQIpgsCPhh7A3KIXgWYEjmouYWVp2y6YD4G57EDE4hax3N
 Vvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dee21Ij462sIjvSC4LnlGWpSWNR80hwlDfHNcW6NGSI=;
 b=TSRBldZpAMv81ubHKgSLuHMbYIhFc7QPnFbopT7hGIChOdAGSWhhvfyQmjzOYsK6yw
 BdNlkCukO6qa4q2cTA4PiX72Y+9VgIqWfrc1/o1Do3ajbN8pQhbElePbw7RuENL1mi4m
 gNoxOHzjL2No+Cw7MZpRZjVcgWc/3OlMQOvjp1Qw0bUFJpz206iefWBMbqg0Vjx8Z3j5
 A8HJhMqVoz5NT1HhJ/LFyYpPN8pvLZTJd5TZK2yI1lDwSKorhJDcIx+C2J5lhTU+4+7s
 182RvTn1QcflY/a3v87bdyozEGtgdaWNvlvEKXfUxReaEYMBeBa1IIpeN5HqVwqjOTBY
 EhrQ==
X-Gm-Message-State: AOAM533kecUqWq6Q/9/l8vupoZ9waDXQ9whsFMJh6DInZBwAziFGx7S5
 ynopj5Wm4TIcscd6adMozLCy5w==
X-Google-Smtp-Source: ABdhPJz2eXcv34m9+2xmTzMx8iRohnLanaj9jhK3jwVX0z0tIK7J7J0iCyI9IuMSPf8QUgyVVGcPAQ==
X-Received: by 2002:adf:db4d:: with SMTP id f13mr2588701wrj.516.1641799784135; 
 Sun, 09 Jan 2022 23:29:44 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id c11sm6603991wmq.48.2022.01.09.23.29.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 23:29:43 -0800 (PST)
Message-ID: <c7295fed-6860-8fe5-c729-cc719dd19afc@mind.be>
Date: Mon, 10 Jan 2022 08:29:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20201017221743.160029-1-nolange79@gmail.com>
 <20201017221743.160029-4-nolange79@gmail.com>
 <20220109223145.GK1477939@scaer>
 <CADYdroORcA9Uj1dfGY1SaJDD=VqLxeemEtrc+AUmjZfajRUTQw@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CADYdroORcA9Uj1dfGY1SaJDD=VqLxeemEtrc+AUmjZfajRUTQw@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH v2 4/4] package/glibc: force -fno-lto
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
Cc: buildroot@busybox.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/01/2022 00:09, Norbert Lange wrote:
> 
> 
> Yann E. MORIN <yann.morin.1998@free.fr <mailto:yann.morin.1998@free.fr>> schrieb 
> am So., 9. Jan. 2022, 23:31:
> 
>     Norbert, All,
> 
>     On 2020-10-18 00:17 +0200, Norbert Lange spake thusly:
>      > glibc requires compilation barriers between files, and will
>      > fail with LTO enabled.
>      > So force LTO off by appending -fno-lto to the flags, but only
>      > if the GCC version is recent enough that an LTO build would
>      > be possible.
>      >
>      > Signed-off-by: Norbert Lange <nolange79@gmail.com
>     <mailto:nolange79@gmail.com>>
> 
>     Applied to master, thanks.
> 
>     Are the other C libraries (uClibc, musl) also affected by such an issue?
> 
> 
> Likely, and unless they are tested with LTO I would not trust them to not have 
> weird runtime issues.
> 
> Ideally there would be a whitelist for packages doing fine with LTO, for now I 
> can only vouch for the couple I am using LTOed since years.

  Up to now, the idea was that packages that support LTO would check for it 
themselves in their configure step and enable it if available.

  It would be a good idea though to add a global option to enable LTO, similar 
to SSP etc. The first step for that would be to add a hidden symbol that 
indicates if the toolchain has LTO, and that gets selected by the toolchains 
that have LTO. Then we have to look at each external toolchain to verify if LTO 
is available, and add a checker function to validate that it is correct. 
Finally, we can randomly turn on the LTO option in the genrandconfig script, and 
fix the fallout on abo.

  Regards,
  Arnout

> 
> Since a few distros now use LTO by default, hopefully things will get better.
> 
> Norbert
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
