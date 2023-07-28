Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C881EC0015E
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 10:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56F6140AE7;
	Fri, 28 Jul 2023 10:18:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56F6140AE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TVf6EDUIZD2R; Fri, 28 Jul 2023 10:18:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB78841882;
	Fri, 28 Jul 2023 10:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB78841882
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 622B81BF36B
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 10:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 327AF40AE7
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 10:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 327AF40AE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B1UOH5KSYyj0 for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 10:18:24 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 258D640ACB
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 10:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 258D640ACB
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5EDE40007;
 Fri, 28 Jul 2023 10:18:20 +0000 (UTC)
Date: Fri, 28 Jul 2023 12:18:19 +0200
To: Danny Wood <danny@rotronics.co.uk>
Message-ID: <20230728121819.73bd742d@windsurf>
In-Reply-To: <20230728101140.10998-1-danny@rotronics.co.uk>
References: <20230728101140.10998-1-danny@rotronics.co.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690539501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4XUXAebJtQuYUaaUkcwGFv5fApidFQdmQM7mpHnSrrg=;
 b=PU4jEIophIbgxyEv1U+e1qzauyPcRG2yG8catTbiO5EUMHseFZUYfmD5U81V96wqYvp+4T
 r42iu9+iMfTEQX6n+MQOfYqK5Zes2sYQnGwiKueFj7kizqpMoYTclkOA18ZkZ4SbT6/1AQ
 uw5VMzk6oSB4DOpQH49h0/5L45ZjgfB7D6EUQtpTu8lt5ChTqGH6lbY2t+cma6UuxgI9xY
 sz6p1gxxOAzP/bX3p3a/ZqwbXzZyaRkO8VpswBCdE1ROZXUgMDUdcCSQXVzeSoRkcBe2+p
 KkYRgBmzvIsd0InLB0Ar6HtrGsCX4jFRWD8hZt977LNeo2Ba+fur+aLvJ9uxQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PU4jEIop
Subject: Re: [Buildroot] [PATCH 1/1] package/mariadb: add optional systemd
 dependency
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

Hello Danny,

On Fri, 28 Jul 2023 11:11:40 +0100
Danny Wood <danny@rotronics.co.uk> wrote:

> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +MARIADB_DEPENDENCIES += systemd
> +endif

Thanks for the patch. Is there some CMake option to explicitly
enable/disable systemd support in mariadb? If yes, we will want to use
them.

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
