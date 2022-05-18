Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C11C433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 02:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A0A08400C;
	Wed, 18 May 2022 02:20:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HFcFGpgH176L; Wed, 18 May 2022 02:20:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A82B82B1A;
	Wed, 18 May 2022 02:20:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7BBA51BF41F
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 02:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6927141883
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 02:20:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PkzrRWa-7Rv1 for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 02:20:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D33EB41882
 for <buildroot@buildroot.org>; Wed, 18 May 2022 02:20:09 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-f1d5464c48so979047fac.6
 for <buildroot@buildroot.org>; Tue, 17 May 2022 19:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cyE8FnYHCUJEirNYBcrXF07VFyx2IctfZrTHYXF29G0=;
 b=WcvnOuYPucGXdvdtkyZfhfJ+XREy1n7FtNJYZk57OLWWBlYxSNAff+9istXewYgv2b
 oI6sIQDS28hQKdk4Chfi5ZFl5k9rinYTZTY+aP1hCSjWi58MFSaUDfHj2jXcW3BoGtQv
 RMxJpRTx6xIjWdHav15V/PrngEt+g8iCXzVbQcaYUzMcTFm45IlRW1oTxnZNwa6bADlF
 kUzvaCHDiq9b6Nrm1rgxkT2vcn0km31Aq0sC+PSTwyEce7mmfNm1mU/1uF1Nj1zugEdQ
 onm5HPykzrxQuMc/XFlHK2lAetjIFS39tbQ2U56nvgq0DVr6NDAXNAXqSN7Kv5jkKX+1
 /tMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cyE8FnYHCUJEirNYBcrXF07VFyx2IctfZrTHYXF29G0=;
 b=768+nretI3UYUfB4oUujXL7ikUxMSXm28Z2UP2kxPfAOb4VVXoKnVHA40Hi8eUEpFn
 hXaj6Au/6eXRbI4KqTzHIIXWDCUsCdUkZsxYEv/llMj1j2oVFl4gbEKxtjpzPw086oiF
 kgQ5ikvnivwxvIxIRsj4a13pmC6iWPC/rtyEAqS3EX2JXvL8P4bp2Fm22NYXA5GYADan
 Z8YjNXZoAJ2ls9XelEqXircvu70HrulkhzcViLDXxwhduKWCI/lARXFAzMQC8OVEPZ+E
 BAexYnu2F3ARxC4lhpPUCGHcHJieldI3pDbS4aJpBcrMGfLcbivy92d5PFtF/uBwfGcs
 14ew==
X-Gm-Message-State: AOAM532KyM0D0VReTA9vEx116fE3ykDNaA0AZ7d5zYBK31yl5LXoqmfe
 80UOKN6khRsBt4i8CZ/oBGMnZ4aUDjSTZFi1dR671bIf6Rg=
X-Google-Smtp-Source: ABdhPJz1gYvfDJHjaBHDPMy/nawzrqo355XLsTc0g0N5pO8CxfYJmG8XiAZlayDygsicUfUDBgiIJRFkksxhIBuxE/8=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr19063934oaa.200.1652840407246; Tue, 17
 May 2022 19:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220215015307.855341-1-james.hilliard1@gmail.com>
 <20220215015307.855341-5-james.hilliard1@gmail.com>
 <f0607b08-10e0-6cf6-acbe-fbadad8e1722@korsgaard.com>
 <CADvTj4qtBNwvZw66NPhoKRLsKkJQjqFb9tMo_4qyi-B+GThDxg@mail.gmail.com>
 <87r14s40wu.fsf@dell.be.48ers.dk>
 <CADvTj4ohuiV+Ks3inWUiv9c-W+JT1obTHkUAEp4om6BQ2P4dUA@mail.gmail.com>
 <87mtfg3pi8.fsf@dell.be.48ers.dk>
In-Reply-To: <87mtfg3pi8.fsf@dell.be.48ers.dk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 May 2022 20:19:56 -0600
Message-ID: <CADvTj4ra_2eQWYtGA_P9sF2DA4ATCmRfmFc6AEDVwj1-wYOL_A@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH v8 5/5] package/qt5/qt5webengine: bump to
 version 5.15.8
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
Cc: =?UTF-8?B?R2HDq2wgUG9ydGF5?= <gael.portay@collabora.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, May 17, 2022 at 1:53 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
>
> Hi,
>
> >> > I think patch 4 was needed for fixing some linker issues with pkg-config
>  >> > resolved dependencies like icu.
>  >>
>  >> That unfortunately seems unrelated, because the build fails with the
>  >> same error here after applying patch 4 :/
>  >>
>  >> From the command line passing -m32 to HOSTCC, it sounds like some cross
>  >> compilation confusion to me.
>
>  > Yeah, I recall there were a bunch of issues related to cross compile confusion,
>  > guess I had missed this one, although I was mostly testing against aarch64.
>
> Yes, so there might still be some patches neeed.
>
> With that said, it is still better than the current situation which is
> completely broken, so the best way to make progress is most likely to
> apply it.

Yeah, I went ahead and bumped the other qt5 packages which might
help fix some issues:
https://patchwork.ozlabs.org/project/buildroot/patch/20220518013424.2558229-1-james.hilliard1@gmail.com/

>
> So I'll do that, thanks.
>
> --
> Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
