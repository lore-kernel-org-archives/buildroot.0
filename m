Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC44EEB569
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 19:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2F2F41D71;
	Fri,  8 Sep 2023 19:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2F2F41D71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dZgucfw6dsLK; Fri,  8 Sep 2023 19:46:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFF8E41C25;
	Fri,  8 Sep 2023 19:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFF8E41C25
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 512231BF303
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 19:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FD7882EB5
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 19:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FD7882EB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DGwZ3Kq0P7aU for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 19:46:25 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8BB382EAD
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 19:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8BB382EAD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BE641BF204;
 Fri,  8 Sep 2023 19:46:21 +0000 (UTC)
Date: Fri, 8 Sep 2023 21:46:20 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230908214620.0d515173@windsurf>
In-Reply-To: <20230908192714.2716398-1-james.hilliard1@gmail.com>
References: <20230908192714.2716398-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694202381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ux+zl58o94JrSuLUArb3UNknbyyNQy1Ls+LfvqPsyjU=;
 b=GlbwI0aTpLgoFWKfOH6lt/Xa89/gC5Mmhes5j5mhX67/V5xL/erLCafhwScSSJkRheQ4iJ
 5WgtQU/IDXHgVI6iZfHCpwxJFqA26IP7vQtFNYNMz7doOWdSLSnby9Yk9wJjKIKHn6wJKj
 8uPARsTgjo1t7wKtvSu6exsKHyINLbZgtdlWvzY3HmfNuI81k5zdShnvWLoazBabhm4p7w
 QyELUFmxLV/+7cf5KOYy5QEjpjsa3V4KD7QZGuI0BhmcPsCI/vfldeSrjvkq9dut8Yvtnp
 XaxD1xvmwont+oj2gOImJMqLmJG1FEJw+bnYp55MoBaCSR+PigEMiAOwBgzW+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GlbwI0aT
Subject: Re: [Buildroot] [PATCH 1/1] package/cog: bump to version 0.18.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  8 Sep 2023 13:27:14 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> -COG_VERSION = 0.16.1
> +COG_VERSION = 0.18.0
>  COG_SITE = https://wpewebkit.org/releases
>  COG_SOURCE = cog-$(COG_VERSION).tar.xz
>  COG_INSTALL_STAGING = YES
> @@ -15,7 +15,7 @@ COG_CONF_OPTS = \
>  	-Ddocumentation=false \
>  	-Dmanpages=false \
>  	-Dprograms=true \
> -	-Dsoup2=enabled \

Shouldn't this have been changed to -Dsoup2=disabled as part of commit
dff67170f73959e6826ec3e87e892747f8d3a5fb, which changed wpewebkit to
use libsoup3 instead of libsoup2 ?

I think it makes sense to have this separate from the cog version bump.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
