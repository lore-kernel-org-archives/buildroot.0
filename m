Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7BDC433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 02:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2AE941525;
	Wed,  4 May 2022 02:02:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cImn78jINmQc; Wed,  4 May 2022 02:02:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C7B9408A4;
	Wed,  4 May 2022 02:02:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E5BB1BF33A
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 02:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69999408A4
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 02:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p35c-NWKKNy4 for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 02:02:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D7BD408A2
 for <buildroot@buildroot.org>; Wed,  4 May 2022 02:02:41 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-ed9ac77cbbso8403151fac.1
 for <buildroot@buildroot.org>; Tue, 03 May 2022 19:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nf6aiudcGIRSHqh42PXB6W96JDkFF6Ol3okfnew1L9A=;
 b=fA0YvISSxtM2ujy7cVvOgD9M/0fHF5krooHDUQnXFmfvlEKaEbHl9ZvaxD3I4YBQVx
 XeEC+LDOCWevvp6yO0rFbwlAdf3zM2ivsCecTUvo8v8YGTSAhBnkGH82s65s9Y/0aDQx
 GP4VCkgAs+hTNM+nQQc1zoyAUlqG6BB+lHnyYbQp29p0WaBVHYsZizT+7bhV8RjQJZUk
 8wG7h+gsqzUzh1IyT/GVbbtoW9lYREx3iNFy5dvBuoCAzRtkFmyHZAAtlhFc3BSEb3M7
 TKLq42jkbLYF0vfI9gL//VjARowsLBwrOmqZAM0xr3Ieo7jyw1Z9YjRtoCXdEy6FRdax
 8mhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nf6aiudcGIRSHqh42PXB6W96JDkFF6Ol3okfnew1L9A=;
 b=ZT6Yx61Y0yxBltOjHYBlgnv5cG9sJGWh4X7Ep1PgLwSfKi7YPI7vnJvkfexRfH5f5k
 2Ehai8/do4CYXabiHWQYoOdI9lHw7qsR07tIae6LX6ksOf44Y9q905vZ3my0VzAbnJBi
 Zo8ZIu69/objghN+HrT1Osl++J29tDHipZb/UOONQN7RknwgvCOHMH9l99Uw6AYE4JUR
 yEjmJgF9i4IhHMtCcjsMjjjhyDsaQhoIiY2hp19fxN0jZnYEPsYg2s0u+uHX/N+vHyNC
 /+kcvofoEzseBww9fa0alV3E+uAM9qENZX8JKubmrKL0+fmMDr6Gz5rsNfWox3tIBoQC
 N2HQ==
X-Gm-Message-State: AOAM532Mxtjx3qHDiHJXJetPDFpO3QY2LWgq/k9tcEgseOoRPfXR1UgI
 1ZXsKCFEyuuPds7UfiYTSMFRSkDPy63kFthtQ/USFtEYzn4=
X-Google-Smtp-Source: ABdhPJww/SYn4TGae6o5C74I25DwJto64Rm9hgE7WyGZMr3EFp7E4cVU2nvj+Y2Qf/Psq2qWISMC1buc+Wy/gc8y568=
X-Received: by 2002:a05:6870:9729:b0:ec:6f64:1e5e with SMTP id
 n41-20020a056870972900b000ec6f641e5emr2956731oaq.99.1651629759917; Tue, 03
 May 2022 19:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220503023117.266256-1-james.hilliard1@gmail.com>
 <82d1991b-48c4-c767-dfe3-b28264eca4d0@mind.be>
 <CADvTj4qXE3v_OrFT7m-M0qWnV7L7Tfa5eeM=7idg-Fpi8S_Afw@mail.gmail.com>
 <de87d7cd-45d4-1dd5-578a-c61c59ae7c09@mind.be>
In-Reply-To: <de87d7cd-45d4-1dd5-578a-c61c59ae7c09@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 3 May 2022 20:02:28 -0600
Message-ID: <CADvTj4pM2JJjuOigR8W5UnNxFFm2qgz+aY4JSvF5YdC_5q+qpQ@mail.gmail.com>
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

On Tue, May 3, 2022 at 2:29 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 03/05/2022 13:16, James Hilliard wrote:
> > On Tue, May 3, 2022 at 12:41 AM Arnout Vandecappelle <arnout@mind.be> wrote:
> >>
> >>
> >>
> >> On 03/05/2022 04:31, James Hilliard wrote:
> >>> If we don't have a DTS name or path we need to also disable cuimage
> >>> to disable DTS support as BR2_LINUX_KERNEL_CUIMAGE requires DTS
> >>> support.
> >>>
> >>> Fixes:
> >>> linux/linux.mk:591: *** No kernel device tree source specified, check your BR2_LINUX_KERNEL_INTREE_DTS_NAME / BR2_LINUX_KERNEL_CUSTOM_DTS_PATH settings.  Stop.
> >>>
> >>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >>> ---
> >>>    utils/genrandconfig | 3 +++
> >>>    1 file changed, 3 insertions(+)
> >>>
> >>> diff --git a/utils/genrandconfig b/utils/genrandconfig
> >>> index 70af84f002..b821e60114 100755
> >>> --- a/utils/genrandconfig
> >>> +++ b/utils/genrandconfig
> >>> @@ -381,6 +381,9 @@ def fixup_config(sysinfo, configfile):
> >>>            if 'BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n' in configlines:
> >>>                configlines.remove('BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y\n')
> >>>                configlines.append('BR2_LINUX_KERNEL_ZIMAGE=y\n')
> >>> +        if 'BR2_LINUX_KERNEL_CUIMAGE=y\n' in configlines:
> >>
> >>    Similar to the previous patch (only fixup host uboot tools ...), should this
> >> be done only if no DTS is given? I.e.:
> >>
> >> if 'BR2_LINUX_KERNEL_CUIMAGE=y\n' in configlines and \
> >>       ('BR2_LINUX_KERNEL_INTREE_DTS_NAME=""\n' in configlines or \
> >>        'BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=""\n' in configlines):
> >
> > Should be ok already due to parent match conditions covering the invalid case.
>
>   No, what I mean is: it is only needed to remove the line if DTS is not set. If
> either DTS_NAME or DTS_PATH is set, there's no need to remove the CUIMAGE config.

Yes, that's exactly what this patch does AFAIU, see parent match
conditions here:
https://github.com/buildroot/buildroot/blob/49f9a08223005584ca28c6f243ee5cb1d1e64f57/utils/genrandconfig#L377-L378

The BR2_LINUX_KERNEL_CUIMAGE removal only happens if both
BR2_LINUX_KERNEL_INTREE_DTS_NAME and BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
are empty.

>
>   This is similar to the patch you submitted for
> BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE and _SCRIPT: they only need to be removed
> if the corresponding _SOURCE config is not set.
>
>   Regards,
>   Arnout
>
> >
> >>
> >>
> >>    Regards,
> >>    Arnout
> >>
> >>> +            configlines.remove('BR2_LINUX_KERNEL_CUIMAGE=y\n')
> >>> +            configlines.append('BR2_LINUX_KERNEL_UIMAGE=y\n')
> >>>            if 'BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n' in configlines:
> >>>                configlines.remove('BR2_LINUX_KERNEL_SIMPLEIMAGE=y\n')
> >>>                configlines.append('BR2_LINUX_KERNEL_VMLINUX=y\n')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
