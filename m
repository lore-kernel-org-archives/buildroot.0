Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11176C28D13
	for <buildroot@archiver.kernel.org>; Thu, 25 Aug 2022 08:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CF3161040;
	Thu, 25 Aug 2022 08:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CF3161040
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rk3q4zqSmN05; Thu, 25 Aug 2022 08:35:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDDA66103E;
	Thu, 25 Aug 2022 08:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDDA66103E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72C391BF37C
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 08:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3425683337
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 08:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3425683337
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pu29BaQ1URJa for <buildroot@lists.busybox.net>;
 Thu, 25 Aug 2022 08:35:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE82183300
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE82183300
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 08:35:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3A6491BF205;
 Thu, 25 Aug 2022 08:34:57 +0000 (UTC)
Date: Thu, 25 Aug 2022 10:34:55 +0200
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20220825103455.03e2135f@windsurf>
In-Reply-To: <20220825075334.3921399-1-jesseevg@gmail.com>
References: <20220825075334.3921399-1-jesseevg@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661416497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5orKduAjX+FenjSyrj0jW/b1AaItoUbJ2Jvo4w9/9FA=;
 b=P8GDcoHjiFMOrcAL5hctBOZw94gJBrnojexNg6GTmAs6Jv8HaUimLZfj/YB2mvyZ3tooNJ
 pjCKbsUJje3imP6ixKlFJrGIk9T+CdbyVahIXpT4Tfq+wge78AySl7+QNydJdHsXQyGdrl
 lT6V0m4TvDA/287QIuKZnpqGxPO7Rp9HfKQ/31ahBJxkX41PxRFr0oHgKcb1IAWBC1tqkM
 hEZ0LAU6OvDsSPL4ph56vKk8aqIxnXvAI/EF5Hq4028PQFBRDj/3cr2igwlawObzeaGgRu
 TzE2SiNGGGiFfAcdkJcYCfnP3eEgrzkKoFb1HBK3VqTiMBGBv2QDCxoT4xGBvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P8GDcoHj
Subject: Re: [Buildroot] [PATCH 2/2] package/qt6: add QT6_GL_AVAILABLE
 variable
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

Hello Jesse,

On Thu, 25 Aug 2022 09:53:34 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> My apologies, I forgot to add this variable in the previous patch, it
> is part of the qt6 extending as needed for GUI/OpenGL functionality
> 
> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>

Thanks for this patch. However, if your previous patch (not yet merged)
has a mistake, do not send a fixup patch. Instead, send a new iteration
of your patch, with the fix included. You will have to set a proper
version for this new iteration, like [PATCH v2], by using "git
format-patch -v2", as well as adding a changelog. See
https://buildroot.org/downloads/manual/manual.html#submitting-patches

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
