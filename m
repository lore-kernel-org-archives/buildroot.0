Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D937C433EF
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 11:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABDCC404EB;
	Tue,  3 May 2022 11:16:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4IgxldalG_zn; Tue,  3 May 2022 11:16:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7B8E401A4;
	Tue,  3 May 2022 11:16:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F17A11BF5AA
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 11:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF2A1401A4
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 11:16:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E7j-IgUY1NHY for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 11:16:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44A3C40169
 for <buildroot@buildroot.org>; Tue,  3 May 2022 11:16:34 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-e9027efe6aso16816592fac.10
 for <buildroot@buildroot.org>; Tue, 03 May 2022 04:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iX2Sy8vry2TgNCz0sZmKL59H3Y+0EhFUCWorTZ9giss=;
 b=Rnx0bHw37cB2X8JH5XWfUt4D+qSraAT4/gglStZ/lhlw2vkpiMRlCDXQ1+XJac16C9
 cssXPeBaaBNlNRiqu8mdmvDKQjKDhEPdVJHesEE8YdiIt7cLadeMYk8+CLLPMvSNNCVH
 kmZmtP1KKETeSPMaJYTsPZFVnb12JuKylJcogZIuEjNIULOZpBpGPbb7K0uLlGS6FWAv
 vRxfrMImc6SKTaQzPPRGv+kSAinIq5jC4/ElKnXMFIYPaoCRaChwfFrcDDXmx+/awBYb
 ai8HPEnq5YGScvcaVvso6OyCOyiu5UCoqksPw8TZ/frGdeNzQpRnPWG1KIa56CyPL44I
 N3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iX2Sy8vry2TgNCz0sZmKL59H3Y+0EhFUCWorTZ9giss=;
 b=q6oB4Bgr9IQDHKneC4sPbQU34m1vqSLlHsa+yqzKjmg/5l5aAtGFcJr2D0l/IlXNZU
 hWE4Pi/a1IwTzR+qXBg7UpcapCZQN3fynH9XIhr5daW8CZLqTmiEYClQT/akIT9Xhpz8
 yu6gHXTCQ2umCpLjWSPKju5ecouwk5RvMmYebGagzf8IgEvmkRcIDUwAmwaflVOmHuT9
 a5i4QCBDlmZP8aBTnFFZG5tBOnKGwDb9KvFkPSXVpySYPD4gwWL/RtPoyZSbyLuzWv3K
 2AyBVJgmYy4qR1mZlusE8Op4BIwvCyUGt+y++zoh+4fWJ9tLQuRJsVOPKQc3fbxTMVeW
 8ltw==
X-Gm-Message-State: AOAM533BBxKKeKeVItVhTXtq3H5u1lvYBl8DpN+vBvPaokGrAAexJxJa
 17bueAOrpIc0FpVMOx1BGLIAZef0udE54fr4WZfOHbL7
X-Google-Smtp-Source: ABdhPJzs59xXOMa5FeK+56KNk/Ri4Y3G+lBZlfSpXILasfhens470lqaDbjQ3tPTkztU5+BN3WrycwUU/YI+vmZLuIw=
X-Received: by 2002:a05:6870:9729:b0:ec:6f64:1e5e with SMTP id
 n41-20020a056870972900b000ec6f641e5emr1493766oaq.99.1651576593004; Tue, 03
 May 2022 04:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220503023117.266256-1-james.hilliard1@gmail.com>
 <82d1991b-48c4-c767-dfe3-b28264eca4d0@mind.be>
In-Reply-To: <82d1991b-48c4-c767-dfe3-b28264eca4d0@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 3 May 2022 05:16:22 -0600
Message-ID: <CADvTj4qXE3v_OrFT7m-M0qWnV7L7Tfa5eeM=7idg-Fpi8S_Afw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: add DTS cuimage
 fixup
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

On Tue, May 3, 2022 at 12:41 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 03/05/2022 04:31, James Hilliard wrote:
> > If we don't have a DTS name or path we need to also disable cuimage
> > to disable DTS support as BR2_LINUX_KERNEL_CUIMAGE requires DTS
> > support.
> >
> > Fixes:
> > linux/linux.mk:591: *** No kernel device tree source specified, check your BR2_LINUX_KERNEL_INTREE_DTS_NAME / BR2_LINUX_KERNEL_CUSTOM_DTS_PATH settings.  Stop.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   utils/genrandconfig | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/utils/genrandconfig b/utils/genrandconfig
> > index 70af84f002..b821e60114 100755
> > --- a/utils/genrandconfig
> > +++ b/utils/genrandconfig
> > @@ -381,6 +381,9 @@ def fixup_config(sysinfo, configfile):
> >           if 'BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n' in configlines:
> >               configlines.remove('BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n')
> >               configlines.append('BR2_LINUX_KERNEL_ZIMAGE=y\n')
> > +        if 'BR2_LINUX_KERNEL_CUIMAGE=y\n' in configlines:
>
>   Similar to the previous patch (only fixup host uboot tools ...), should this
> be done only if no DTS is given? I.e.:
>
> if 'BR2_LINUX_KERNEL_CUIMAGE=y\n' in configlines and \
>      ('BR2_LINUX_KERNEL_INTREE_DTS_NAME=""\n' in configlines or \
>       'BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=""\n' in configlines):

Should be ok already due to parent match conditions covering the invalid case.

>
>
>   Regards,
>   Arnout
>
> > +            configlines.remove('BR2_LINUX_KERNEL_CUIMAGE=y\n')
> > +            configlines.append('BR2_LINUX_KERNEL_UIMAGE=y\n')
> >           if 'BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n' in configlines:
> >               configlines.remove('BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n')
> >               configlines.append('BR2_LINUX_KERNEL_VMLINUX=y\n')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
