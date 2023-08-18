Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D197EE49A1
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 23:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7323761602;
	Fri, 18 Aug 2023 23:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7323761602
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eyHX7nL-N_ue; Fri, 18 Aug 2023 23:24:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AACB1615F6;
	Fri, 18 Aug 2023 23:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AACB1615F6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66DDC1BF2A1
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 23:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40BB94159C
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 23:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40BB94159C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ia3tHhAa9tOA for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 23:24:13 +0000 (UTC)
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E84624154E
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 23:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E84624154E
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1bb3df62b34so138603fac.0
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 16:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692401052; x=1693005852;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rRtILZHoBo6u9BrmuexVHHLT3dyueg0t5rmZAzGZ1KQ=;
 b=Lx1ZGJFMi+6FHo5nPQbH9UqdhVNXuthG7jjFuZ7sJcyJ362PWZLZKYnuEyyRzcZmtJ
 pAW+WJLqHVtG+OkrXi2cfSsMKl79peJBI1o8iyQ2+QZpvQqtjb+cEOmOdBhf2+b9boRg
 Hq24hQOEhjIc9pOhK+LQ05lhg/raDNhbO9uubbwwQZ7MvZNU4/I5pDN91B7Svcv8+jpY
 d2kHBze83bOStvEJkxYkE16dJS8oUrJFTIE9UTPMOOtDpuJxFkfh0DU49twV2trPxkPJ
 qpQyTNREdzdBCwJ9MLEnqTVP2VFOPpY/yge95hEkMaMytT+MIFW8tbTEoq32sCX9iGt4
 1IYw==
X-Gm-Message-State: AOJu0YwMxjEgfVvhbEDvCGehRPOnuEjWMNAfY54XRbUxLi+wCGszozHN
 n3Q/LD3vR+04fVHku4g3957PzcLZ+pj0aQOyZa5KAA==
X-Google-Smtp-Source: AGHT+IEHWl0tCqnb78n2g4mlCaWFHaKqMxKBrJ1I/O/MyW5K1UCOMXvlhqykCwUu2nsvDYETMS3Mu0KgLfVaj8skmOo=
X-Received: by 2002:a05:6870:ecab:b0:1c8:bbd0:2fd5 with SMTP id
 eo43-20020a056870ecab00b001c8bbd02fd5mr811003oab.4.1692401051822; Fri, 18 Aug
 2023 16:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230818003124.3770152-1-mmayer@broadcom.com>
 <20230818003124.3770152-3-mmayer@broadcom.com>
 <20230818054737.GD1340200@scaer>
In-Reply-To: <20230818054737.GD1340200@scaer>
Date: Fri, 18 Aug 2023 16:24:00 -0700
Message-ID: <CAGt4E5tiBya+494zuXmQ1ZJLdGcT_qjFyrUYnhQ=brZQR5qf3w@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1692401052; x=1693005852;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rRtILZHoBo6u9BrmuexVHHLT3dyueg0t5rmZAzGZ1KQ=;
 b=Pdf3pijn5t8GxhL0LAy1vQNIXhgi5yEbZRC1LlpKBXIoarmK1+oU7rWT31CW3xOpPR
 c+9HX9X+ZWVzh2LR+e/GeH7Eh+G21F9Nrvbu87pOvuRpeFki/fv1IKgOORQLyHSQc05P
 MeTSipYWr+rxr5lINfxKqfoNs6iqvzYLHAEXw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.a=rsa-sha256 header.s=google header.b=Pdf3pijn
Subject: Re: [Buildroot] [PATCH 2/2] Revert "package/util-linux: add missing
 autoreconf"
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: Buildroot mailing list <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 17 Aug 2023 at 22:47, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Markus, All,
>
> The AUTORECONF=YES should have been dropped in the previous patch.

Okay. Good to know. I erred on the side of caution, because squashing
commits is easier than prying them apart.

> Besides, a git-revert semantically means "the reverted commit was wrong
> even at the time it was introduced". But here, using autoreconf was
> correct when we introduced it, so it should not be "git-reverted".

Noted. Makes sense.

> No need to respin, the two commits can be squashed when applying.

Thanks. I appreciate it.

Regards,
-Markus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
