Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BB9C433EF
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 13:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFE7F40C47;
	Mon, 30 May 2022 13:24:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id msY7Levr3KLM; Mon, 30 May 2022 13:24:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBA7840C39;
	Mon, 30 May 2022 13:24:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C61BA1BF357
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 13:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B42226118A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 13:24:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SH59OYi-zdiJ for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 13:24:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 188D060AE4
 for <buildroot@buildroot.org>; Mon, 30 May 2022 13:24:55 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id r82so9100824ybc.13
 for <buildroot@buildroot.org>; Mon, 30 May 2022 06:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kDj5UIRaiKalcbhUjckqK+pnGQVAEbsRLnPBi0W0JSE=;
 b=fNVgFjzhVJMkYHxVDnO+M/FZk2z8S2O5QWqMNCE5r9juBpq5nmi+vzsg6bUmUESLCN
 7jFztXwLDgLUtPFbUXTY1pa6fy8St2NaG9uzCIMqxw0gQko87vvnflE+7VniCde8+2kM
 2rAormDbhTG6zt+P+WvQ5o9fSjJFRYLE0mp8NdNdszC/OtuIpP7ts11omj++haECdX3n
 ROpj4XeYUk1tN0MJHnOkEJAIzAwzSEmVMFl/Rq0cPxGqWxQ9S9caI0eulSXiGdGWyH34
 sCa7ow4VhtTGL6L5BQ10YYrnoOZGfAVimFUa2ZpUWfumdcIayYADt0oKhTN3xloyt9aI
 AgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kDj5UIRaiKalcbhUjckqK+pnGQVAEbsRLnPBi0W0JSE=;
 b=CwmRM3Q3cSlT4WQmOo/XUKl904qQ6LbrUhvSvJCG+Uh/BWH4pMTX3CQawqX6uziFhC
 iMmJAqDtBwnX8E2ysOGaQxeV8Ag8mHVMhgq/z/tN/76YTZLeFkto5CKh/2d0rUIOga8T
 RZUE6HNgQxU7BPky9zU8rJRRZ7nU2bwFM+kVAqt3CQfU0CQHJY752AYMYY7fuyENQqqn
 8ZwYRPourd1BX9cG2hX+c4P4evrwoM9oyGoyyV8D+/b5LGk8kZc+nyrLE4dwI4japX4T
 2ItYIrE8z5craXtSG73/j7LD/32CCXOOctmDqsl7FEvCIs2wzreRlqA3E4gxizU1AOqC
 6t2w==
X-Gm-Message-State: AOAM530wuljiCeN8iCSEgDkiTmM90WZC/Mcp21BjrGpKHNf0+nZ41Fw7
 mLUxPFOI/u0URdcauXzKxTCjyZc9oHpuShJPGm0ry3qbKLc=
X-Google-Smtp-Source: ABdhPJxNnE4BW7UlKhabIP5ec6CxQSGmvpPctPF39MJPgLN1RWQPnzIIp+G3/GVJ+I0RMUwNprlzNmDZPF77Sf4zLoQ=
X-Received: by 2002:a25:8c87:0:b0:64f:cb1c:e7a9 with SMTP id
 m7-20020a258c87000000b0064fcb1ce7a9mr37179983ybl.519.1653917094830; Mon, 30
 May 2022 06:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220530124450.19073-1-andreynech@gmail.com>
 <CAOiXNkCfAQ-jBTrxT2dCZw9AR6uuFJ7WxEsYWXdhfm_iF4DLPg@mail.gmail.com>
 <87r14bdv6a.fsf@tarshish>
In-Reply-To: <87r14bdv6a.fsf@tarshish>
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Mon, 30 May 2022 15:24:42 +0200
Message-ID: <CAOiXNkBRo1YH0C6En3C5-GAEaYNutC2Mkx1_51yuzQgXLvKExw@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [Buildroot] [PATCH] package/cmake: bump version to 3.22.3
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Baruch,

> The 'origin/master' parameter goes to 'git format-patch'. Which means
> that you are sending commits between origin/master..HEAD.
>
> If you want git send-email to send you patch file, put that file as last
> parameter.

Thank you very much for the hint. Did it like you suggested and it
looks good now.

Regards,
Andrey.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
