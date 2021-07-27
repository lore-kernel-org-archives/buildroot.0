Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1ED1C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 21:04:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB5BA603E9
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 21:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB5BA603E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B46B83A05;
	Tue, 27 Jul 2021 21:04:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2EbRbiKdVCXP; Tue, 27 Jul 2021 21:04:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9EB9839E7;
	Tue, 27 Jul 2021 21:03:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A8CF1BF860
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 21:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 892A6839E7
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 21:03:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NpnEX0_474Cs for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 21:03:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D945C839E5
 for <buildroot@busybox.net>; Tue, 27 Jul 2021 21:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627419832;
 bh=DXph6duEvOz/q1iBx4ADM1GwrOwOzU3WXEXS3QHpxg0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=aIL2em5SSugm/FJqgliQ7gkWJ8N5Ay6CeE45nHbffyQ7xycRDNO49rOfuUOhLgb8j
 5czLtK/TvBBc6Ue2iixFO3bkStYcCtltu5tvAOfRfngv6ypZ2NCA2vgCs6m5rLcyNb
 YMgtWb7+U+X2Vba6ZQKdn1y/v6rVcAU3MAJnXu38=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.64]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9Fjb-1mEnEN2pYV-006LkZ; Tue, 27
 Jul 2021 23:03:52 +0200
Date: Tue, 27 Jul 2021 23:03:51 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210727230351.2e49eddf@gmx.net>
In-Reply-To: <20210725233859.723427e2@windsurf>
References: <20210331185001.24790-1-ps.report@gmx.net>
 <20210725233859.723427e2@windsurf>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:meo7zaSn217kOjy1Q/908qxPU6mX273GRPvxQ1WEeCDmpKwUBcK
 S34hRATfBdxbGgpUqPc1u20dE55PAzLnU548LmXCc6VJD7+4FsP6iVqzUCPHOl5Pql57zch
 gfqrYsvHJMriOsb8CqzSpB4h8Jv0GM34iLicTPYDFHGHiLKb7Dp+JxfYnKsftUrBrjbG7gu
 7yc56qgUgYLyKaxrn/SaQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Jcbh16HLDfc=:54Xc4AmIQVklfmZLnQ8Imt
 LzEPDxfB3ugIJci3ndHJq93NlGImUaDKqkaDAagCVpMwYmPI4EpAlaN/LG5K17bC0FJx8bGB6
 nqxCP666sfDmeEd4r5k9hE4Gc0ZPrLKBrGhQQve7LjeqMXa1A9gHPnqeu08JxzRqAxrb8UiHw
 H57grO2woqMPFt0mt25vupHAzbuzn0vrbXYZojc0qumFZN2PuZ7S/1tmldJvlYvCBot70ZmY/
 oWQc8SArpSf8VASiTmK/50I5ilrPfGOUn0NkdrSQPGIYOrOmAlG9Ym+1/beAh6s8aj7lnargY
 QkImNX6Y3kFqMPJqXC4VXIqF0w7eW2fnbn6uIOgNLsFlgsM425lqDzGZCuXyOtH9hINOSjgjS
 SFCQ7UYMCQWbSCBFt3KztUv7IXbaT2/dAvBKxSj2ue5X5MRZuvUhJdVHMFY7R0b0RaGs7PTBa
 CK5IbGC8xNHuv8/GbTGXig8PaJiZtFI8qTWrU9iypkeTeqtZREF1dUoEi1mKQSZFNCuL/ocvj
 HkDDfL8pOqqVy0TZ1shmgYEWvk53Npwv7olA22O1aki6KwCVaxIu1uyxO6KnA8BCBjOF6fUnr
 T0bTxGPkat7R3dJIo5UsLNm55s3xxXTZP5Elbwwv0KL6vTnuup5aIC3j1E4VyhH3i/KkerpOg
 3Enc1IYRer4STTmzhOa5wOSOZPJg0JBbunoByunileIkvydmZ924VhGSst0I8wdLY+wiwaUnH
 q4OiCCWIxurxA6FBmaj3euHtXMmLLkeFIvi34RWOIeYGiRnfIl3ErGXK2bNnpKOA2mcolpan6
 1Sx2TxWuEDUfAC1wgNvaW8o0g9OxiHAaO2g19owP/BYRnOWlbusesCHp8h5kWfQz+8kFO9hCy
 5earS6BjERuXQxWYIMPWQ1sybtAR/DrZQfpwCO3tMnnZS7sspI2spKQY0WpFb36tj1akbeUdX
 LB5XME0CouYI3D3oIip3L0G+RC1z9AMQwIf5YSn3fgPJdf0hAvl74sFURobCA00e3EjOEHZD9
 jDflQoX9l/zgd+5lAlRZBxMLnfIsimNkDfNo+YjRRPFwWYfuOVCtSCQQixF82QXsNuiJKYAGZ
 cZSZszbqveJ9EUPfa3EM0hDoP8K/9dTMolv
Subject: Re: [Buildroot] [PATCH v2] package/haveged: bump version to 1.9.14
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@busybox.net, Pierre-Jean Texier <texier.pj2@gmail.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Thomas,

On Sun, 25 Jul 2021 23:38:59 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Wed, 31 Mar 2021 20:50:01 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > - change clock_gettime option from yes/no style to disable/enable one
> >   (still omitting the explicit disable to keep the configure logic
> >   defaulting to yes in case no rdtsc is available)
> >
> > - change to set all available configure options:
> >
> >   * '--enable-daemon': previous default
> >
> >   * '--disable-diagnostic': previous default
> >
> >   * '-disable-init': do not install init files as buildroot ships its
> >     own sysv/systemd init files
> >
> >   * '--disable-nistest': disable tests, previous default
> >
> >   * '--disable-enttest': new option, disable tests
> >
> >   * '--disable-olt': previous default was yes, disable builtin test
> >
> >   * '--enable-tune': previous default
> >
> > - add patch to fix uclibc compile (disable dependency on sys/auxv.h
> >   introduced with upstream commit [1])
> >
> > Changelog ([2]):
> >
> >   - made enttest configurable
> >   - havegecmd.c - new command added to close the communication socket
> >     [Werner Fink]
> >
> > [1] https://github.com/jirka-h/haveged/commit/26d35af198da01220ba4f7a1b987f17012476c00
> > [2] https://github.com/jirka-h/haveged/releases/tag/v1.9.14
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
> Thanks, I have applied to master.
>
> > +# '--disable-init' as buildroot ships its own sysv/systemd init files
>
> For the systemd case, we actually prefer to use upstream-provided unit
> files in general. Do you think you could have a look at using
> --enable-init in the systemd case ?

The buildroot systemd file is carefully handcrafted (see e.g. [1] and [2]),
I do not feel empowered enough to do changes to it ;-), maybe Norbert?

Regards,
Peter


[1] http://lists.busybox.net/pipermail/buildroot/2020-June/587067.html
[2] http://lists.busybox.net/pipermail/buildroot/2020-June/284216.html

>
> Thanks!
>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
