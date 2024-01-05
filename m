Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0BAC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 12:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DF89436BD;
	Fri,  5 Jan 2024 12:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DF89436BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NjW1paPaITtv; Fri,  5 Jan 2024 12:49:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B29C436D6;
	Fri,  5 Jan 2024 12:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B29C436D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C2FE1BF422
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5681283E86
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 12:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5681283E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5bFCtJrpku1B for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 12:49:32 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4273A812E6
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 12:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4273A812E6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 960C160004;
 Fri,  5 Jan 2024 12:49:30 +0000 (UTC)
Date: Fri, 5 Jan 2024 13:49:30 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240105134930.151f957e@windsurf>
In-Reply-To: <20240103071209.6187-1-bernd@kuhls.net>
References: <20240103071209.6187-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704458970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WiF/q+QGVHxVnWPpigl1PLzIMUQbj4wdJCcseTCKjis=;
 b=Lt6D+vJmZ9TGx7qIS/OPYe/3P55vewdPVffPiRiCcEJ20Xpk9Y+pkkkgA9hYhzzO4N0d3A
 mhlNeUcyczf1N57DrwvjgI3QLSiNv1pE1rQaOWYaNDcRtY1OMY8v7pxyUt9BerVLaAyENA
 kOQvu1+8gbl0Nsl2DnjTwbLMZXJno2tOJ40ItnIshcnuBVYSsTKPdkIeeWN1EL6Rc699My
 lv3+rDEwpsSdsWYCvhTluAOgyYufMYoFr05jORKOrDNUen36+cwa4Y6G2No/EVYtpBTqWG
 iYpEcUOHJw/btCExMBy0esSJXuCY/KkWmKeZBDzfzMOFjhDvHaAhqa1Mi/9uZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Lt6D+vJm
Subject: Re: [Buildroot] [PATCH 1/1] package/freeswitch: security bump
 version to 1.10.11
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

On Wed,  3 Jan 2024 08:12:09 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://developer.signalwire.com/freeswitch/FreeSWITCH-Explained/Release-Notes/FreeSWITCH-1.10.x-Release-notes_25460878/#11011-release-date-22-dec-2023
> https://github.com/signalwire/freeswitch/releases/tag/v1.10.11
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/freeswitch/freeswitch.hash | 4 ++--
>  package/freeswitch/freeswitch.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
