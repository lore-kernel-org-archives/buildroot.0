Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44469EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 21:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE89F417A7;
	Tue, 18 Jul 2023 21:27:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE89F417A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jCzRczFMha9N; Tue, 18 Jul 2023 21:27:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1F3F417B8;
	Tue, 18 Jul 2023 21:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1F3F417B8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 238B61BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F065C60B4C
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F065C60B4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kBYYkTUYVvMz for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 21:27:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFBBE60A98
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFBBE60A98
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 21:27:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3EB4320004;
 Tue, 18 Jul 2023 21:26:59 +0000 (UTC)
Date: Tue, 18 Jul 2023 23:26:58 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230718232658.46a26f43@windsurf>
In-Reply-To: <20230716110913.3849024-1-bernd@kuhls.net>
References: <20230716110913.3849024-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689715620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GJlsdYvCKMSHMjT4rmOltSkoYXxlXFKnf1Wus8mwjHE=;
 b=OVRHtT5iEU4RBm3NHhJ7HW0OYNEg+FjYUlpKUSbj/B6pSeUQfW0orIOFemicInKol5zE9T
 t/bJkNYDPFJ/jKR8ArJTPTyhpxVjZDNUhCvu+dveDFGAvQVSi08Dv98972QY7EVNx9Vtlp
 TIfH9vlGvq4Gn/ilX6KxCawfrE9JejD9eiklpwYNRlQW+EVvPZ+hOQZcfeUUJjS8o7Cb+l
 ESB7AfFfgPEnTx6XVM5H1Di6vBKgzg7cRL7v69BdWJ7y4SXnsecjQ7/LOfuosR1fAUJyyL
 PP6FDoaQTpnFety5ZNNx60uR97RFpq2CJ3ZaN1UqDRxTR12HnM1jFx0rY+Zrzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OVRHtT5i
Subject: Re: [Buildroot] [PATCH v2 1/1] package/pipewire: bump version to
 0.3.74
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 16 Jul 2023 13:09:13 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog:
> https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/master/NEWS
> 
> Added optional dependency to opus, disabled features with missing
> dependencies in buildroot.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: reworked dependencies (James)

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
