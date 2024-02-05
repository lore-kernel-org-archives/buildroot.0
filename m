Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB55C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA2F840108;
	Mon,  5 Feb 2024 11:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA2F840108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zDROii5r6_a6; Mon,  5 Feb 2024 11:02:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC69F40AEE;
	Mon,  5 Feb 2024 11:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC69F40AEE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 79B041BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2690981FA6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:02:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2690981FA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qjSZUwMj_mum for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:02:24 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AA79813FE
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AA79813FE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 561B160006;
 Mon,  5 Feb 2024 11:02:22 +0000 (UTC)
Date: Mon, 5 Feb 2024 12:02:20 +0100
To: Yang Li <yang.li@amlogic.com>
Message-ID: <20240205120220.590fe561@windsurf>
In-Reply-To: <20240124082835.1995939-1-yang.li@amlogic.com>
References: <20240124082835.1995939-1-yang.li@amlogic.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707130942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ygIjP7E2NZ4nJMHwOKi4VLEKRKAHTeLiG2YAc5g/JW4=;
 b=NSbKEYoL0ic2OSc5TBAWvrgLl/F0kRv331JOZCfz0xlA6nt4gG0Pa9DX0UmVoxyZ7Xm40Z
 Rwea/d2bbGSNv6Zis51imk05/mwkSZeDWauurnevsd/0KNiIXv+JhPLgdVxHNjeGM3aINp
 vYF8aeRN9hHDG3NzEyG2PdEQPTr61cc9BKt/3B6G1S6vx5RZBXTdaDm7nsJKsfbKojUGNk
 FyTlxy2wnu/G1Kh1lccKp5SuFJL3uJoLlZKFqF0qqaTlURd7ER8gb8BbGHRarwVbD0B3U8
 3HJoTZUnosxoZYKL02nQo+MhWs9DIooCmheztAHpurVj7ZqZu/AfBCXVtDHbjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NSbKEYoL
Subject: Re: [Buildroot] [PATCH] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.72
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

On Wed, 24 Jan 2024 16:28:34 +0800
Yang Li <yang.li@amlogic.com> wrote:

> Changelog:
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/ChangeLog
> 
> Removed patch which is included in this release.
> 
> Signed-off-by: Yang Li <yang.li@amlogic.com>
> ---
>  .../bluez5_utils-headers.mk                   |  2 +-
>  .../0001-configure-Check-ell-path.patch       | 35 -------------------
>  package/bluez5_utils/bluez5_utils.hash        |  2 +-
>  package/bluez5_utils/bluez5_utils.mk          |  4 +--
>  4 files changed, 3 insertions(+), 40 deletions(-)
>  delete mode 100644 package/bluez5_utils/0001-configure-Check-ell-path.patch

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
