Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F963C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 19:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 051134091C;
	Tue, 23 Aug 2022 19:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 051134091C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0kdvXtHeYzyf; Tue, 23 Aug 2022 19:35:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB176408DB;
	Tue, 23 Aug 2022 19:35:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB176408DB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C4171BF39D
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE07881951
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE07881951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DKSaPENhrqhU for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 19:35:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4F66813F5
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4F66813F5
 for <buildroot@busybox.net>; Tue, 23 Aug 2022 19:35:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E45671C0005;
 Tue, 23 Aug 2022 19:35:15 +0000 (UTC)
Date: Tue, 23 Aug 2022 21:35:14 +0200
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20220823213514.7edef928@windsurf>
In-Reply-To: <20220822080923.31060-1-mf@go-sys.de>
References: <20220822080923.31060-1-mf@go-sys.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661283316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0L/laK5VCf8jZVp8gGZb/HUutxfXbEN2G2B59BuCObE=;
 b=ZCrewRgHSveJLT1yWOBUnOZAqrg2RZVXpoaewhSie/HXXGZBGCh2xF4M0dx+iNu+sTEMbr
 PdmOW7uiSR/YpgfcjrMlEn6QmWqEFLLT2tLtiqqmV1RMeLNb5p6RQkb9AnD1Ahaf6kqR/r
 zpMcET6QVVpD/oovcAvYmpVqBYAvrHaQamr90LcC8LihiVnhHUDMt5PGSQzXA3rtA4ak8R
 tlEZtNg/32UIw3fdOHYs6mnMlOL4g4eWsAEXDvinVn5+lzqzDzZPV6FI933jzHlehiIoe3
 Zw6/08/MPoIl6IP1J7BddLuslyvuSX/RGzWpS1hdNMqLjYo5kkrKOhRzEfTnBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZCrewRgH
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2_image: bump version to
 2.6.2
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Michael,

On Mon, 22 Aug 2022 10:09:23 +0200
Michael Fischer <mf@go-sys.de> wrote:

> Fixed a number of security issues

Could you clarify which security issues?

When I look at https://github.com/libsdl-org/SDL_image/releases, 2.0.5
did fix some security issues, but we're already using 2.0.5. For the
next releases, I only see new features, or fixes for regressions.

Am I missing something?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
