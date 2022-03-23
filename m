Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3331CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 04:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB65684933;
	Wed, 23 Mar 2022 04:48:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Y8MElsFSe0P; Wed, 23 Mar 2022 04:48:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A4238492B;
	Wed, 23 Mar 2022 04:48:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C2BE1BF5A8
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 04:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 092C940246
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 04:48:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ptbsGdDqXNR for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 04:48:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E084401EB
 for <buildroot@uclibc.org>; Wed, 23 Mar 2022 04:48:04 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id e189so602052oia.8
 for <buildroot@uclibc.org>; Tue, 22 Mar 2022 21:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nnWj4iUc/500Brp0651EolSZP805V1XFOYdiU6/AOl0=;
 b=UF3oeQza0DPJMgJ+GhJWK0uj16JF5w5CBAqTt5ay/eqQ35/PcAiXcQ1L+Nst4PzOCB
 tsDMdaWIGKj+43Vgl3r5puGvBmJXwV+vC3cUXh90BL+pzxjTF6MnizVmRzvgpay5NcCH
 1+w5NA37vFU90OsfSdUXlrSlHf77GvfHHP+qCnrnLjKYui0+dYd8yyrODrwMeK8FDrw1
 iT4tzWNFnZ/tMeOs9pRP3LQOMpM8Lqvic5U3I8of4uNc1RDvkD4votlBHxEXnVi8wz7y
 XQ9V+82HnFtAnOz087QRjd5yR2u3j1sI4m5ghAcDryK5XrFos5wKQUyviYVwEGgg7AR8
 uBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nnWj4iUc/500Brp0651EolSZP805V1XFOYdiU6/AOl0=;
 b=Qas3gPnRIPh6aSlMtA9CaeHCqOoqHAD0AI+WcYdzEn/5cyPxdOVBylEf5x9cFaFDKf
 1+sErn5adPolPFaleI6bM8hiHiM2vSsjXdEN/OqrmX44dkmSRoO5YpndhNx0aq6YAdIJ
 5M2mP8lHyICmCOh2x9tb0c30c0TDJfUQ1hPzxNbX/hI7r6f+6pB0a7yD3mzSLZf/Tvb6
 defM76M1uDgLgp8p7Fapjf7TbnSGs3zzOllQchX1qWw5GdB0iJVgccJIGoWe2/9ZZAsS
 uF9+Ea/ArRUr+j7pfTGuFij5KNnrodE3VlsGrrHSGKc7D9QcdrpO+2XjxexN2S4j6o3Y
 c+SA==
X-Gm-Message-State: AOAM530pyX36iX3dLoEWyCl7RaBINJwqc3M4ffwKROWmWBUCdGUWOOaP
 QbTmypddFIJbQ897sUIYCw7MpOd2avBeD52zznYV9JThwqzHJQ==
X-Google-Smtp-Source: ABdhPJyP0goaw3cIc03DIFz1++1PynIezphF+eYJHYk8sc1IbQSm7d0qjT0SCeO8rCEUYoQ6MyG7GPHjQpS0Nmb3IVg=
X-Received: by 2002:a05:6808:df1:b0:2ec:b193:ad6c with SMTP id
 g49-20020a0568080df100b002ecb193ad6cmr3641155oic.200.1648010883034; Tue, 22
 Mar 2022 21:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <bug-14681-163@https.bugs.busybox.net/>
In-Reply-To: <bug-14681-163@https.bugs.busybox.net/>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 22 Mar 2022 22:47:51 -0600
Message-ID: <CADvTj4rUOoiHY0a69DHqSHb3ggc8knp0FFkz5gY3abu2ESjG4w@mail.gmail.com>
To: bugzilla@busybox.net
Subject: Re: [Buildroot] [Bug 14681] New: QT5WEBENGINE not building
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Mar 22, 2022 at 10:16 PM <bugzilla@busybox.net> wrote:
>
> https://bugs.busybox.net/show_bug.cgi?id=14681
>
>             Bug ID: 14681
>            Summary: QT5WEBENGINE not building
>            Product: buildroot
>            Version: 2022.02
>           Hardware: PC
>                 OS: Linux
>             Status: NEW
>           Severity: normal
>           Priority: P5
>          Component: Other
>           Assignee: unassigned@buildroot.uclibc.org
>           Reporter: dmanlfc@gmail.com
>                 CC: buildroot@uclibc.org
>   Target Milestone: ---
>
> Seems this package needs host-python3 instead of host-python for the latest
> buildroot changes.
This series switches qt5webengine to python3:
https://patchwork.ozlabs.org/project/buildroot/list/?series=&submitter=&state=*&q=&archive=both&delegate=&series=286165
>
> --
> You are receiving this mail because:
> You are on the CC list for the bug.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
