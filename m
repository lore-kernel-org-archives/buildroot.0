Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1577C43219
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 21:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75E6041186;
	Thu, 24 Nov 2022 21:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75E6041186
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GGkINaaCe1Rh; Thu, 24 Nov 2022 21:48:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2C3B41168;
	Thu, 24 Nov 2022 21:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2C3B41168
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8940B1BF311
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60E3060595
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 21:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60E3060595
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1cwJi9nCgzJA for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 21:48:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3029B60D6E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3029B60D6E
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 21:48:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 12DF540007;
 Thu, 24 Nov 2022 21:48:32 +0000 (UTC)
Date: Thu, 24 Nov 2022 22:48:31 +0100
To: yegorslists--- via buildroot <buildroot@buildroot.org>
Message-ID: <20221124224831.17cae90e@windsurf>
In-Reply-To: <20221123103022.17397-1-yegorslists@googlemail.com>
References: <20221123103022.17397-1-yegorslists@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669326513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D3cL4dENOprhFeXWWzjfDewYpzYDdeenId01bCZohUM=;
 b=UmvhMheAgaef4LXkpgQlxAtfdykHyPVL2Cv3p3sp9YSpZO3rgG8H0dPRZDJLs7lwM2s4qs
 MiWxSWz7+hrapVub0PSmDj5edii0vMa8/BL4IMFGCC6X8/tEr/KSR5S2gt4vSBFz5htrti
 1FjKyMSUD+eskSGyLOEDay4DdToKa0wvMjAH2fFsGpS2DBShRNQP64+O9uriD+6xUQAl+v
 NFnxp+VZG3HDrC7gUUFE+hp89t0kH7ERHXzDasUdCNkiOaYVXl4i7Gpc4BAi98eRbbcRdM
 xXOuYUgLZOvuLu2Wph8kNifu7sARwlejH+lHUSW67RawKoiI44aK6LTHXDjiZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UmvhMheA
Subject: Re: [Buildroot] [PATCH branch/next] package/python-dicttoxml2: new
 package
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 23 Nov 2022 11:30:22 +0100
yegorslists--- via buildroot <buildroot@buildroot.org> wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Add a maintained fork instead of the abandoned dicttoxml.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in                                |  1 +
>  package/python-dicttoxml2/Config.in              |  8 ++++++++
>  package/python-dicttoxml2/python-dicttoxml2.hash |  5 +++++
>  package/python-dicttoxml2/python-dicttoxml2.mk   | 14 ++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 package/python-dicttoxml2/Config.in
>  create mode 100644 package/python-dicttoxml2/python-dicttoxml2.hash
>  create mode 100644 package/python-dicttoxml2/python-dicttoxml2.mk

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
