Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA13BC32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 08:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4680441E2E;
	Sun, 18 Sep 2022 08:50:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4680441E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9P88t9gZr68R; Sun, 18 Sep 2022 08:50:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DAD2419A1;
	Sun, 18 Sep 2022 08:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DAD2419A1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B244C1BF282
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D69D60E14
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D69D60E14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ukj0iyp9hA-Z for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 08:50:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0379660A6F
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0379660A6F
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 08:50:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C88B3E0003;
 Sun, 18 Sep 2022 08:50:01 +0000 (UTC)
Date: Sun, 18 Sep 2022 10:50:00 +0200
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20220918105000.68549cfe@windsurf>
In-Reply-To: <20220826135503.20612-10-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
 <20220826135503.20612-10-jesseevg@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663491002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eNjjNRSWP9TfUdg0WRvR1Mngxupppt9/XLqv0a2TRcc=;
 b=GSepVahERmcFA6cIU2FVCiuuRqd/e3VNpWE6VAONWezhH5tdiKakjyddP46eYWu30fmhrW
 s4/DYa+6FZ2Zen6d/n9dX0+vDu+R3ttG4p11pLOA5xqHsGfyuxM7Jkmfhs5aoUmm++juRZ
 wkgnpRSFuOC26ksrkqKT+Ho+W27Bd+nmKfdf/uIJIMTTGxgEOpebMKm1k0FGTARVEE/fRK
 y1deHfq8k8JqZxgMdXQKUWcNToBBge99foXJOFhYG0p4KrPMwnaemBZIGfrvSxGdUYhe1Q
 7C9RAMRE5aWy5ocZsIEmrDnql1XF5esotXpK9sVdNEMVxCs6ntDGpGwVHZTfjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GSepVahE
Subject: Re: [Buildroot] [PATCH v4 09/29] package/qt6/qt6base: add qt
 support for journald when using systemd
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

On Fri, 26 Aug 2022 15:54:43 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> ---
>  package/qt6/qt6base/qt6base.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

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
