Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E26DC32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 20:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6F79405BA;
	Tue, 23 Aug 2022 20:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6F79405BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6mKp1aAY93cF; Tue, 23 Aug 2022 20:00:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04D3A40447;
	Tue, 23 Aug 2022 19:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04D3A40447
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EADD51BF275
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9137281336
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9137281336
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pl1Hs6VEHGfv for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 19:59:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67CFA8132C
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67CFA8132C
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:59:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2F04D240004;
 Tue, 23 Aug 2022 19:59:53 +0000 (UTC)
Date: Tue, 23 Aug 2022 21:59:52 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20220823215952.4e2138ac@windsurf>
In-Reply-To: <20220822152339.2188387-1-thomas.devoogdt@barco.com>
References: <20220822152339.2188387-1-thomas.devoogdt@barco.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661284795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hliwvhzN8E+g+H++4i3kfqCmosbMHk0FrfhBe8SnH5o=;
 b=HXl4YLXV/eCoIum1dyA33iC2yIEqGCkRl8ChIDQ8y07jxmbcK5JX9KM1YCkf+1XdRuck+h
 UyHb9HD78ZT/Ytmf+i37uSTtkPXPFnEqfgoAxBXDZJnbAV0tI3+56bpvOsGe7YAznLqckh
 /DJZ+s/v5JAnwMjgT9tz0+MYDfN3xTGrpBOXUJocLDEKF0yAGw++rE4bgPcCvEIIv6BJ9s
 CEhPri3z6AiYsNe1nBarT3PgEhmielFoML7IU8zq2XnGVbvC6mwGpxRd/epH/OdIu2iEVI
 0eJTS7pzO7g9zx055jx5SbwGGD0vjz0s9paX7tSpKqZtOkoblPQ2HTcySNE9BA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HXl4YLXV
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: drop unused flag
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Aug 2022 17:23:39 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> Upstream dropped in:
> https://github.com/WebKit/WebKit/commit/aa6631a6189aaa4541a2d2e89993a4989103d161
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---
>  package/webkitgtk/webkitgtk.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied to master after extending the commit log to indicate what was
the first webkitgtk release that included this change, so that we know
if this patch needs to be backported to our stable branches or not.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
