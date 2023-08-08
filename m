Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AD4C001DE
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 17:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9564881886;
	Tue,  8 Aug 2023 17:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9564881886
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3VaSmZkC-ACe; Tue,  8 Aug 2023 17:34:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9D63817B3;
	Tue,  8 Aug 2023 17:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9D63817B3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C1BD1BF59C
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 17:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23E8540361
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 17:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23E8540361
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aAWRpkHm5LHA for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 17:34:02 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9304D40360
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 17:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9304D40360
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84FEBFF803;
 Tue,  8 Aug 2023 17:34:00 +0000 (UTC)
Date: Tue, 8 Aug 2023 19:33:59 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20230808193359.4e622af5@windsurf>
In-Reply-To: <20230808003527.1469175-3-adam.duskett@amarulasolutions.com>
References: <20230808003527.1469175-1-adam.duskett@amarulasolutions.com>
 <20230808003527.1469175-3-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691516041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ICfSiVTLIiRVtE0qdR2VAuqUBOWZAqr3Di45l/7YWc0=;
 b=OHroo7frr8vCkA5sDdht3ZxFm+H/asApQ7oMOD4D7JOJCTDK2aMq9FQy7Xkgje8/Bs52kQ
 IYkgU+KeGKSFbj0welnHY0X4pCJmPpxDPgV/5dS3iTyBw6/WX8+GAZUzRQA11P+3cGDHwY
 /rikKsnKH1GvcpWRaY6+Nts7o4I0lj0rCn+QsWZrZfV5GWGcTEK0oV7pPkvZn+kD1v4W9j
 3NFZ9iVdoowj6wrfxcMsceEZA997yyFUBDU0xS1i7C8zdqXE0DwSF9APlqT456sIKvXGHx
 GWaPszjeIKckas/Rmqz/D636GAFZIECqnwH66E3VUjfZpXzyjaNEixgtK+qHAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OHroo7fr
Subject: Re: [Buildroot] [PATCH/next vRFCv2 2/3] package/depot-tools: new
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  7 Aug 2023 18:35:26 -0600
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> +DEPOT_TOOLS_VERSION = 4e87f5bfe244e903f712408ea68dc3c3a6fe2d00
> +DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools
> +DEPOT_TOOLS_SITE_METHOD = git
> +DEPOT_TOOLS_LICENSE = BSD-3-Clause
> +DEPOT_TOOLS_LICENSE_FILES = LICENSE
> +DEPOT_TOOLS_CPE_ID_VENDOR = google
> +HOST_DEPOT_TOOLS_DEPENDENCIES = \
> +	host-python3 \
> +	host-python-httplib2 \
> +	host-python-pyparsing \
> +	host-python-six

I was a bit surprised, because that doesn't match the dependencies in
the Config.in.host, but that's normal because not all host packages
have Config.in options.

> +define HOST_DEPOT_TOOLS_INSTALL_CMDS
> +	mkdir -p $(HOST_DIR)/share/depot_tools
> +	cp -dprf $(@D)/* $(HOST_DIR)/share/depot_tools/

I looked at whether there was a nicer way to install that. But in fact,
it's just a big mess of random tools, so OK installing to some random
folder in $(HOST_DIR)/share is probably the "right" thing.

> +# Helper wrapper to make using gclient easier.
> +DEPOT_TOOLS_GCLIENT=\

Minor nit: spaces around = sign.

> +	PATH=$(BR_PATH):$(HOST_DIR)/share/depot_tools \
> +	DEPOT_TOOLS_UPDATE=0 \
> +	$(HOST_DIR)/share/depot_tools/gclient.py

Otherwise, looks good to me.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
