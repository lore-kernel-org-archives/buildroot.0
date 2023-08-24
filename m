Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1417AC27C40
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 21:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9893F41D87;
	Thu, 24 Aug 2023 21:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9893F41D87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PwUiFeRWKQ-N; Thu, 24 Aug 2023 21:16:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACA4941D7D;
	Thu, 24 Aug 2023 21:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACA4941D7D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 962E01BF84C
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F687405ED
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F687405ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zju2_r8zIMTh for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 21:16:19 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 658C8415ED
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 21:16:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 658C8415ED
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64D631BF204;
 Thu, 24 Aug 2023 21:16:16 +0000 (UTC)
Date: Thu, 24 Aug 2023 23:16:15 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230824231615.44df3647@windsurf>
In-Reply-To: <87y1i0cfjz.fsf@48ers.dk>
References: <SY2PR01MB2778500474B41D29E8E7D54C940AA@SY2PR01MB2778.ausprd01.prod.outlook.com>
 <20230801121118.72610acf@windsurf>
 <SY2PR01MB2778DE94AA435DAE575AAFD7940BA@SY2PR01MB2778.ausprd01.prod.outlook.com>
 <87y1i0cfjz.fsf@48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692911776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2icj6gSL5oZxbVebAbHMf/uY7x706O1VI0/eELPxrJ8=;
 b=B5XwO4PabEv/kz5ooIbQDyzVmQdPlZD9Co28cYSvdop9GJ9n3EKqjZoj93MtgDT3Bcj1ax
 s9nN3GzxkaGpQEEJJIMQSCJHB7q0wBpfTYr9nwI1qihSFMaJ5b8NGNs+wRa0HdjBz4sxXf
 Nt91t1ep71ig/+m0D9UA645QemU7/pmhUZmFlDWKkCY+mxfUGbAZJAlva74lNRpgXCf1yY
 p2Q/hjzHoTZwgIX9BMjr8koFQp5DO00R3vA8FQHtfzn1zHgj68XDD63dASuXMuHmlNxsZo
 TZKKbo0sDGdZW20/eipW+s38ZcMKkt6W84g0QsE1PGfkb7jy2FG0vfdzRQynbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B5XwO4Pa
Subject: Re: [Buildroot] Update schedule of sources.buildroot.org
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
Cc: Afshin Pir <Afshin.Pir@gallagher.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 24 Aug 2023 23:10:24 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> I'm back and now had time to investigate. The problem is the following
> commit that got added at the end of July:
> 
> commit 08171f1fd0c31165a39d79389300ddf9adb5bbb6
> Author: Bernd Kuhls <bernd@kuhls.net>
> Date:   Sun Jul 16 09:28:33 2023 +0200
> 
>     support/dependencies/dependencies.sh: require IPC::Cmd perl package for libopenssl
> 
> The machine handling s.b.o did not have the IPC::Cmd perl module
> installed, so all the source update runs would fail. I've now installed
> that and started a s.b.o update.

Thanks for fixing this!

Do you think the script could somehow be robustified to let us know
when it doesn't manage to do its job as expected?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
