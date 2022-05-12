Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F31C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 09:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C12B560E38;
	Thu, 12 May 2022 09:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xPXBrk-VZmgD; Thu, 12 May 2022 09:12:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0014560E05;
	Thu, 12 May 2022 09:12:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4FEFB1BF86C
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 09:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C9C240185
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 09:12:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f7lN-M8nwCv6 for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 09:12:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A568F40122
 for <buildroot@buildroot.org>; Thu, 12 May 2022 09:12:33 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id r1so8581058ybo.7
 for <buildroot@buildroot.org>; Thu, 12 May 2022 02:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qe1Qj9sRRFKra/MtOwf1DaORQTpoy8pYnMeTvjWhDtU=;
 b=TqU39tlzOjawYZhlXpuJZIJIUh5izXX5b9EV8sauM8kh6SZ2/Q41YIeAXKYW7LKhiY
 Xjb4bmtGv/WVJG1xM2Q5UjNMtgcZl/NZ8vA1F5nE6s8FNRqXFr8LZbQjZY17vitEFXBm
 2tRk7YZx4Un0YkrdBHyROzIo//lxiQF2ukoJN6knkvHEFJ9PgjmNR33ogQu+c7Gqnihy
 8XHBuxWx4u3xVBaHzHZA96g0gI5xLrZhrT+qjFUE+yaw7dyEXGmV0Cix+y233sg2PBzs
 pWhAqftmdmZDOLrfXsmAZBMIE2mYH8r0eqhTNurUcCWIr0dePWQxNbVgUJkL4+Ba38Ix
 htVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qe1Qj9sRRFKra/MtOwf1DaORQTpoy8pYnMeTvjWhDtU=;
 b=oybEiRj/y1JjkeyS3BhDnHlWiPo9RmWSDiz++Kh5MJhFMARgiUXOg4wnAglkjWNzZ+
 uTYy/ct6mawJyLNLKAq47SURfX9L+UicwgUkqkQxZIF2ZAjMUnGSrQGoZt/tS7zqefM4
 xNs98HGuQQYTdVWootq3ll5Yurxj61moreYa3p3plDhYTDK8yDTWguCG/law63MYPeul
 OJFThR8nT75o2K5kHJEf6wXbKnKKLxA3+wzkOHMZZ5rAlry+YFMiyRL6kr+yRvNCinwu
 WIcWhuOs/UoRg+r2WtLCNgVH1FUhwhK5vZ8SEM47kOR3gDOFZnnlbg3/dCQsiwd09/pl
 AIrg==
X-Gm-Message-State: AOAM531YtvJs4wmBWGHohkxE7P912kmNmL6Db0Trar+iI+779nl0Oaqh
 BhOhGSiOpAmmRbQ+kFrQNxOprKWJqs7ZVBTmoZ4=
X-Google-Smtp-Source: ABdhPJwy/rPwDZQo5jSjFvjTTECOpGS4Qhjc6hPZFraX+82WyxvVp7SpAcPd4g7NGhD4dsC+FL9inOSaB/wtzRvb/Oo=
X-Received: by 2002:a25:e7d3:0:b0:64b:4da:b51f with SMTP id
 e202-20020a25e7d3000000b0064b04dab51fmr13060227ybh.371.1652346752397; Thu, 12
 May 2022 02:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220329145904.63900-1-andreynech@gmail.com>
 <CAOiXNkB0QVU8E_XBmurhOzBUq+JL2qfG4cUzRk_7PKrNa2S8Xw@mail.gmail.com>
 <CAGm1_kunaZvTKh6wF8htjDjmjUu+n6RjH=0fyevtZ4523J1SkA@mail.gmail.com>
 <CAOiXNkCU6McSVU43k1ikvSnq-jiKoWrfuBW9Xbf1a+eo5DEUUQ@mail.gmail.com>
 <b994c5b7-def3-48e9-9695-08cfc266fe34@mind.be>
 <CAOiXNkDBgP=sjS5WEKR58VSgfikBmSV8FmcaQygAPHi-E_Lptw@mail.gmail.com>
 <878rr88joi.fsf@tarshish> <82370296-a5c0-fa25-1993-1c4a885af02c@mind.be>
In-Reply-To: <82370296-a5c0-fa25-1993-1c4a885af02c@mind.be>
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Thu, 12 May 2022 11:12:21 +0200
Message-ID: <CAOiXNkC1PMANjVdyMv2ZWQRomzK6vO9e9pr+Bvmts=t_0SYN1w@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
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
Cc: Alsey Miller <alseycmiller@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

>   With all of the above, I'd say we bump to 3.22.3 (this patch) and set
> BR2_CMAKE_VERSION_MIN to 3.22. What do others think?

I agree with this proposal. I also like the suggestion from Baruch to
set BR2_CMAKE_VERSION_MIN to 3.20 (not 3.22)

Regards,
Andrey.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
