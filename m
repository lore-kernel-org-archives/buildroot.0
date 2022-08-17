Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE66DC25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 06:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5467982F8B;
	Wed, 17 Aug 2022 06:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5467982F8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QH_HOdlfdFAu; Wed, 17 Aug 2022 06:16:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 794A982F77;
	Wed, 17 Aug 2022 06:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 794A982F77
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 590881BF9C6
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 06:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F4BB82F77
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 06:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F4BB82F77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iQ9uiMZn46n2 for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 06:16:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE93982F6C
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE93982F6C
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 06:16:20 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id p18so11168014plr.8
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 23:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=bLmPqz0+/C3HLPMLjmH+Da5HEIiwFJO26YjyqWd15bw=;
 b=x3TZk7ukt94kfeDAeiQ8MDhWi3s6CGvKx3n5SKd+1459QUt4JfkfxixuvOTVDBp9xC
 uOvgkeYDTNoQKxjJnbEvnZXBFg5YisoQCttIo2DSf64RqhCtqdKxYq4isIQjqb5ZWdsy
 vYw354QNym+OoOemPeTs/BoXoLky0Z3CF3mbIfpqDVowT9AMAfIeODFy2SZ0bqmFY9bm
 bM5SjObpBhUkC39bCfgH/0zyEtsSjG1+T7R9X/9Z2OXAXzXIViav4++7Qz7TvX+NWBNL
 ToU0XAi3JbvCCUYs7f4UPenuasZvkZoSENYTfCmvb+iqXBhgmIl67cPcpFHQFFF7YZTB
 5FIw==
X-Gm-Message-State: ACgBeo2XgFEZFBDxLrk4mwYwlIbBhBpyHcHRkOHJFpmyxRK05nhcytW8
 P37ULH/vwMV0FNULhLoJkbXsy5a1rtztfAqN6pI=
X-Google-Smtp-Source: AA6agR5+mA42G3VmN5WLBJYuGRAeDSNzUVxsneVlXLRsHBHICbpxw0VQNC9aoiDwtSWRxZE9x+iRyND7IOSuTxDRo5E=
X-Received: by 2002:a17:903:40c4:b0:16d:d2a9:43ae with SMTP id
 t4-20020a17090340c400b0016dd2a943aemr24940554pld.57.1660716980333; Tue, 16
 Aug 2022 23:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220313171355.271345-1-james.hilliard1@gmail.com>
 <20220803233856.3d609d8c@windsurf>
 <CADvTj4r9D=kUa-N+HC2tVTt7Oxna=ZMSp-H5POaYzE2DsXCD-w@mail.gmail.com>
 <20220804095907.4b22adc0@windsurf>
 <CADvTj4qpEheXiMVYCBgLL-8k8_inRHO+bCcGDsmr=F6_7DQT7Q@mail.gmail.com>
In-Reply-To: <CADvTj4qpEheXiMVYCBgLL-8k8_inRHO+bCcGDsmr=F6_7DQT7Q@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 17 Aug 2022 00:16:07 -0600
Message-ID: <CADvTj4qq3uDjy8VeOV_sjCbJLho8_=yU0g64S9RvA+p4fhiV_g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=bLmPqz0+/C3HLPMLjmH+Da5HEIiwFJO26YjyqWd15bw=;
 b=dOoIFaC3QWPVwr4UprQ1RrnsUjFVjGrqDXZX5MXYKhq3E0pACxZJvsmr7AzUdVf8j0
 1Z8cwlEx1RcVEV7vJZi1huPhKvSRVX4HW137ew1GTWr61M7Aamd51NHPKJkFkEOVJAiX
 NR3IzPLgRMH6meRTo3IqCBoxHkqXlN5y7qv0T7zxCetuTPdo/rt7KnPhdp1WLUAVV2Ja
 GMS3/W+63aPimevRTN1VFeF0VQtq6VL2zCItutsoGEqywl761mmTHpLiZCQjomhZ31t/
 zaDhayHsMFg3u9599R2QdbRs81qVZhZSa8h9J+/atmO9Xyl0eisTPox9kTid1WLDYDC4
 4meQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dOoIFaC3
Subject: Re: [Buildroot] [PATCH v2 1/2] utils/scanpypi: ensure tmp_extract
 is cleaned up on exception
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Aug 16, 2022 at 11:57 PM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Thu, Aug 4, 2022 at 1:59 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello,
> >
> > On Wed, 3 Aug 2022 16:02:43 -0600
> > James Hilliard <james.hilliard1@gmail.com> wrote:
> >
> > > > If I understand correctly self.tmp_extract is where the Python package
> > > > source code is extracted. So if you remove it at the end of
> > > > load_setup(), how will your new load_pyproject() added in PATCH 2/2 be
> > > > able to use the package source code?
> > >
> > > We're not deleting self.tmp_extract, we're just ensuring we current dir and
> > > sys.path states are cleaned up properly on failure, load_pyproject() does the
> > > same thing. Always restoring initial state at the end means load_pyproject()
> > > doesn't need to deal with current dir and sys.path global state changes induced
> > > by load_setup().
> > >
> > > >
> > > > Also, why is this removal needed, as anyway the full tmp_path gets
> > > > removed at the end of the main() function?
> > >
> > > sys.path.remove(self.tmp_extract) is not the same as shutil.rmtree(tmp_path)
> > >
> > > We're restoring the module search path at the end to avoid leaking global state
> > > changes when there's an exception.
> >
> > Aaah, yes, my bad! I guess I shouldn't have reviewed this past midnight.
> >
> > I'll go ahead and apply PATCH 1/2.
>
> I'm not seeing this in either master or next yet.

Respin with clearer commit log:
https://patchwork.ozlabs.org/project/buildroot/patch/20220817061157.4120650-1-james.hilliard1@gmail.com/

>
> >
> > Thomas
> > --
> > Thomas Petazzoni, co-owner and CEO, Bootlin
> > Embedded Linux and Kernel engineering and training
> > https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
