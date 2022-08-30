Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB19ECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 07:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3598581467;
	Tue, 30 Aug 2022 07:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3598581467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YfS6IZzinLsK; Tue, 30 Aug 2022 07:43:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46D73813C4;
	Tue, 30 Aug 2022 07:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46D73813C4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E900B1BF2C0
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 07:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C455760E6D
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 07:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C455760E6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bt_cIUEjsVWx for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 07:43:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E9B260E5C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E9B260E5C
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 07:43:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2850F60002;
 Tue, 30 Aug 2022 07:43:48 +0000 (UTC)
Date: Tue, 30 Aug 2022 09:43:47 +0200
To: Sven Oliver Moll <svolli@svolli.de>
Message-ID: <20220830094347.312e037c@windsurf>
In-Reply-To: <alpine.DEB.2.20.2208292318200.18923@defender.svolli.xa>
References: <alpine.DEB.2.20.2208291701140.18923@defender.svolli.xa>
 <20220829221845.135645e7@windsurf>
 <alpine.DEB.2.20.2208292318200.18923@defender.svolli.xa>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661845428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F4QSRCa1zmOl6UWmYvHBr2cyr9QjSfzy6FFUbKn3kSI=;
 b=hMwz6VIihQA9aGgVvRgnKUxOCwjaCh3FjfWX1leMnExpcOXPSROIGVyT1SvpIXunrAfYmu
 4sNn3WpQ/5OZ8iasZrzusDHLa2Rw5KIVqoUNfkNbPAx/5VLL9pGYrczHnDe06DqJHuCP6l
 aFxg3Jx1/TEJ4xiXSR3PYlt+9SbzMFqEWtM4RjHUSAXyryh7h9NnQRT0WHMOALbsn9s36H
 yXQqEbq2MUkrj8cH1EvwxDxzwxq2j2JKBPD9Auglcl98y4mjwH4vA0M8Wwk8UkgijVUwps
 vxDKDUiRyzDio26Yd4+D0IRsuGqsSXy5AYlGUeSPMsepfZY2Zwab4n7Ac576nQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hMwz6VIi
Subject: Re: [Buildroot] [PATCH 1/1] package/most: bump version to 5.2.0
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Sven,

(Replying with the Buildroot list in Cc, stripping parts that could be
considered not relevant for the list)

On Mon, 29 Aug 2022 23:33:13 +0200 (CEST)
Sven Oliver Moll <svolli@svolli.de> wrote:

> This also leaves me with a question: I did run my check by just running 
> "make all". Now I've learned that "make legal-info" is something that I also 
> should check. Are there any other make targets I should test also next time?

The most relevant tool is utils/test-pkg. You feed it a small snippet
config file, like:

BR2_PACKAGE_MOST=y

and it will build test this package against a useful selection of
toolchain configurations. And as part of this, it will also run "make
legal-info" and bail out if it no longer works.

Hope this helps!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
