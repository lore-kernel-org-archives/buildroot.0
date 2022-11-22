Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12482C4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 21:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B6848205B;
	Tue, 22 Nov 2022 21:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B6848205B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0sy6fJcDuUf7; Tue, 22 Nov 2022 21:50:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE99D82044;
	Tue, 22 Nov 2022 21:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE99D82044
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C7BD31BF38C
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9484281FE7
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9484281FE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RL-zRlfBlDti for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 21:50:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4316781FD6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4316781FD6
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 21:50:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 424E5E0007;
 Tue, 22 Nov 2022 21:50:13 +0000 (UTC)
Date: Tue, 22 Nov 2022 22:50:12 +0100
To: Marek Metelski <marek.metelski@grinn-global.com>
Message-ID: <20221122225012.18ef6ade@windsurf>
In-Reply-To: <20221107091658.25974-1-marek.metelski@grinn-global.com>
References: <20221107091658.25974-1-marek.metelski@grinn-global.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669153813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ShvPZtGwOyL1KYTFBCtnO5CNZrqwrI4rdQLJ3bPGBc=;
 b=m/U/PUiPXXAX28EvutwKjpmnx6H6+aPEddLyI7SjxSwJFuLsDgXIUn4PVfdNhr1aBhI8xE
 D9yv6kPYp98lgVParYTo7AsQrLnNwjwMlv8AE358CGg25FTV5FC+7lh+wUk+cxJX+KZxJW
 IHe3rRfLPz8XdJI/Use2t+QpFhFhn2JyKtMbFpLE/kHmlQX25WjlFvnhDLjwUfYfx/2sm7
 PP3jg/frxgUHHA2AdtRAIJYCObB5+TdQsc3PgKNsk3+N2bAp91diw15KtMz9qVeTXzGMTj
 8+S9tAYcp76GiB3s32UM9WEMxbY30GXLod4MufHvLlZGwWCGUJpJU2W8djTKMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m/U/PUiP
Subject: Re: [Buildroot] [PATCH 1/1] package/gitlab-runner: fix
 inconsistency of systemd and sysv daemons
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  7 Nov 2022 10:16:58 +0100
Marek Metelski <marek.metelski@grinn-global.com> wrote:

> Copy default $DEAMON_ARGS from systemd service to sysv init script.
> 
> Make GITLAB_RUNNER_USER home directory the same as default
> --work-directory (-d) flag.
> 
> Run sysv daemon process using root user (remove -c option)
> This is needed to correctly access config files as specified.
> System access can still be limited with gitlab-runner `--user` flag.
> 
> Use same $DAEMON_ARGS variable name so it can be overwritten in
> /etc/default/gitlab-runner environment file in both cases.
> 
> Signed-off-by: Marek Metelski <marek.metelski@grinn-global.com>
> ---
>  package/gitlab-runner/S95gitlab-runner | 6 +++---
>  package/gitlab-runner/gitlab-runner.mk | 3 +--
>  2 files changed, 4 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
