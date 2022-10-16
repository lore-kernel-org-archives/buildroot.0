Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA82C4332F
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 04:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81BA8819ED;
	Sun, 16 Oct 2022 04:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81BA8819ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pdgkwxk8Q53B; Sun, 16 Oct 2022 04:50:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CAAD818A1;
	Sun, 16 Oct 2022 04:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CAAD818A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F19AF1BF3DB
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 04:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC180410DC
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 04:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC180410DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L3aFDGSlUjxV for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 04:50:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FB85410D1
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FB85410D1
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 04:50:20 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso9587311wma.1
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 21:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MdDVC+tcTqwnZa+IQEtlDcvf/V4RbZb7O76qiOiQlp0=;
 b=1SSzK5WA8ZXTB+C/G0SSz5JTtfnI95NVteYEHwNYOnm5k8841o57hV1CSQxkiDKk69
 EwzRrnVOgFnkCfVN0VDoX+Ph4qEzAPAahiWB/VNPs9zHHWwRtMuYfM0b3t0x/CJtgLkS
 w4CzKuH2Jy1UK5VwM90bHL3q6dQEcFtUPVKO8M36C8Izwn4U9yOXYetPjaIYQPycTg10
 Q81hKTJbgVH/768jWMwPrkHmITtm95E1ZbWwOMdFCaTJineeZJsmK119Lh6RyoTmZV2u
 WWyd/1mob20Brhp2dwS8wg2Vuj4NzY2ZGsYw2qtTh4Pi4/8WQtd9yn0bnGmz+yCblS4o
 kmKg==
X-Gm-Message-State: ACrzQf0zZSsxVDxeWA7P6obEGbfVxR56pHhR1MZEVlP5T+mx6/qsd80q
 V+AhjV7c2GcfHO5xunuunJmjlHItJudIOU8qukc=
X-Google-Smtp-Source: AMsMyM5fBoHgALsX9yB9EefPW1t4fERjm+OWN6fQre3ujws/SjUHFhIqCemld/4pSE7HN3gHEdk5L+yama0OQPffeh0=
X-Received: by 2002:a05:600c:1d97:b0:3c6:bc3c:9890 with SMTP id
 p23-20020a05600c1d9700b003c6bc3c9890mr15848171wms.190.1665895818456; Sat, 15
 Oct 2022 21:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220913072303.1698887-1-joel@jms.id.au>
 <CAFOYHZCq7rxRzwAQXT=AjQAeAFY5CROmczWoZ6ZDZk7rWe2-qg@mail.gmail.com>
In-Reply-To: <CAFOYHZCq7rxRzwAQXT=AjQAeAFY5CROmczWoZ6ZDZk7rWe2-qg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Sun, 16 Oct 2022 04:50:06 +0000
Message-ID: <CACPK8XeZ1Qp0BxNU5=rW3gXm+0oDdxJ=eAWLG90da6iPpjYu3A@mail.gmail.com>
To: Chris Packham <judge.packham@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MdDVC+tcTqwnZa+IQEtlDcvf/V4RbZb7O76qiOiQlp0=;
 b=Q+Oawd18GH4uFC7WUW2/sWUZWejk2k2+gIXiek7TlliI4pue6PjvENeSynUG6XURL4
 sUE8H9gcDbiwoDd+Ww3fs+YlZFSYr3NS7Nfx3c8SZg7JTWqQtMYDLGr400GBE8aTZc/J
 TZJxCxcsMgE0sU0QV/w9WQ8SGLSVr9GxG+I9E=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au
 header.a=rsa-sha256 header.s=google header.b=Q+Oawd18
Subject: Re: [Buildroot] [PATCH] package/coremark: Set cflags
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 16 Sept 2022 at 05:03, Chris Packham <judge.packham@gmail.com> wrote:
>
> On Tue, Sep 13, 2022 at 7:23 PM Joel Stanley <joel@jms.id.au> wrote:
> >
> > The coremark build needs to set PORT_CFLAGS explicitly in order to pick
> > up the configured optmisation level, and other flags.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Acked-by: Chris Packham <judge.packham@gmail.com>

ping

>
> > ---
> >  package/coremark/coremark.mk | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/package/coremark/coremark.mk b/package/coremark/coremark.mk
> > index 418fd5c8d39b..9ea8693e7189 100644
> > --- a/package/coremark/coremark.mk
> > +++ b/package/coremark/coremark.mk
> > @@ -11,6 +11,7 @@ COREMARK_LICENSE_FILES = LICENSE.md
> >
> >  define COREMARK_BUILD_CMDS
> >         $(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D) \
> > +               PORT_CFLAGS="$(TARGET_CFLAGS)" \
> >                 PORT_DIR=linux$(if $(BR2_ARCH_IS_64),64) EXE= link
> >  endef
> >
> > --
> > 2.35.1
> >
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
