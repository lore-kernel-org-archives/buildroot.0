Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0696C433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 16:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 385134024D;
	Wed,  8 Dec 2021 16:47:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RoUPncFbaX6n; Wed,  8 Dec 2021 16:47:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FA8E40175;
	Wed,  8 Dec 2021 16:47:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F30A31BF2EB
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 16:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA3FC40175
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 16:47:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2rFkvcyeUYZr for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 16:47:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 169774000B
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 16:47:11 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id v64so7359423ybi.5
 for <buildroot@buildroot.org>; Wed, 08 Dec 2021 08:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=oAfWqDgJCUhVsH9UMPko5NGw9X4j1FpUEoLLYehMsUE=;
 b=IfzULiDy+3g6DvvWZP1WUe8khmnIIQZUpuAPbLhovLljlOpB9orS1oKoYDD3O82FJV
 0yxT694f2rtYJ7ZQQ4oiHvwJB9P9+a7rGHW6Ojhc+dDuwApmbC1VgUrz9kIJ0eeAME89
 suLREHs48d0aDuxMH9mFM6EOz2lyLkAiUxCpHLXo1sYYhbCpxhs0C2Xd3b4iMTnHoycq
 vdy+TqPTJdmUkxNaQZLlbqBY79jahC93jIdJI51xiTDdbbNI2BXhKhO3y6HbmZeDduwd
 D+dqDxfap3P7L/Ih0GaHvj5fYJmVInJGC3s864/tHCvd5QqYhP2pwN27lyJ1eB5yHxW3
 yvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=oAfWqDgJCUhVsH9UMPko5NGw9X4j1FpUEoLLYehMsUE=;
 b=T3KapARf50IS64Q8kabT1lGdM32WsuygFz2/t4DmznCeGn2OUPzmO9D0OJVry4lhil
 w5hW6ZsiIR0lWC5fRDtB+Fnk1bEJ1pjawHC7nColr/jjW9Dmy3H6lDwMUSq1Hc3Wijxh
 uJOuyqr9P3AqVnNzR8YgrigjzJn8h/RhsQKkdU4WHVAw7ePceIh+9TdcmW/qmqeD9oaR
 uZiDYn0Wmh7c8ucJQyKEuSRGZsiDQ/ff3n0di4N9fRU/ncSfz9fMt/7ma6/D38XHICxm
 j1AcAZLYJJnKwOinOwmth0Tt9f57HGiLW0UX6tGBjma4taGSbeABPwQE92PhOvi3KIev
 r1fg==
X-Gm-Message-State: AOAM532QC2OIQwLbGo5pygrSVQUp23JmHe4bB751VA3APggrFLh7OXiK
 gz499lcuqbOaaT6mh+ZqIGatFrgcqkpT8NCP659lK93rlpY=
X-Google-Smtp-Source: ABdhPJyvZnNOAJYNeR5hTmC0ou4eaiWfhPLUGUCXtpQxm8LVY4BhczTMP8iulpHmowP2EHwnY0L8BPbTgKIcCDTbN2g=
X-Received: by 2002:a25:f403:: with SMTP id q3mr59454054ybd.606.1638982029458; 
 Wed, 08 Dec 2021 08:47:09 -0800 (PST)
MIME-Version: 1.0
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Wed, 8 Dec 2021 17:46:58 +0100
Message-ID: <CAOiXNkDn5AZBuQLnnR1tK-aW19OKmSXpv2yuDj3wxe2CTEiDiw@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] Building packages for Cortex M4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Buildrooters,

I am currently playing with Avenger96 Board which is powered by
ST32MP157 with A7 and M4 cores. Part of my system is the firmware for
the M4 microcontroller which should be compiled with a corresponding
variant of gcc (not the one used to compile the rest of the system)
and placed in /lib/firmware in the rootfs/image.

I am wondering if this kind of scenario (two different
cross-compilers) is supported by Buildroot and if yes, is there any
documentation on how to do it? If there is no "standard" way to
achieve this, I would appreciate any recommendations.

Thank you,
Andrey.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
