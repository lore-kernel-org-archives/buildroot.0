Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6498C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A5EF81255;
	Sun, 30 Oct 2022 20:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A5EF81255
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MwKjRlVWoF49; Sun, 30 Oct 2022 20:26:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8925780FB9;
	Sun, 30 Oct 2022 20:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8925780FB9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 956191BF387
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79ECA402C3
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79ECA402C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ACTAiwRUhzde for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:26:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8DD94026E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8DD94026E
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:26:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4E59820003;
 Sun, 30 Oct 2022 20:26:30 +0000 (UTC)
Date: Sun, 30 Oct 2022 21:26:29 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221030212629.51bf650e@windsurf>
In-Reply-To: <20221014230905.3091021-1-james.hilliard1@gmail.com>
References: <20221014230905.3091021-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667161591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ciAJDJCv5m19Ykcw2ISLKg5jV441MjXe62wQkW3sFI=;
 b=o8NHvo44OV8xzQN4BDFNzEMd08z8yclaj3FPEUoDlJO64f4FpYxXL7p8j8etnCdv9MIfWn
 15X+AaiMZYEj96Xc2mnaqsy8fraV+1F66uA6aJRZsHkLl387MnoOms5pV+OoFu8QANmcMW
 0jd9N8HIvonGVEYUuo2gt9I3GsXuNqD2dH5a7LwMNTaJIwASuL2CkbJPJNT71YnTpwF79r
 R5dUiisPIfYI26mziG2+EPzlFZvJ4FwofxD+2BUfCKL7cquD6ug5wQu5lgl21qQJvnoMGw
 L3W3ld48PShaxJ8TSBbZbDziA03yiGeRn+RSseX3RZnYqjQ5KpQYAgCb0Lct7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o8NHvo44
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: identify silent make via
 firstword findstring
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Fri, 14 Oct 2022 17:09:05 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> +QUIET := $(if $(findstring s,$(firstword -$(MAKEFLAGS))),-q)

I must be missing something, but why is -$(MAKEFLAGS) used and not just
$(MAKEFLAGS) ?

Indeed, with "make -s --debug -k", $(MAKEFLAGS) is "ks --debug=all",
and therefore $(firstword $(MAKEFLAGS)) is ks, which is good enough for
the findstring s, no? Why is adding a - in front needed?

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
