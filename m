Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30A2C433F5
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 02:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CEDE842AB;
	Thu, 26 May 2022 02:17:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gp2xLKBrF11E; Thu, 26 May 2022 02:17:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AD6E8427D;
	Thu, 26 May 2022 02:17:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4AB521BF2A0
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 02:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4676840390
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 02:17:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=jms.id.au
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y-ZPJ6loNRsv for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 02:17:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6537D400BA
 for <buildroot@buildroot.org>; Thu, 26 May 2022 02:17:34 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id x12so424687wrg.2
 for <buildroot@buildroot.org>; Wed, 25 May 2022 19:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5r2Flw9+4ZTme2GyEGly808ZOrsJl42NahF7KBco1BI=;
 b=YTOw1svVQy5L0vaZ34ATBL5uThCzXLCzfNM5+NVzh3JXhyQuIRilNGEXKLRez35cU8
 I9E1mkqdLVdJ/iQu/iFRnKn3LthHEMxBfIH8VSwUstG69BdxIcirCod0+sWXtCIVUJ6d
 Ks3MSR8wFHmpQg1KoIDETjiEutGr00GWHZpNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5r2Flw9+4ZTme2GyEGly808ZOrsJl42NahF7KBco1BI=;
 b=mItcIGjS2/s/z7vdP+hFJdnlEI217l0zthgSjnq2cgR+iKsUHn1Q09r0v3eMNbyNAX
 9oqLzoVbXsO3EQbC9V89RoLwcDhlAd9hUobyYm8NGibmjujOx7Mw0/X6UdysCeHR/EcE
 /xQu7r6WymS3RiGzx9rhRD7ZKY5/fuDBHmUAnKd1pEesLXFKxajnuZEmmbh8krTM46wu
 5AqbxES5irzEXZTdIuA43pEtLcUhN68hK9bYANFa3G7ggc0ewsaq11g9DXslFTFUprkn
 +BQUoOrUmDAE6VGbYnTgg454cEZ2zfoMKpfts8cmyOPUAASw7jeSBV1PC7vtlPJ3br7H
 3Jyw==
X-Gm-Message-State: AOAM530oTP7Xavvctn+PwHPBHBqiDVVGqoiAi59u40HrpIiFPy7hVOjN
 Lfq+pZXybemm06ZaD3E8Jy8eTsxtqU5rNfxo4ZivIU+a1+M=
X-Google-Smtp-Source: ABdhPJxiRvg3Vg7YIZLmtFHAOfP+tMIhwT3vbzfdMz1fUT8xqpbpgT6OG29YFB3QfYYjJ4dYHDCdY/m+l4q2mG2rogw=
X-Received: by 2002:adf:ec0f:0:b0:20f:c997:6dba with SMTP id
 x15-20020adfec0f000000b0020fc9976dbamr19209277wrn.628.1653531452460; Wed, 25
 May 2022 19:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <CA+h8R2pE3Z8=fjUBYvXMZp5d3s_+FRQeh4Ms1W8E8eySfdtazA@mail.gmail.com>
 <20220525234312.643dfc03@windsurf>
In-Reply-To: <20220525234312.643dfc03@windsurf>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 May 2022 02:17:19 +0000
Message-ID: <CACPK8Xe2LB_LNd0zVneLKd+eNmZBqvKX4cuZgqgTpkQPBmyR=g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [RFC] package/go: switch to gcc go instead of
 go-bootstrap
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 25 May 2022 at 21:43, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Christian,
>
> On Wed, 25 May 2022 14:07:38 -0700
> Christian Stewart <christian@paral.in> wrote:
>
> > I propose that we switch to using Gccgo:
> >
> >  - build gcc and/or use external toolchain
> >     - add flags to enable the "go" language in Gcc
> >     - GCC 11 or later
>
> The problem I see with this is that many external toolchains do not
> provide Go support. While this will probably evolve over time, this is
> not something that we can reasonably require right now.

I use arm64 and ppc64le hosts for my buildrooting as they are the
fastest machines I have access to. Neither are supported by
go-bootstrap, so moving to gcc-go looks like a win for me.

Likewise, we don't have prebuilt toolchains for those host CPUs so the
question of external toolchains is not a factor.

I appreciate that my situation is unusual.

> So I believe we probably don't have much other choice but to provide a
> path that consists in building Go in multiple stages: first Go 1.4,
> then a version of Go that is the last one that can be built with Go
> 1.4, and use that one to build the latest version of Go.
>
> What do others think?

How much work is it to maintain both approaches: go-bootstrap for
setups where the host supports it and an external toolchain is in use,
and gccgo for the other situations?

Cheers,

Joel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
