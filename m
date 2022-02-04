Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE24EC433EF
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 08:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76487840C1;
	Fri,  4 Feb 2022 08:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tMG089WS8Rzu; Fri,  4 Feb 2022 08:52:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD6F1840BF;
	Fri,  4 Feb 2022 08:52:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2A501BF331
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 08:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97EC3840BF
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 08:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H8QT91F8ieps for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 08:52:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC242840AE
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 08:52:53 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id v67so7710290oie.9
 for <buildroot@buildroot.org>; Fri, 04 Feb 2022 00:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nFHALADVsQLO1N7CbGwJ+kBqV50FTWotW+nP1DVfMAg=;
 b=OYoAqnQukqrxs2ibyLh6nVrr7T6XZawUj2y/zsHNH2DcumTGYloeQO83I9lm4P/GYX
 DOhlzFZe8Yzf2aMtWVBjIzsjm3rlZwub5+s0pEz5UFT8byNkUUmSUeqqE3tOkZjyHC94
 iJesgDcWX8/PNO/mBOCp4LdNLaZKNgBIggdhpBmf9CBp2ZGS3iI6X2xGNNIP2Br9p9ax
 DTC7/oyzJ1O0+9TVseCNspOmuFJE+y9nexw3lLN9sz9JTBsijLIZsQMBtKYShUoXl02x
 +H+4mV/LXyRVBJ+wbJ3iDffRysAWa8//fqD5WmNVw44RmahfaLcRWS7DuQeZUCWWfJN1
 2cAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nFHALADVsQLO1N7CbGwJ+kBqV50FTWotW+nP1DVfMAg=;
 b=ZqvltbJRs7C7XEmvpbbTFpoNGCEltkVv08/PlpAXBtMYuW/dVl1XbQ3QkLxK1i1pIR
 zWuSTTnZbBVpySkuZshaBbPt3u/QcyI55zsaCRh+7scMLjqmQvenofCtwkG6kqUN7LER
 u6Y5VgExyDgrGZ1dzh+Gxy5zbeJQvA7FYiP4qDGqLIrGj+NE1kVKdzI6njQombOExM1o
 dhtZwCZwR/T8SVIShrPGik/Ct1SAVuEAPE9K1wqH1e9pHut1VgdWKVD2eO17jnfWNBy5
 AaKslKIKeFSfEIf7zyR4Wzkcp2kfxo8junTWOuzRyyVXRhy1XA9UT0emqUYc6959IvnT
 S8iA==
X-Gm-Message-State: AOAM532m+scKkyeggvE782FX9jEUwdzbpCxxTjgGA9RziUY+0dya9/TI
 k6kURT+VNMzZbXR1r0Pm/vn7p7pRxM5NRpwzFEM=
X-Google-Smtp-Source: ABdhPJyzxoBrs7XQcdM+Tzya2Nanse5bVaTflmchG7bKNiu1xInZm+8zWe5vmAtnhOEY27jfr7HNiD72fKfUoFAvbiA=
X-Received: by 2002:a05:6808:154:: with SMTP id
 h20mr860662oie.103.1643964772675; 
 Fri, 04 Feb 2022 00:52:52 -0800 (PST)
MIME-Version: 1.0
References: <1662cf67-b9ef-33be-c5c4-5d5e786f944a@benettiengineering.com>
In-Reply-To: <1662cf67-b9ef-33be-c5c4-5d5e786f944a@benettiengineering.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 4 Feb 2022 01:52:41 -0700
Message-ID: <CADvTj4qg822gvS8ufFWFB8w5Uv+EQ7L4ULJRueQ+rp+MY_ugeA@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] qt5webengine build failure on gitlab-CI
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Feb 3, 2022 at 6:03 PM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
>
> Hi Peter and James,
>
> I can fix this build failure[1] due to qt5webengine, you're the experts
> here, can you take a look please?
>
> You have to build using official docker as I've described in this patch
> for the manual:
> https://patchwork.ozlabs.org/project/buildroot/patch/20220203235438.610277-1-giulio.benetti@benettiengineering.com/
>
> I've tried this patch:
> https://patchwork.ozlabs.org/project/buildroot/patch/20220117114358.3814200-1-james.hilliard1@gmail.com/
> but it didn't help :-/

I've got a WIP branch that should hopefully fix this and a bunch of
related issues,
cleaning it up at the moment:
https://github.com/buildroot/buildroot/compare/master...jameshilliard:qt5webengine-kde

>
> Thanks in advance!
>
> [1]: https://gitlab.com/buildroot.org/buildroot/-/jobs/1929717230
>
> Best regards
> --
> Giulio Benetti
> Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
