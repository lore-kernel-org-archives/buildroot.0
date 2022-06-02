Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3071C433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Jun 2022 05:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A15782F03;
	Thu,  2 Jun 2022 05:07:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NCJarJPu__xQ; Thu,  2 Jun 2022 05:07:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DB8D82EAD;
	Thu,  2 Jun 2022 05:07:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29D4F1BF865
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 05:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18BA340328
 for <buildroot@lists.busybox.net>; Thu,  2 Jun 2022 05:07:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OYYutCHGsNw2 for <buildroot@lists.busybox.net>;
 Thu,  2 Jun 2022 05:07:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4BAC400E5
 for <buildroot@buildroot.org>; Thu,  2 Jun 2022 05:07:01 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 h62-20020a1c2141000000b0039aa4d054e2so4167062wmh.1
 for <buildroot@buildroot.org>; Wed, 01 Jun 2022 22:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SVXCoCdLGMFXgW5dMWXyMIXYtqcMtrDXPj3jnz91O6Q=;
 b=abMPy1y+Xo7vBE8JaJUdnDivRzkOxkfW/rH1VAWVfKPTvdVW9j5HI5vjqJan9LVUhN
 fxB0QGxTN1FZ1Zkj7fyvdYm8Fc5sB2lSRix+qN52rZBznDiA1bnX9EKNUfJmeef4wn8e
 OBVvIw0xYlZPOfep8SOgt8V6ZNIus/Pb67klz5xrkPDyFkN3ob7KZg/NhRmAlMqKN/ML
 PGrEhOBkHMQUwt8jEmy5PGDyWI29i46ZcmqIaZ0ophyGCQ24hi2l6pDwDcU4RH5cRCdA
 /B90Z/1fuupFv/NVpCXFYn1l67Uv7FUV7qU5HrV8Qh3vXb6wg/h/bafpA15VdSp8kd9l
 1IzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SVXCoCdLGMFXgW5dMWXyMIXYtqcMtrDXPj3jnz91O6Q=;
 b=cgJmMEMYnyvkiIbzXXZqgpQt0UJEAoc1e7U+SOUd8l4pRa+hMxPtP3jUE3zG+6c4++
 8wxdQJT7a/1dM3+hyZ0xgfaabmw6j1NnxaEGNRgRpRXCdU3tTfHtXTRxMERG4q+F6p+7
 xLBAB+F0SUn8v4/uADjsaX7tiWdfWIU1pkCwge/1VSwYAM2gtm7t7YEIy32DfH+HpUzJ
 B9CK3MrSFp3/riEvTqBttkiAFbo+Xnih/Rx389YnLZ0JCITH8+LEPvO7ry4Ii+6Pg9+g
 nnp8CctkE0OtlPf8q/UsizXc1DeJ6knYHHcS+bE85X5A6jPYDva22F4J8JMMMal+q7a5
 Wy1g==
X-Gm-Message-State: AOAM5302VVytHqmjd/g7PU72V9eHc/eSWI9uBOobmlGbxsF0upn1jP3T
 euOfZgOADGqX0C3a4wLJexHOLaevi2FsETWyAvTtvE6i
X-Google-Smtp-Source: ABdhPJxfdA3+DhTa44cGmDZQoRYNX98kp61DqoAXse7Ol0yHXpKJO0zaTN3yChpGrthkB+3WeHs3PqnibyRZveewLv0=
X-Received: by 2002:a1c:7207:0:b0:397:66ee:9d71 with SMTP id
 n7-20020a1c7207000000b0039766ee9d71mr2350287wmc.8.1654146419585; Wed, 01 Jun
 2022 22:06:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220531105902.204022-1-heiko.thiery@gmail.com>
 <20220531105902.204022-5-heiko.thiery@gmail.com>
 <20220601234310.2a956189@windsurf>
In-Reply-To: <20220601234310.2a956189@windsurf>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 2 Jun 2022 07:06:48 +0200
Message-ID: <CAEyMn7a2tSRXqbdmH2Kcc20a8o22+NLg6ch3bFfU6+E+042uwg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2 4/4] boot/uboot: bump to 2022.04
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Am Mi., 1. Juni 2022 um 23:43 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello Heiko,
>
> On Tue, 31 May 2022 12:59:05 +0200
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > Since U-Boot 2022.04 a host dependency to gnutls is required if the
> > U-Boot board configuration has CONFIG_TOOLS_MKEFICAPSULE enabled. So
> > introduce a new BR U-Boot config option BR2_TARGET_UBOOT_NEEDS_GNUTLS to
> > solve this problem.
> >
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>
> I've split this into two patches, one doing the bump, one adding the
> new option.

That makes sense.

>
> Regarding the bump, you had forgotten the update of uboot.hash with the
> hash of the 2022.04 U-Boot tarball.

Damn.

> Also, there was a minor check-package warning related to the formatting
> of the help text in the Config.in file.
>
> So, overall, applied to next, with the above issues fixed. Thanks a lot!

Thanks for doing that.

> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
