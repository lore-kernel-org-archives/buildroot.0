Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490E5C636CC
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 14:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFDB160F9B;
	Mon, 20 Feb 2023 14:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFDB160F9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s6WzxfVFem7S; Mon, 20 Feb 2023 14:07:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 217AF60E80;
	Mon, 20 Feb 2023 14:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 217AF60E80
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A9D01BF2B4
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 14:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CA3A41680
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 14:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CA3A41680
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lRQw3Tv5soee for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 14:07:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1311415EF
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1311415EF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 14:07:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 77C3E60005;
 Mon, 20 Feb 2023 14:07:05 +0000 (UTC)
Date: Mon, 20 Feb 2023 15:07:04 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230220150704.7ff37d71@windsurf>
In-Reply-To: <20230220112410.953669-1-fontaine.fabrice@gmail.com>
References: <20230220112410.953669-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676902025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=edKvQSodUuLmJil2rAGchGsoTd2h7iHVwFUz3LQXbMg=;
 b=AjaMCkaMpmMu4ne6Lr8n5S+D5t+gLPEQ4pY0/gvln35i0ClwFYTJK8hyFdYqZ3Dw+STJQo
 L+lOfiyl3SIRF8/GQxC42b2JsdidSoH+Fmxzt0Z6g3lowgIhwUbkpd/gGxem/Ut5Lx84nB
 A5lTmtaSZEiHJBGoD8f1iUjZmstwX47i9mk6W0wokYxREpY0JGS22SZ0ILU6dHvZUdmy0b
 1i240yg+8i0bna6Rzr8ZvIaYVrOXaJKmdV80QxpnFR+0Ch9DkA801i849svrD6m2puvUH8
 a4NjWW/roNfSj8AtKpRMAVgM7/7UZN8qAXTLLl9GVezac204UPliOL1TdWiBHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AjaMCkaM
Subject: Re: [Buildroot] [PATCH 1/1] package/glslsandbox-player: fix build
 with rockchip-mali
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 20 Feb 2023 12:24:10 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> + PKG_CHECK_MODULES([egl], [egl >= 1])
> +-PKG_CHECK_MODULES([glesv2], [glesv2 >= 1])
> ++PKG_CHECK_MODULES([glesv2], [glesv2])

Is this the proper solution, or is the proper solution to patch
rockchip-mali's .pc file?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
