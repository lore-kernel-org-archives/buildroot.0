Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2900C001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C8BA81EF7;
	Mon,  3 Jul 2023 19:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C8BA81EF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zBjOaZTgj0ye; Mon,  3 Jul 2023 19:57:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AABFA81EE4;
	Mon,  3 Jul 2023 19:57:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AABFA81EE4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A93E1BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E549D60DC6
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:56:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E549D60DC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bc1V_gi_CoIS for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:56:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1D7960BE9
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1D7960BE9
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:56:48 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7778C1C0004;
 Mon,  3 Jul 2023 19:56:46 +0000 (UTC)
Date: Mon, 3 Jul 2023 21:56:45 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230703215645.4e1d04fa@windsurf>
In-Reply-To: <20230702164026.3466342-1-bernd@kuhls.net>
References: <20230702164026.3466342-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688414207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nstWNzzZUMoqQYGHE07ZzEe0FDETwf4+PCO+nJuT3Es=;
 b=ExA5F8JLu4Tu/FxVpKgA11XWeegyUmYb3x/YRRFrZM+xfpkJB//68UOaHEhGgKoHOvibl9
 MaCjEA7l1OU3O7PTcQVTpyhO13Vn8hcv1gEARcSf1JXwPEvNYr5FSvO8mD0a6DogzRRwYT
 xeVmvnrUu3mQ9d2CBOcZ7Cs+Xc3neyjjD7+LnuFtHtxhjXaGXEswd3LbVjKP/kHvWZiKGI
 Vl+gXZ6lfsP9JgKVT/CbSk0HIyLOLI/k99FMSj4gjc6nCIJkcWS7SUjvhV/Q+p0BgO+AIp
 sDxKcs13CChB3oqnlUPIH6GJAqiljHVhM8yot4lH+LgilUwpZDwO4JS2B9b1Bg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ExA5F8JL
Subject: Re: [Buildroot] [PATCH 1/2] package/bluez-alsa: bump version to
 4.1.1
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  2 Jul 2023 18:40:25 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://github.com/arkq/bluez-alsa/blob/master/NEWS
> 
> Updated license hash due to copyright year bump:
> https://github.com/arkq/bluez-alsa/commit/165e15bce4f9c8dd6238ee8d105ab9fa857c63a1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/bluez-alsa/bluez-alsa.hash | 4 ++--
>  package/bluez-alsa/bluez-alsa.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
