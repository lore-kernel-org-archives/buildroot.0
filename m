Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A50C636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D30C241799;
	Wed, 15 Feb 2023 21:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D30C241799
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qnh5ovvrsOtk; Wed, 15 Feb 2023 21:43:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D545F4179A;
	Wed, 15 Feb 2023 21:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D545F4179A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 641A81BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D6F881FC2
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D6F881FC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HV_7XgV1-iEj for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:43:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3022481FBD
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3022481FBD
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:43:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CCCC4E0006;
 Wed, 15 Feb 2023 21:43:24 +0000 (UTC)
Date: Wed, 15 Feb 2023 22:43:23 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230215224323.620a3462@windsurf>
In-Reply-To: <20230211144623.380475-1-dario.binacchi@amarulasolutions.com>
References: <20230211144623.380475-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676497405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hO+H/WHGTl7hZqUzO4bQooJp7bucRj8pSXBjr3TDVvY=;
 b=bMw7CWA9fQzwuiTnh0TiesxsfWLMh3Pf2Kt2s76OCN1ysw05lgS4ueaoMS2AHsvAlaN76O
 kXFY11nI5+dzlvSq7JnRrD2FAzaFY5BdX7kJUxjYUUR7MiZu0MBsJsptuZHt+jbj4VR8No
 CBQWqo5v6hauZZ7ihdqUxiBExmMhpycQkJ5yakpm2nrDrvn7u47+94wHOGQ69pF6jIjjrm
 OW77vXLdVowNPS46bQasThbn/s5l8h4E6ADz9pUPSeLBFL8n5MJB5D1ja4l2/nIZ3dk85B
 Ter8eTb3O+/FeOIyttBWstVJoCQtJR5GsyDEhkWCv4Z8jEOunGGh0isQxMwh1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bMw7CWA9
Subject: Re: [Buildroot] [PATCH v2 1/1] package/davinci-bootcount: bump to
 version 2.0.0
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
Cc: linux-amarula@amarulasolutions.com, Dario Binacchi <dariobin@libero.it>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 11 Feb 2023 15:46:23 +0100
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> - stm32mp1: support for STM32 TAMP_BKP21R bootcount register
> - tab formatting
> - gitignore: added autoscan files
> - updated documentation
> - i2c_eeprom: bootcount does not use two uint16s
> - am33xx: declare registers as 'volatile'
> - src/am33xx: do not close fd, it seems to prevent reliably writing register
> - configure.ac: update version, homepage
> - Added EEPROM read/write for non-TI AM335x platforms
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---

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
