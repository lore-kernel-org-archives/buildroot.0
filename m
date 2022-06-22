Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170D9C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 20:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAA0E83FA9;
	Wed, 22 Jun 2022 20:53:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAA0E83FA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ee_nrscoYyZW; Wed, 22 Jun 2022 20:53:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD51B81D16;
	Wed, 22 Jun 2022 20:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD51B81D16
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 91A011BF3B9
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79B0A400DA
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79B0A400DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y2ScJ1SIQosy for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 20:53:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB021400D6
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB021400D6
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 20:53:03 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id d17so8179555pfq.9
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 13:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BsLn4Zar1FlRNxAWaKLydfWsGT3fU7B5Ub8uzeGhsCg=;
 b=zN292sH/0g5pquKNoZ0LH0tK+H6KUdaXnqJNBB7NFm1RLTGAMyYEcS+XvhluP1V135
 8dGyNemLXKI9h9tWGr6B/Bb2m5Pe7woh1qmwVRfNhM04IEfSG9ALeJxnOvR6V7RtRr3h
 FO5RwJAqLHQVZLghUw4u88CjmBskJFdAlOPAVikJCFaEGOeJlXJXFCmOG6QyFVks6k08
 8NKUVM0a/guESE4Pped2P1IyQSd5FKgDTbFX9EgtV4mjCHL8NDoZdJ4tzM1X5a4d3kuM
 5bTTBffya0sQ+QR2FJo86NGu/KQ9B6tP3og9LhbAR2xDS3ohdnuNAnjzZo33OdqNMiE3
 w6RQ==
X-Gm-Message-State: AJIora+Ouh+QSWyMP7hmOluD9bkXHqq8TDcD2LVJNc8X3kzTXlJp4r7T
 dyq8f4S8x4kGEmoy1S3ZZ+4IT4Eqkl615d9xohE=
X-Google-Smtp-Source: AGRyM1vYbuGlRSSH7fTaBCsjwaEJxzn7IRh1Znln4z/LhFMQ/mHHzH+Q+M5XJT5vU3jcOG9SNZfTuAgJpW4H2Npn+V4=
X-Received: by 2002:a65:6a0e:0:b0:405:2310:22d0 with SMTP id
 m14-20020a656a0e000000b00405231022d0mr4464396pgu.290.1655931183313; Wed, 22
 Jun 2022 13:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5A-+OUqu+gkG_xfH22qkO4XiGqkzf4qosFB_FJKu3F4iQ@mail.gmail.com>
In-Reply-To: <CAOMZO5A-+OUqu+gkG_xfH22qkO4XiGqkzf4qosFB_FJKu3F4iQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 22 Jun 2022 17:52:52 -0300
Message-ID: <CAOMZO5AvpK+QSr6bk6V2ORUVTqO=ch6tSqSyo0hEAm0=pff+4A@mail.gmail.com>
To: fontaine.fabrice@gmail.com, Bernd Kuhls <bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=BsLn4Zar1FlRNxAWaKLydfWsGT3fU7B5Ub8uzeGhsCg=;
 b=oJW+XiZQtScwXEYNJwvdYJf6yTCGQKB17Rmp0XE742DTdY5Nv9KRCuquvkIXbceySw
 RzaqfGDFrYCLFUoxZMJkpC36H79S0kssrtX/AIaT1mzKW5NNCW+nX4UsaSO7FIi3zLLV
 a5EPbOMOinPuQ3mIUo+Ljo9vVxJvlle6wrUQk4krRr6qgklNP7h7LO9rTLBp4YWAwbVN
 JIPikQ98S8DjUYxqOoNfQ56bkz6XT1EqSufe7+ZxKuu0s9cbaEJOmhrs6aJmm7Ul3hwW
 1xllGgmBWhXFHyNM55s8d6nJ36s9ycz85sQog8tEZZ6PgqDwGpurDF+ghAOW3Crc0rRQ
 nv2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oJW+XiZQ
Subject: Re: [Buildroot] kmscube build failure
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

On Wed, Jun 22, 2022 at 5:48 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi,
>
> I am seeing kmscube error when building imx6-sabresd_qt5_defconfig:

It seems this was caused by some local debug patches.

It builds fine on a clean tree. Sorry for the noise.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
