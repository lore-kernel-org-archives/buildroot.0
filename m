Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC1DC3DA79
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 20:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9AD74032D;
	Thu, 29 Dec 2022 20:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9AD74032D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eYQc2JICAyEB; Thu, 29 Dec 2022 20:43:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCDA44031F;
	Thu, 29 Dec 2022 20:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCDA44031F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BCA8B1BF386
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 20:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4F24607F7
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 20:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4F24607F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0rCbXRSnlRll for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 20:43:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90945606C0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90945606C0
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 20:43:08 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 j8-20020a17090a3e0800b00225fdd5007fso10297831pjc.2
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 12:43:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+eHAUzsklZUyDQLm5mewiLG/CgA0+zw838SID3fiB9c=;
 b=oiV4Dew1dc0d8XdC/jiYI8m4473yGpcpFmPeQ1DN6yKtC9xxZO3Z9mQn/VGcnSI1h8
 hMVVOQtRZlQNOOLh4RUjcDBoG4fUMuHLasUm6ipw/y7QJIyOu6rCX3f5f+xRWX/+7dp4
 KgaNMEx7QJ+/gTtNmIrgFenFEWsfyLPRQyI+8r8dz2E4yLy6oZyvR5MJuB78IUDd9QTx
 rwxRNNDnUpr6afabDFvq4dr8MnmLsSJ4+yj4davdRzQlWFNfTTY64DRzOSPtREW/15nI
 fPoCr9Aw3zmUMC7RUnm6vYf4la5HwFsNZNIfk7E23LrnaeSuDcJjg7i3QT6xSDEW3AEH
 fbrw==
X-Gm-Message-State: AFqh2konB+RUE/jinucpeiYP/Am8Ab34yqLXTXYMJjWP4sv9nxbflYLZ
 1btnEl/d+Dz5xGACKGm2lcPdFA4auU/OgGjuB3vTE4Mm
X-Google-Smtp-Source: AMrXdXsNEPcysoXzlh9BwaAcXzltvyZqhtV/ugxyZa885r0wgYZpR2fpMzUu8HS4VPToNj66wTuEiiAQJvXDTS7bj7I=
X-Received: by 2002:a17:902:9342:b0:192:607b:f67c with SMTP id
 g2-20020a170902934200b00192607bf67cmr1385280plp.55.1672346587759; Thu, 29 Dec
 2022 12:43:07 -0800 (PST)
MIME-Version: 1.0
References: <20221229194729.8085-1-ju.o@free.fr>
 <20221229200830.12305-1-ju.o@free.fr>
In-Reply-To: <20221229200830.12305-1-ju.o@free.fr>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 29 Dec 2022 17:42:55 -0300
Message-ID: <CAOMZO5DOU=gegnHCExXD_PZCG1C5vDd_JmEXA4sN8CXvG3qm3w@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+eHAUzsklZUyDQLm5mewiLG/CgA0+zw838SID3fiB9c=;
 b=lfSk9S9t2uXujTejHe57ur5ncSEreltbzkPdaiW35igc43WWqF5zPHCvlTJXscYEiK
 bbmKNsEU99pMH54tflb3iWQn6Ox/VNSTxppROWJNPShUY2ERyjr/QOX4vVZD3Fh4lTRh
 CxSuFQg1XDq5S9sDbfzEVTMGliAyxFmdCpI6FxMZGU+FUrY1vEAjdf+1XVmmS21N/SbF
 hdF59bfSDsr2IMOii4MEhsvKXuLEisUrRkKrxe0P+3qHwBbMN44y8fWIVRKvmK4/LGFJ
 8OCyDaWLtu3DAiy/Az3aBgiRobk/pqyqN2+LbUNI7NJP6w0JNRxfzQoocyHCSdcxtseW
 Dx2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lfSk9S9t
Subject: Re: [Buildroot] [PATCH 15/27] configs/freescale_imx6sxsabresd:
 update codeaurora URLs to github
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

On Thu, Dec 29, 2022 at 5:09 PM Julien Olivain <ju.o@free.fr> wrote:
>
> NXP moved all its open source code repositories from Code Aurora Forum
> to github. See for example:
> https://github.com/nxp-imx/meta-imx/commit/39bc4d81969a40e0da660519cf4ed083b9c53097
>
> Software packages are now grouped in several NXP github
> projects/organizations (nxp-imx, nxp-qoriq, ...). See:
> https://www.nxp.com/design/software/embedded-software/nxp-github:NXP-GITHUB
>
> The NXP code published on Code Aurora is still present (at the time of
> this commit) but is no longer receiving updates. It is also expected
> to be shut down on 2023-03-31. The Code Aurora website
> https://source.codeaurora.org/ currently show the following message:
> """
> Note: Qualcomm Innovation Center Inc. maintained repositories have
> migrated to git.codelinaro.org. QUIC repositories on this site will
> not receive any updates after March 31, 2022, and will be deleted on
> March 31, 2023. If your project depends on these repositories, please
> adjust your tooling configuration to use the new, up-to-date project
> location.
> """
>
> For this reason, the NXP recipes using codeaurora.org urls need to be
> updated to the correct github.com replacement.
>
> Note: this commit does not change the component version. Only the
> download URL is updated. The archive content is expected to be the
> same.
>
> Note 2: this commit updates the Kernel and U-Boot download urls.
> The method is also changed from _CUSTOM_GIT to _CUSTOM_TARBALL.
>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Thanks for the patch. This is good information that I was not aware of.

Reviewed-by: Fabio Estevam <festevam@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
