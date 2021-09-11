Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F93C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:30:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08CF96109F
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 08CF96109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C48BC4079B;
	Sat, 11 Sep 2021 14:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kvTaMzAwOEpq; Sat, 11 Sep 2021 14:30:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A74F4073E;
	Sat, 11 Sep 2021 14:30:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03E041BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E82EE83B35
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:30:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pOH77upkd3lE for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:30:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B655F83B2B
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631370627;
 bh=jff2ll4CJtGsUX10CMyeVG21MfKyaNd8E87tav9Ud2Y=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=J/MUz33qqzXXSpps/HgpVQ3kTJtUWTBgJM/iL1k6JW/CzRHkZWglt1wpFhaQV9F6G
 3T04gJfUWFfMbuNxgiV3YuznFC1d+C29GkRfxIsk82YcBjgJ0ao6OC9uQ447OycxbO
 glST8HjAgjhgwKzHt8tie4fpuhnUkKs7hurgxKOs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [83.130.82.162] ([83.130.82.162]) by web-mail.gmx.net
 (3c-app-mailcom-bs14.server.lan [172.19.170.182]) (via HTTP); Sat, 11 Sep
 2021 16:30:27 +0200
MIME-Version: 1.0
Message-ID: <trinity-c2492100-ad6f-40f6-8630-9a21090326a6-1631370627175@3c-app-mailcom-bs14>
From: daggs <daggs@gmx.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sat, 11 Sep 2021 16:30:27 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20210911093049.GJ1053080@scaer>
References: <20210911084204.22150-1-daggs@gmx.com>
 <20210911092713.GI1053080@scaer> <20210911093049.GJ1053080@scaer>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:FXsZyFjuMi5FCB5TK8Z+623U0FzAZAqNDgVMpz2Q0Mm9SJYgQTgnq/ksFoLEcqYo7tpbk
 rAbEMkK/JZH5hmh17NrH9MLELisB+lBLGGhI4UPcjg7TM0vKUTUNug0F+Cu0zS9xVE2yh8BtFJ0k
 C9M8MRJx8J5EIY4XVzyehqDfT9FpGGbEC2SR1Qa1fGwOq6+QeYAcxKWoh/7WQL1CfqfEhyaTq9i8
 PzprJUzKCvfBTZJtvzTlA5jt8DcgM75l9REklP4VIizSXzTRaxuF/RQIQU8KWfmyUuNyl90SibGq
 G4=
X-UI-Out-Filterresults: notjunk:1;V03:K0:XBEtTf5Z3kM=:DmH23P1Xlt3fap3jwBuh8Z
 Gr7pYyQG6xNc5n+GQ+6+AcIf/PjYTXCIo+MHCL7wBq2OhPkul3i0YQ+pKydmV55laf3duqxvs
 s4l9pc0cZfdqFP/D9alnsQHhPYuJhocutvuXNjzVx5Vd0TpDeJPOfA9uTruxvTYy99rb1rYjg
 QqjrYuyhAQVhn++T5pcMIekfDntBpqv6QK2t42xCRL6nIcB5MVM4c4UWLsXXDJDwxCR7NBqon
 vSd+/bC9iBdnPK1gjFjgWeBQg1YIpf9cLdJqpeW8zj0p5dtKcoT3bvh2nN7QpSGonVSj7N7Bg
 A3UNq+FNhIOsnTbCy798q8BpeMljqF6TVMkd4f8XlRXUWum0FtaS3nYU93kjbaMY2n7FkWyP5
 EQEfQSj1PnZrhSyRhIfr0QPNlOWziz0UN4ipNCc6DkgV/IYT5LvhCY/qI7stZ60kvJoDUQLt9
 7qCuhw5bUxs30NuplaAEHceKo0+cGNqMD6csYpPzHgs+2HmNnMDitPxjbxWQ6coTe2k49HNbJ
 JwrcO+XXqJARY8vG1NZUm0n2QudZayHHSS7UW6MnmF1gB1sPhVZRNv1mQkV1GcLp/l58v+05U
 lhWgkcSJLaIqdRGFRpuQqgrfyRh3o+4te5qdX1rHN6Zrul/J6gSTlU7mdC6ja2nnSojGKx9zQ
 gVpPOg896NUfV0Gi6SIOWlQKzB4dqND1qNNDUlkNbAijVaL0OthszoIPlTnTMK0WyLxftzrGH
 HTBYeGgrqWnVNu5+RetqM7Xst++d9w2Zrr07oaRwB5n0+XUTGJRykvoQG5vnXNN6Fe2yzPb0v
 omHOAS5Fo1C7aYzMXIsEzEnPmCNTg2QBt+2CGdL9II5J+BTo4k=
Subject: Re: [Buildroot] [PATCH] configs/ordeidc2: increase image size to
 256M
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Greetings Yann,

> Sent: Saturday, September 11, 2021 at 12:30 PM
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: "Dagg Stompler" <daggs@gmx.com>
> Cc: buildroot@buildroot.org
> Subject: Re: [Buildroot] [PATCH] configs/ordeidc2: increase image size to 256M
>
> Dagg, All,
>
> On 2021-09-11 11:27 +0200, Yann E. MORIN spake thusly:
> > On 2021-09-11 11:42 +0300, Dagg Stompler spake thusly:
> > > following Commit 9f127cc4, the resulting image is bigger than possible.
> > > so BR2_TARGET_ROOTFS_EXT2_SIZE set to 256M is required.
> > >
> > > Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1575071376
>
> In fact, that error is about another issue that was recently fixed:
>
>     https://git.buildroot.org/buildroot/commit/?id=4ad23552c6
>
> Can you verify that the test still works with the current master, before
> increasing the fs size?
>
> Regards,
> Yann E. MORIN.
>

as said in previous mail it reproduced on my setup with today's master
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
