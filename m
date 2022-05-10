Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EA3C433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 15:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B28340AE9;
	Tue, 10 May 2022 15:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8_tPacjFk5Fb; Tue, 10 May 2022 15:21:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78B4D40B07;
	Tue, 10 May 2022 15:21:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 162221BF2C9
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 15:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03DC0416D3
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 15:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JDQH3pg3T223 for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 15:21:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42153416D0
 for <buildroot@buildroot.org>; Tue, 10 May 2022 15:21:00 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2ebf4b91212so183518267b3.8
 for <buildroot@buildroot.org>; Tue, 10 May 2022 08:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AuwrCS+KpGXW/1aSIgnqfrC6Ge7hii8KOjWYGh4oJuE=;
 b=hcj/m07/+v9/wNcF1jHKNWWZiqezbSax4AnrHFdi8rlL3KVC7HvB9OyHgejLl6Fv1V
 Av6szVQMxlN90rM8u58ZDb3C2K/idrEejG1I8ikpiKyiU0XoRmkiuhQF6OsSAGCTxTDW
 AwyQbAmda67WwCwy8sGIvHmSSYvYwbio3iP1SN9qXOvQre/cGTiOREEdw3P+cN16PxlM
 mglzt/ie51oTAXYNJNRsQctuB3tdwlzybzF+s7hsUBboa0m9VoQ6DTh2esCTXgKyXZ5b
 8wdeweO2ZfxGkO6YKuxdU1hF/bvbFt2KyMH4qeXMjuXKbCxY7qoY/IDVuX3Vm1O6APJb
 z2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AuwrCS+KpGXW/1aSIgnqfrC6Ge7hii8KOjWYGh4oJuE=;
 b=rktsVFyZTnDgxJ0WWh6ydWTM2k+YGKGJzglkYtBnoXSlelhFrKCEyddmiLj6cYAqQ7
 wRObeinO3FXY1aJEyckGWhKRG4HeDOA/IxttCBc6z4+3xBf7cyi4RFV3kOF74BqEAZtF
 dAg91UAKXBVtk2sMpDwWq6hG2mwLO1ua52jV2eDV1QThD0OcOyyFIeUf5rFFWZVOv8OP
 DL16eSgCh8ILgh+Vo/JRN7MAqhTBX5Bpb+WYRA7F3XJbHMyieVFqE/LrjQTQafBFK74T
 vlmiBmfrS4UHUaYw8+5Ec8M+dQcWO7VefUtUGmR2DBl+KcB7pezhADSNdwDSSCAns4Xv
 Bp6A==
X-Gm-Message-State: AOAM531rsYVofq/sLsv8Hlpg3OJVhgIW6XIt1sW6N+2Ooi4CiCJlK72M
 2pc5Duw5SpXvgjiH2UN6r+nGo+U6ft2DdXJqhTpbazf7ahw=
X-Google-Smtp-Source: ABdhPJzw/Ld29gUDi0jHcX+LkKhWxWq/FS74EXuHiPKE2SvlUgB7Q82lom3c2zcr7QUoI2bJlfBHeeBpFb/C165EnhE=
X-Received: by 2002:a81:7dc1:0:b0:2f7:fde5:1ed9 with SMTP id
 y184-20020a817dc1000000b002f7fde51ed9mr20323006ywc.248.1652196059082; Tue, 10
 May 2022 08:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220329145904.63900-1-andreynech@gmail.com>
 <CAOiXNkB0QVU8E_XBmurhOzBUq+JL2qfG4cUzRk_7PKrNa2S8Xw@mail.gmail.com>
 <CAGm1_kunaZvTKh6wF8htjDjmjUu+n6RjH=0fyevtZ4523J1SkA@mail.gmail.com>
In-Reply-To: <CAGm1_kunaZvTKh6wF8htjDjmjUu+n6RjH=0fyevtZ4523J1SkA@mail.gmail.com>
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Tue, 10 May 2022 17:20:48 +0200
Message-ID: <CAOiXNkCU6McSVU43k1ikvSnq-jiKoWrfuBW9Xbf1a+eo5DEUUQ@mail.gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
Subject: Re: [Buildroot] [PATCH] package/cmake: bump version to 3.22.3
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yegor,

> > I am just curious if the following patch will be accepted for the
> > upcoming release?
>
> What about bumping it to 3.23.1?

At the time I submitted the patch (29.03), v.3.22 was the latest one. It
also fixes the bug I was facing. So it is good enough for me and definitely
better than v.3.18 currently used by Buildroot. If you would like to submit
another one for v. 3.23.1 it would be great.

Regards,
Andrey.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
