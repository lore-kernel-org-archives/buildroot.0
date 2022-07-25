Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2573EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 06:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C65B83F23;
	Mon, 25 Jul 2022 06:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C65B83F23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sK8F1zn_1PGo; Mon, 25 Jul 2022 06:28:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC3C883EC9;
	Mon, 25 Jul 2022 06:28:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC3C883EC9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9668B1BF38C
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 06:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DAD5405D9
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 06:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DAD5405D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G5Qcr_OtNrac for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 06:28:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F63740239
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F63740239
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 06:28:03 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id z15so765145edc.7
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 23:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NFAzfsv1fL0prYjRg5S2o7naYwjG685E6Aj2XV+n8K4=;
 b=LuN7TQ5ea05FK9Bl9Pa1atpt7txH67NQL4xvSenDO9Nm7Y1iLaoMdDArtEpZPSogdS
 xMcXZRHphnjjIDMIqQnMiH+nt4LA1QOLcEcI73mfwexOI7QH0Q8I5WYP29eJlixf2+fN
 w6ATc5Q0f6G7cmACCcJSisk67/M/k86x6x1tW98mjkwz0jwrYVsO7D6VEuMo8eDxiWVc
 M3Z1uzsW1dwECUO2uO3PuuSzQU2eqWw6mYM4YKUjDyPNgI9ARb5reSulFbbQjF3ibjM6
 u/SBhP/yvigbnYLmdl62Zhe22njWRZs6X3aYTM8Fb6zhUxUT9UFb8yJ1SkK817Dut2AM
 3q/g==
X-Gm-Message-State: AJIora8ouYYGvVrqkqlIHTxeZs5MBu6dW8oEc7sZWdfY3D4h+HT+zJsz
 IohqY/8RQsozXiQrFQPTNfQKCxkt2j9ZlX4G
X-Google-Smtp-Source: AGRyM1tOs2Qc4XHLDeydiMkzm9BNX1hL2A1hyl9KVDsdbFzqCzBPQ4HltZqvWo+PUBBgnuGbKn/UTg==
X-Received: by 2002:a05:6402:1914:b0:43a:d59b:5e79 with SMTP id
 e20-20020a056402191400b0043ad59b5e79mr11566102edz.124.1658730481289; 
 Sun, 24 Jul 2022 23:28:01 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53]) by smtp.gmail.com with ESMTPSA id
 d18-20020a056402079200b0043a253973aasm6555204edy.10.2022.07.24.23.28.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 23:28:00 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id i13so3459657edj.11
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 23:28:00 -0700 (PDT)
X-Received: by 2002:a05:6402:4391:b0:43c:1883:8399 with SMTP id
 o17-20020a056402439100b0043c18838399mr1053682edc.233.1658730480114; Sun, 24
 Jul 2022 23:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220625224224.1446787-1-christian@paral.in>
 <20220723184104.0032a7dc@windsurf>
 <CA+h8R2og5UzGbLs-NHFKdLYyEus0v20EqgdZMtHnJDQa9dY4Gg@mail.gmail.com>
 <20220723222237.7989b5c6@windsurf>
 <CA+h8R2qUUZ9q9L1Xs4V5GOB1W1iJcKPaMxs_-h0d2dAOKwybGg@mail.gmail.com>
 <20220725082556.33cfb04b@windsurf>
In-Reply-To: <20220725082556.33cfb04b@windsurf>
Date: Sun, 24 Jul 2022 23:27:46 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rcc=sqTDY0HtE4UNUJydVZFd16PWXLXGaHo+wK0aVN6Q@mail.gmail.com>
Message-ID: <CA+h8R2rcc=sqTDY0HtE4UNUJydVZFd16PWXLXGaHo+wK0aVN6Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=NFAzfsv1fL0prYjRg5S2o7naYwjG685E6Aj2XV+n8K4=;
 b=Y62zA+P65MeLYlxejEssXkWmkOfPcUUm3rqSbcnMPT08g/kQhbisNouKhRJFFSdX6S
 tQYw0utfR1XKPB/fVMRJYEQUGtgZHUILL8GDHkAQH8JSwCHuLUfQG5ywtcGXi29HJrsK
 GjZGvhUeaQ94AbdD9NRvLOXd4j8ThWzsORSSShGPGITpwF0f6LDs1vPZrmwPx7QFUb0w
 zLOMwYSK25Xr+I4yjL5UqQxTMdhy/k8TfKOTHC2TRD4J28V1+rZbw4Uws9eGMMZNWmRW
 3gyIf//58XGfjhAEW8XUUWW6pNeZPJUSjNPHpoSp98T3psQajg9DlF8oeN9euiWNlPqM
 SP0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=Y62zA+P6
Subject: Re: [Buildroot] [PATCH 1/1] package/gocryptfs: fix build against
 riscv
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Sun, Jul 24, 2022 at 11:26 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sun, 24 Jul 2022 16:42:30 -0700
> Christian Stewart <christian@paral.in> wrote:
> > > So these lines are really removed.
> >
> > If you run 'go mod tidy' it removes these lines.
> >
> > So, I guess they are unnecessary / not needed after the "replace" is added.
>
> But that's precisely the part I don't understand: the fork of the
> crypto lib is supposed to only have a fix to build with RISC-V... so why
> does the fork has changes on its dependencies?

I don't think it's that the fork changed the deps, rather that the
newer version of Go (1.18) drops those lines whereas a previous
version would have kept them.

The dependencies didn't actually change or you would see more changes in vendor/

Best,
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
