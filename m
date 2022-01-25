Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8818BC433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 20:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D914860AD0;
	Tue, 25 Jan 2022 20:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HxqscDj2E9LR; Tue, 25 Jan 2022 20:11:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2281B60A88;
	Tue, 25 Jan 2022 20:11:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 280171BF5A1
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 20:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 112AC8261C
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 20:11:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ycUGqv3qOP1 for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 20:11:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B49EA818B5
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 20:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643141469;
 bh=gBYdimcz1r7QdzVdZxmwJSgfc/unyOc6f9M4XFrAqOU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=T2xm4eUZIRAx/dhGfxQ9S0x4lyF/tVY7ZjXB5XZa7Vlr1yphdIcPtkqQ/kF7UhB2m
 6bp+RhN83Ab6ftZI92wc0a5kEez5FlMtYd3wChLU5AWNkO8D1zv/SB3Qo5IozGWRRL
 OxkmkjjTnQTqeb3hSPFE5lKzM0YQ/rmsMVf74hf8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.192]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7b2d-1nBbbU0QZx-007yav; Tue, 25
 Jan 2022 21:11:09 +0100
Date: Tue, 25 Jan 2022 21:11:08 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220125211108.1143b77b@gmx.net>
In-Reply-To: <20220125001222.582e094a@windsurf>
References: <20220124201628.11015-1-ps.report@gmx.net>
 <20220124220707.688fee47@windsurf>
 <20220125001222.582e094a@windsurf>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:HLvnoyBQdcW2MWar7vc0hPxcAMCeuUe2tat2YaSIXp3a2oMvkVJ
 7NON2xIlnleLjYGV02fVMu1IwfXIu7d6T/DNiOh3rDaqhkSf7mkTbaTRJQRARY5c8TTVULI
 t1BraLBG+Fpey0jmVkoktBJeYlCoKCgKV1CnjNWGXY+Kg55Y87FnqmVVTzkL8FMg4C4ldUo
 ieP+Iv74wjqn/uLTQekoQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zTpKLE9ldVI=:52GriAif15cuvaQJYTo/Xx
 2BQkvyRR1HpL9wNLdPnCChTnlpjMDoxfX5m4t2f3622qzYppF4758fm5Ml1yfQwalrsk4gSWT
 yKjFkNoGPaIw/VyE8SnHYF3Nc+WtF6yciDS/8Il4fKuvU/NTR4PIY5m50rxKlxzMY+VIsytiw
 WAXA9pWp6oWgCpfWWtI5B7QgkbZOl0j13mibXml2zUgRFJ8vFqzfpE+cdl5DZ700RZant+fOg
 SMbMQ4tFm5DNFAop9T0GS5Pnobh3JwKTiZl0Xl9iIAlY8Xppu6ppE8gT7lL5PGevQI+UTCssy
 6laCijdEYo8HtnLbxGOkNF/qSOdm3+1Db78ed9TIWkGDhj83ND/MS663mQym6gfZobswu3E6h
 xcI52v9Bhn6RYow/8tC8tzIO0fagNj9CBp/W5r4MbwmTVJGzw4G2mmb/r+I4w8TOwFlZvhh1L
 3Axx+Ztv8jeRJClUswdbaCiSNVPpBiKfD/2UJRtlFh21IftynByXBFnicWK1jVoXFA2gRH+XC
 Sl6Gk7iOvwFqRyyolx9Rh9UpfZPrj6pWzuZFfXzCyQFRrnQZjLGDXWH8RfzUC7t+gPGMBpfq6
 lm9uXBxeLAjLzM/rlxJS8nwoX5S5/40HDejH9VWqkxQewSlGjjbLWREeNpQBWHJIAi8jmNYDq
 +B07rf7YAsTMoUy/WZyX8r2AXifbKvfLITdAjvNhWyPv0W3mKTD+9bU7Tx0EjipUdjBAy4BqY
 3ff1BTVsOxHT7vxEKIjhf2VR7pfodd0RXHrDfY/BI8JLKgHaP/OAazJdm+TV9DZ5RNfIldf9F
 mu3F2IVDqvYlvIFwlKeOKd0xjBD8SC2dnvRKULwFpK9L7r7gxolfr/lm5CdhgOcSoi/bBALsh
 myvn7gdNaNlYftQY3NV/LsqnU/85skiCmqM+YDKyeXoDZSn04fwT9/auwEbhGu2A1CQmrFgnS
 ibbJo7mYD2wnbXNz7SowSS/8b/wX67rtd+ansMlKJBbUR/WiadmPxsRJ3fZppisQWzdtCWWun
 Tf7fyyyueMxp2txvzt7Da9WwjKTSqNpjAL+d1Md09924MklnIAtwRCUCiuQVPcY9Kf7yARqBX
 N8v94oXp+bpUkA=
Subject: Re: [Buildroot] [PATCH v1] package/util-linux: bump version to
 2.37.3 (fixes CVE-2021-3996, CVE-2021-3995)
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Tue, 25 Jan 2022 00:12:22 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Mon, 24 Jan 2022 22:07:07 +0100
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>
> > Applied to master, thanks.
>
> And I reverted, because it breaks the build:
>
>   http://autobuild.buildroot.net/?reason=%util-linux-2.37.3
>
> (I didn't investigate, it's too late here.)

The failure is

	make[3]: *** No rule to make target 'disk-utils/raw.8', needed by 'all-am'.  Stop.

upstream known [1] and [2] (and fixed in the next release), seems to be a packaging
error and could be fixed/work-around (or hacked) by (will install an empty man page
to staging/target):

	touch build/util-linux-2.37.3/disk-utils/raw.8

Can send an updated patch with this fix(?)...

Regards,
Peter

[1] https://github.com/util-linux/util-linux/issues/1579
[2] https://github.com/util-linux/util-linux/issues/1577

>
> Best regards,
>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
