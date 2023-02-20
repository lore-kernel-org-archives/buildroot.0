Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C8DC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C18FF70309;
	Tue, 21 Feb 2023 02:14:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C18FF70309
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YgYLrkuZTt0W; Tue, 21 Feb 2023 02:14:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 998877031B;
	Tue, 21 Feb 2023 02:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 998877031B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 751251BF310
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 22:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EB664F0FA
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 22:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EB664F0FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g_7Kgz-3k8Xc for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 22:33:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FB9C4D8B5
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FB9C4D8B5
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 22:33:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D20191C0002;
 Mon, 20 Feb 2023 22:33:03 +0000 (UTC)
Date: Mon, 20 Feb 2023 23:33:03 +0100
To: Konstantin Menyaev via buildroot <buildroot@buildroot.org>
Message-ID: <20230220233303.77bc24dd@windsurf>
In-Reply-To: <20230201060001.134150-1-KAMenyaev@sberdevices.ru>
References: <20230201060001.134150-1-KAMenyaev@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676932384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4+6Qyx3n7oNLXUp2AGQatymyyAth8qHYMtg91Q5OBWI=;
 b=ZiGpq2sqL9LjZL5NB9feUigjD+hb8bc+PD+hhVVroj3krzDcbHXtCxGKrPSY3nq6dLQv4b
 D34dYGz9O3UwQM+Fj83C7WL6HxMyPPed5N5Az9ZorMhnX/Jfz1hivxXN6jWK0Zr/McnNIY
 b4oNsAJKhMJ7WAPBmOouLBqpbXp9DwMn1Uw064x/bwd4CV4SJPnNKpnkF24mP4UB7d0rOK
 iSIjQ9E8669OhJbmyuMdbcCqpTToiYsqlpYcPPlwgUd6RRnSe3AJuUUzWCLFlc6ZBIoeuQ
 FwbjrYqQOWFbzkElxWcGHUa1HXeSV7SWG5bs3Fn29SxdUglxmWuZ3fA9H1f3lA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZiGpq2sq
Subject: Re: [Buildroot] [PATCH 1/1] package/tinyalsa: add option to enable
 utility tools
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>, KAMenyaev@sberdevices.ru,
 Asaf Kahlon <asafka7@gmail.com>, sdfw_system_team@sberdevices.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 1 Feb 2023 09:00:01 +0300
Konstantin Menyaev via buildroot <buildroot@buildroot.org> wrote:

> From: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
> 
> Add option to enable useful tools,
> like tinyplay, tinymix, etc.
> 
> Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
> ---
>  package/tinyalsa/Config.in   | 9 +++++++++
>  package/tinyalsa/tinyalsa.mk | 8 +++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)

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
