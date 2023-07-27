Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C395FC001DC
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 10:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4337141B18;
	Thu, 27 Jul 2023 10:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4337141B18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Jai080LaqkK; Thu, 27 Jul 2023 10:49:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41C6941907;
	Thu, 27 Jul 2023 10:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41C6941907
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 04D0C1BF40B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D299B60E7C
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:49:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D299B60E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RKMQYcoSc33o for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 10:49:23 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C987F60E73
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 10:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C987F60E73
Received: by mail.gandi.net (Postfix) with ESMTPSA id C94F8FF802;
 Thu, 27 Jul 2023 10:49:20 +0000 (UTC)
Date: Thu, 27 Jul 2023 12:49:19 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230727124919.0d4b50e3@windsurf>
In-Reply-To: <20230726163859.480495-1-bernd@kuhls.net>
References: <20230726163859.480495-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690454961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IlPZfsflO0yifxml9nfxiJoXYkxffNrvBLKlrXwHEL0=;
 b=k3EnJ+CBFJ94+CZJ+X5y+tdH3YyI7/jv73MY1MNB4gYLDXwdHdsuLQ6WaRzUVKb2ClBFoE
 oMqRrPkkas9Bd+BJWtuz5WHTbLDIO/MFFjDWlmHPf1eB30DCXngBNKj/6uhI/7snxAGyC6
 sxWVjLIOxelPhP2vqKxljD2cVL8CWnx/SQOCWAujEgjeztTHO3JN8SYqdJ4IENU7lw6bH5
 eVAFqrIll1DCgwK4rr0madea+5D99MubbK91Zrbhdb1yMGhlhOSpoyE8HfwzzxUaaOsJ8f
 YALahXBrqhw0DtuX89McTI393ZDs84w8x0831MGcwYTPLnaQT64hcOCi0dPISw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k3EnJ+CB
Subject: Re: [Buildroot] [PATCH 1/1] package/{libuv,
 uvw}: bump to versions 1.46.0, 3.2.0_libuv_v1.46
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 26 Jul 2023 18:38:59 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://github.com/libuv/libuv/blob/v1.x/ChangeLog
> 
> Switched libuv to tarball provided by upstream. removed autoreconf.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libuv/libuv.hash | 2 +-
>  package/libuv/libuv.mk   | 6 +++---
>  package/uvw/uvw.hash     | 2 +-
>  package/uvw/uvw.mk       | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)

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
