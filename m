Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D737FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 12:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A28984012;
	Tue, 24 May 2022 12:03:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hQDcOjpgbxSo; Tue, 24 May 2022 12:03:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80E6C83FF8;
	Tue, 24 May 2022 12:03:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 856581BF358
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 12:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7481783FF8
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 12:03:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kkbhkhhiIf5t for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 12:03:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 57E4083FF7
 for <buildroot@buildroot.org>; Tue, 24 May 2022 12:03:28 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id q184so1601049ybg.11
 for <buildroot@buildroot.org>; Tue, 24 May 2022 05:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k/Yy0tFidVny169yPJzbeXcdeEkYCJQxk4bM77CIsno=;
 b=P0mcY3Q/olSMrL0AIkK+GHJKjV5fj0Wd5M0gwwGtucxeUeQE2LI606Cwt+NX9UNnzh
 K0HHrT/srkS6wkdbMboI4/ony0mJ5WOFpJxnCrrmk8T8SIcYLhH0V/bibnrfIDx1vYv3
 ri8Su8hcf7/Vz88pDkv2USPRgrDCCqLEOkmDIKUkvHNQ3hh0lKQxZI/qq+I46IoUwi08
 svUjmQEYrZKkhyVQzuaSTgQ5MQAwjFCHIL3a5I0Fs3Zhp3vuSy9WA9rhx4rpj6O+Tbhc
 LMh5k/HOSB1J0KceWZo7iRnPYg8DDwOT6gcd+aN0hll97gar7SlLigQ5Kb5fVXQo2IjG
 AG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k/Yy0tFidVny169yPJzbeXcdeEkYCJQxk4bM77CIsno=;
 b=1hKPgl7Dv/rNimX5RMuIB9//hH1NGd0tr8IcmSRaKo6Q0DoRHdEhuM6MJbncESM6Qg
 v3tgUh4H5fs/e8LU+ImLIPz7XKbASQ/8p23EGWIkk6SnhjvJ1NZs0DaOGMmgpw/6TZAy
 g98yRlS3MRnJAplDgPSP8FKs6gUkusrPGExN0G3523Hy2lRdBOyjPyk1S9SzidV8GNFy
 1ZzlgPnZmtjREwA5kzrMf0LaS2e1WMXCgRLKZLfdyD1Eue40IROJAGDHutG68iEeTto/
 B2Mm3RHSQbpDGpsPCUPc+J49lUz+FzFqPke1Jgk5R3hwztRmLwzormZX+KO/TFGCbWsK
 Y3+A==
X-Gm-Message-State: AOAM53372vrduDKotgIRHVWs8AhGNg9MzhNQwfatJRYrnnpZnjvmZYX1
 6+iP3V8+fLdF8y1CdQzf0KioZDZhC0O+xSCYDv8=
X-Google-Smtp-Source: ABdhPJxmqmUHhpCzx3drfXVrbZA1ZOaxlc7ypokzIqfaMBE9IsLl6aJMIG2bZYQUz4hmKmsgkfm8GeEPMxf14HoSHkE=
X-Received: by 2002:a25:7b45:0:b0:64f:ec98:96ed with SMTP id
 w66-20020a257b45000000b0064fec9896edmr8261176ybc.445.1653393807079; Tue, 24
 May 2022 05:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220329145904.63900-1-andreynech@gmail.com>
 <CAOiXNkB0QVU8E_XBmurhOzBUq+JL2qfG4cUzRk_7PKrNa2S8Xw@mail.gmail.com>
 <CAGm1_kunaZvTKh6wF8htjDjmjUu+n6RjH=0fyevtZ4523J1SkA@mail.gmail.com>
 <CAOiXNkCU6McSVU43k1ikvSnq-jiKoWrfuBW9Xbf1a+eo5DEUUQ@mail.gmail.com>
 <b994c5b7-def3-48e9-9695-08cfc266fe34@mind.be>
 <CAOiXNkDBgP=sjS5WEKR58VSgfikBmSV8FmcaQygAPHi-E_Lptw@mail.gmail.com>
 <878rr88joi.fsf@tarshish> <82370296-a5c0-fa25-1993-1c4a885af02c@mind.be>
 <87zgjo6j6s.fsf@tarshish> <0f1fa89e-fddf-5448-b352-e70966056c2e@mind.be>
 <CAOiXNkAPgn1S4uvqQBeZ0JBYsm_e6hhHmP9QYw+2BB5JEEGY9A@mail.gmail.com>
In-Reply-To: <CAOiXNkAPgn1S4uvqQBeZ0JBYsm_e6hhHmP9QYw+2BB5JEEGY9A@mail.gmail.com>
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Tue, 24 May 2022 14:03:16 +0200
Message-ID: <CAOiXNkDQ95Y-eh7TaOhoAn7jaNcctaPCx067W+OPWxTG3NmD1w@mail.gmail.com>
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ping.... :-)

On Thu, 19 May 2022 at 18:18, Andrey Nechypurenko <andreynech@gmail.com> wrote:
>
> Hi Arnout,
>
> >   So I guess this patch is actually good to go. Updating BR2_CMAKE_VERSION_MIN
> > can be done in a separate patch (but isn't strictly required).
>
> Is anybody going to actually integrate/apply the patch so that changes will
> be available in the next release?
>
> Thanks,
> Andrey.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
