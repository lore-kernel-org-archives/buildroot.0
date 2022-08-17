Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AFBC25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 05:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4BF540C92;
	Wed, 17 Aug 2022 05:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4BF540C92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rJkIUapeq9VZ; Wed, 17 Aug 2022 05:57:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1B6140AD9;
	Wed, 17 Aug 2022 05:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1B6140AD9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F17CA1BF2A7
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 05:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D86BA415C7
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 05:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D86BA415C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EIr8RSAIvGOk for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 05:57:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEB12415A6
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BEB12415A6
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 05:57:48 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id q19so11223785pfg.8
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 22:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=6mygda5+BqDoUhNdhRm3Jm3/Pn2zZRko6xBRZf7T0cY=;
 b=yscGhPPuFNizjhZyfckOyB+CAo1jJWREaGY1if4rTc5GQmLkrB/AO7dtNYBDWsD86P
 j9Xfeq3FyREWo68CEYabJTGNn9N8I1Hmho9FPrA6iabtRaSTmt5zRPAxD9bCPYBbDz0Q
 nDwVbmYf3UVAtKWpohEaylINflRMM8hyKiV3wieNHv6m+OD9VcbJ6VDjbsKLhCTLzVeZ
 ZvmwytmdH0ht+xgrzNBmT8BdI74UqnqqSYCPnK/NArPwR92o1GVEKSST+CI2lzIbhopN
 PcGQz5JYzZGv57s6+axqpwhHZ9m+pjD8OAwysprJgU0LZ8mQDEo3kagMHbBOrdDEdn1d
 URvQ==
X-Gm-Message-State: ACgBeo3CAM9Rv3seiCOpn2KyJhU+nlpkSI0+TRfadaW04Vf4i32MZcps
 iGg/udBwMbBaGjmLqsN5hHNyfDlTvtmYuZ2eI1yKRivp
X-Google-Smtp-Source: AA6agR6v7ldZNctMjoJOufJOZAdU1dEOul0AXMpChT0zjKcIlDOKa31Bidy9nFfaT6NZ2J1yROkNQHIq+aobqUItSvw=
X-Received: by 2002:a63:fb4a:0:b0:429:8605:6ebf with SMTP id
 w10-20020a63fb4a000000b0042986056ebfmr7944702pgj.225.1660715868091; Tue, 16
 Aug 2022 22:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220313171355.271345-1-james.hilliard1@gmail.com>
 <20220803233856.3d609d8c@windsurf>
 <CADvTj4r9D=kUa-N+HC2tVTt7Oxna=ZMSp-H5POaYzE2DsXCD-w@mail.gmail.com>
 <20220804095907.4b22adc0@windsurf>
In-Reply-To: <20220804095907.4b22adc0@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 16 Aug 2022 23:57:35 -0600
Message-ID: <CADvTj4qpEheXiMVYCBgLL-8k8_inRHO+bCcGDsmr=F6_7DQT7Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=6mygda5+BqDoUhNdhRm3Jm3/Pn2zZRko6xBRZf7T0cY=;
 b=fGcj8T/agokWL/CsiuycmDRsAJXju/cQCmAJ1VMAZjIBBT56XTLD72iFXm8GdhmFDy
 TlOIq0TZV+knXJwi2HVfJh2Ga3J3gtih8IwsffKNz4zqssMYwNyF7kZNaNrj1xeJNPwS
 dtBGOgwoBQRAaZ8YUEIKdMvvTelaJL3WTLiA6kgG64yuorFr3ephFnGC1vU+chfZFU27
 fT7dsllT71e5zVS4GwEQFrfDjju/tzK8VSVzwfT0K40Lw85YV+IeD6DK+uVBorrkAlbl
 qG3eYqCPDAanRLJp6y0rg5iHJet8z+p/aNSeRlH909sEO1rqVEKlwtb3NhG1ak1o5wRh
 uEVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fGcj8T/a
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

On Thu, Aug 4, 2022 at 1:59 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Wed, 3 Aug 2022 16:02:43 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > > If I understand correctly self.tmp_extract is where the Python package
> > > source code is extracted. So if you remove it at the end of
> > > load_setup(), how will your new load_pyproject() added in PATCH 2/2 be
> > > able to use the package source code?
> >
> > We're not deleting self.tmp_extract, we're just ensuring we current dir and
> > sys.path states are cleaned up properly on failure, load_pyproject() does the
> > same thing. Always restoring initial state at the end means load_pyproject()
> > doesn't need to deal with current dir and sys.path global state changes induced
> > by load_setup().
> >
> > >
> > > Also, why is this removal needed, as anyway the full tmp_path gets
> > > removed at the end of the main() function?
> >
> > sys.path.remove(self.tmp_extract) is not the same as shutil.rmtree(tmp_path)
> >
> > We're restoring the module search path at the end to avoid leaking global state
> > changes when there's an exception.
>
> Aaah, yes, my bad! I guess I shouldn't have reviewed this past midnight.
>
> I'll go ahead and apply PATCH 1/2.

I'm not seeing this in either master or next yet.

>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
