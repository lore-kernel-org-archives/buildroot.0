Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56224E77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 22:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0628D402C0;
	Sat, 28 Dec 2024 22:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FBT7BOhrc0E6; Sat, 28 Dec 2024 22:33:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D04E540675
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D04E540675;
	Sat, 28 Dec 2024 22:33:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 912F2C8
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7797A409D3
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4GEMueMlTBIL for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 22:33:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4D0F84045A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D0F84045A
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D0F84045A
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:33:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1A7D40005;
 Sat, 28 Dec 2024 22:33:37 +0000 (UTC)
Date: Sat, 28 Dec 2024 23:33:36 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Cc: buildroot@buildroot.org, Christian Hitz <christian@klarinett.li>,
 Andreas Naumann <ANaumann@ultratronik.de>, Zoltan Gyarmati
 <zgyarmati@zgyarmati.de>, Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20241228233336.1657fa2f@windsurf>
In-Reply-To: <20241213115820.655993-2-roykollensvendsen@gmail.com>
References: <20241213115820.655993-1-roykollensvendsen@gmail.com>
 <20241213115820.655993-2-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735425218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FWrN8pwwYOk/Jm6FiVTI5jmXq1MQYUO5OFvGpIoumwk=;
 b=NNdUU8BtaWrnS+Z+t4otq7CWcn6HwlwMc4ww1wao13n+U3pIsUi2xtlJ3qYOMOyjYxhMZU
 B3DGu+DcpSvZc0t7WZRsQ6d1q1quwKoh9YbHA1Uii1CjRhIw7CwpAgyvMJsph8Spjtv91l
 t4ufHTGbzctrgj2K2AVzdN52Dc4dGD8qYac6EUAXw2qKXmheZX7LXTvsPD9/46WcLN81/9
 aznu1VEOC7wZR/DhJ4QqcQzpS3o5xxH0sCKkhj677GQmrP3qWBpueEh4+esUSwK9MEyRuH
 uhf60TkueJDURwqxhgUxRqee4Vm4DY8z+d5+bPraLk8w2ydd6lSEdcbHTsWvGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NNdUU8Bt
Subject: Re: [Buildroot] [PATCH 2/8] package/qt6: remove unneeded and
 problematic CONF_OPTS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 13 Dec 2024 12:58:09 +0100
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> As for the other parameters, BUILD_WITH_PCH, QT_BUILD_EXAMPLES and
> QT_BUILD_TESTS, I don't see a good enough reason for breaking the
> the existing pattern for only these two packages.

I've applied, but it would be good to check if tests/examples are built
by default or not, as building those for the host packages isn't really
useful.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
