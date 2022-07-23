Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271B5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 12:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C52A484AE3;
	Sat, 23 Jul 2022 12:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C52A484AE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OU8elvdrhksX; Sat, 23 Jul 2022 12:51:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4EFC849F1;
	Sat, 23 Jul 2022 12:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4EFC849F1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F4B01BF36E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A22941918
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A22941918
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M-nKwa_lPu7T for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 12:50:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89D3B41813
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89D3B41813
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:50:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0C24E240002;
 Sat, 23 Jul 2022 12:50:49 +0000 (UTC)
Date: Sat, 23 Jul 2022 14:50:49 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220723145049.515d8fb8@windsurf>
In-Reply-To: <e9f22a12-b37b-0dab-9a31-3c1149162e58@mind.be>
References: <20220101223900.2970405-1-who+buildroot@cnackers.org>
 <20220101223900.2970405-3-who+buildroot@cnackers.org>
 <e9f22a12-b37b-0dab-9a31-3c1149162e58@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658580650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NGlRbyoU6OQESX0fod0IZwjNjOq/ouxvDJIudC4hFwA=;
 b=F20ARFH8Rop85WayuIxaSuuyn5TIaTizrRWhsOYIowNe9tohsetxVQeNB0+NrSd3gb7+Dw
 6RSZeiIS7EtDU09dNb8LRi3Rcnq2OaAj3eJul82PBvVczwRYuHnqagkexdZEf8vKOl4ldp
 HnHj1Tg9TqAiKlYbxF1//C+xq1vGHD210V4fO6DPs7eYqpArhjMVWkfFhkhAf+tbcduDeN
 D0dJRpBjfFa8xCYEIrrJWhbhSLT/F3AdL1M/AoVgGOaniLkR/X/AqoYyCQpNwQ1eG2vB2X
 6WThH6bx+u7hJl8NHUB56lnHjZDuixqv/bwGu+wR648R5hxHECwsoopPwIZpNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F20ARFH8
Subject: Re: [Buildroot] [PATCH 3/3] package/tpm2-tools: add option for
 enabling FAPI tools
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
Cc: Erik Larsson <who+buildroot@cnackers.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 4 Jan 2022 18:54:41 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

> > +ifeq ($(BR2_PACKAGE_TPM2_TOOLS_FAPI),y)  
> 
>   Does this optoin make a big difference in size? If not, we'd normally make it 
> an automatic option, i.e.
> 
> ifeq ($(BR2_PACKAGE_TPM2_TSS_FAPI),y)

Erik had replied that the difference was 100KB in size, so I thought it
was worth having the extra Config.in option, and applied what Erik
proposed, with some small changes.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
