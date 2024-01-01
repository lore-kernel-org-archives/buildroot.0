Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518DDC4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FADE4356C;
	Mon,  1 Jan 2024 21:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FADE4356C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VZRxaSj1-MeZ; Mon,  1 Jan 2024 21:22:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E32624357F;
	Mon,  1 Jan 2024 21:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E32624357F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3AD251BF3F9
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DB50817A9
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:14:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DB50817A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oz8ydvqgxGTx for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:14:55 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A792581F03
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:14:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A792581F03
Received: by mail.gandi.net (Postfix) with ESMTPSA id 101F7E0002;
 Mon,  1 Jan 2024 21:14:52 +0000 (UTC)
Date: Mon, 1 Jan 2024 22:14:52 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240101221452.4473c4e9@windsurf>
In-Reply-To: <20231230203942.1211689-1-fontaine.fabrice@gmail.com>
References: <20231230203942.1211689-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704143693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bjkpmzMKb0VoFHFV7DGKa76+gLjwrC5FesRzO2O8FiM=;
 b=HEZAJ1U0jVzsv1WMxBZDicaAKfnu5dlyODZqsNylvNEhX5BB7fmTT4xw++Kz0a440Fpzmk
 vxL1GFQhhZp+Rx/dNCTw+dK/cGrw/kF+7n6vBipsZj9i+glsDNtbPxmlKXtZxgf1J9B/a7
 hdBweQTbKIrZqsSGeNPLnS+kJvHyYyzCkadeYBU/Cz2R4tfXtIP0ri4QmUDERf2TJPgLnR
 xQQFmT67Jx35k0ePFW9iM9wxF0ERUofyqufsIhm+jX3I0v73O38fCnFzej6F6FLPaeSKha
 uK6BK4o2LU7NHEhYZKGDmRozrCuFc+FD63h2gea/fPBhWz9E6z6Q9D9pYcJgBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HEZAJ1U0
Subject: Re: [Buildroot] [PATCH 1/1] package/librelp: bump to version 1.11.0
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
Cc: David GOUARIN <dgouarin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Dec 2023 21:39:42 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/rsyslog/librelp/blob/v1.11.0/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/librelp/librelp.hash | 2 +-
>  package/librelp/librelp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
