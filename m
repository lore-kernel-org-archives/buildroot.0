Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53850C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0366A60D4D;
	Thu, 29 Dec 2022 09:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0366A60D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ViyxGv86Kf8U; Thu, 29 Dec 2022 09:08:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 567BE60C31;
	Thu, 29 Dec 2022 09:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 567BE60C31
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 916791BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B39E404F9
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B39E404F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CS5lEQuP5rx2 for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:08:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2201D4034E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2201D4034E
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:08:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F0BC31BF20B;
 Thu, 29 Dec 2022 09:08:16 +0000 (UTC)
Date: Thu, 29 Dec 2022 10:08:16 +0100
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Message-ID: <20221229100816.436ab1b9@windsurf>
In-Reply-To: <VI1P190MB0493FD977027E500C3EB8CAC9FE59@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB0493FD977027E500C3EB8CAC9FE59@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672304897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Apj44t0NrGzre+jRp4+2AZNkHuWkTKBr5Ml7PYxFc3o=;
 b=cvDDb+kwabboOTzPnRuNX/eRje/Vwr+Q2+D1oDOhQtBKiqkCQZe1z/S+/bMXgrL1zSZ8yh
 wf8TgVSbKlUbknIEWG75F+PzRM8Lc8bDTtCWdfwW7durPM/ALXIZGXWrOs4iCs+JGz3cwq
 u/XB6Ti9ewTC4lmZ30yhPbTpun/5aScTP+ipBw9bSkQ40Cub7v3eKSPaIN4SUAOPpgKsL9
 cL3xVsi8qr2vOcR6EecsjRUZq+HV30fcV9wqqQdSXAGzqfNFIs9kXC+VlIs6qKejRpRtdC
 VYHrWEhpfZaB9iFZ0oXTlgxXOhNXEvCEQMnXuB1EYoOiMhhYyOlkzHvNEgYHRw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cvDDb+kw
Subject: Re: [Buildroot] [PATCH 1/1] package/dbus-cxx: bump to version 2.3.1
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
Cc: Lang Daniel <d.lang@abatec.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 19 Dec 2022 12:11:30 +0000
Lang Daniel via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
>  package/dbus-cxx/dbus-cxx.hash | 2 +-
>  package/dbus-cxx/dbus-cxx.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
