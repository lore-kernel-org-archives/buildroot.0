Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B700CC4725D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jan 2024 11:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39A0442C9E;
	Fri, 19 Jan 2024 11:26:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39A0442C9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vhHqKsJrPVWJ; Fri, 19 Jan 2024 11:26:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97606428EE;
	Fri, 19 Jan 2024 11:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97606428EE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 034E01BF5A6
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 11:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFF1B60F01
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 11:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFF1B60F01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IVYUYliJBtAm for <buildroot@lists.busybox.net>;
 Fri, 19 Jan 2024 11:26:33 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DDF2E60EE9
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 11:26:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDF2E60EE9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26439C0008;
 Fri, 19 Jan 2024 11:26:31 +0000 (UTC)
Date: Fri, 19 Jan 2024 12:26:30 +0100
To: Stefan Ott via buildroot <buildroot@buildroot.org>
Message-ID: <20240119122630.3f58dad1@windsurf>
In-Reply-To: <20240119021124.92277-1-stefan@ott.net>
References: <20240118144823.5105c00f@windsurf>
 <20240119021124.92277-1-stefan@ott.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1705663591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ej9augCtw5lFjomIzrtQCs/GDkrSlh6CH/xIjJ+JaUk=;
 b=gIk1DQ6SyVr9itv8LuDlAFhmDN+p37HBu0IroTgGzBMKyMKFash1tVwCWIAp9GoiX422bU
 B7QF3fXh4JtK6h6tXDNW+z6Y6qMur1yNPAielVEBYnoLzSWbdCRBTo+tpSgHu91jWaT7tf
 FIwNqXmP11mRl6gds+INv/xD2kxanYgjYUTBWBggoT3nw6iKDIHVGdGqfLckg4wldWj1fO
 P9ZUUYXL1Uoe3tc8H/hyJe6BEbb7slg2zgwA/8Jmn5c6lEAy35eIWvOM+4nerrmshJh/hd
 lliWhp4oZImpbeJSkl65TcgG8czMnR11tzBRFRs0gA6y3ARoMdsWXFTssyUjGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gIk1DQ6S
Subject: Re: [Buildroot] [PATCH v2] package/sway: make systemd optional
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Thanks for the new iteration!

On Fri, 19 Jan 2024 03:11:23 +0100
Stefan Ott via buildroot <buildroot@buildroot.org> wrote:

> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +SWAY_CONF_OPTS += -Dsd-bus-provider=libsystemd

Which other values of -Dsd-bus-provider are available? Would one be
suitable for an "else" clause to this "if" condition?

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
