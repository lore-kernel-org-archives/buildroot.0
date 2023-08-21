Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABA2EE49AA
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 10:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2622C81E44;
	Mon, 21 Aug 2023 10:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2622C81E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MrXqFeekXjIM; Mon, 21 Aug 2023 10:44:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82AB281F68;
	Mon, 21 Aug 2023 10:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82AB281F68
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 78CCB1BF2C9
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 10:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AE158186B
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 10:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AE158186B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pHBhYjPQLUHC for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 10:44:53 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6D7381EA2
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 10:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6D7381EA2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 83C621C0003;
 Mon, 21 Aug 2023 10:44:49 +0000 (UTC)
Date: Mon, 21 Aug 2023 12:44:48 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230821124448.64a393a7@windsurf>
In-Reply-To: <20230820145659.1396012-1-ju.o@free.fr>
References: <20230820145659.1396012-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692614689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3xZ0K1PVOhM/fx4eJ597NupMm1PIEWhKa853WVPw3WA=;
 b=b2vFn2xp0L/WG0vHU29wj6enJzoICmNWcdA5yu79UpaSa9xWT5iUYkc6PcOYiBLYCrbpnI
 0eIGQJiMPrKfrC7lDNmyRFy8FOTwEvXvs00VdtQSkBqgTqRhMhN/xy3HQKcOBUBNlEquz7
 9X9ZXpevsd/Yydv7IoSg54SGDj+aQHfGcW2vBJeBfvTt9yJXtPFovS9NMWpIypfr2iofri
 WQEnt74UdZGE3ITvgtTAcKR6zB/TtRM5x69YNlVwlbFItXOmZQeto1mksnHKtIclT7cCyh
 VWawxa94k5cBfGkwovTYG/4ZiTAkn7gVubqqugXuWd+n6I2FhbZPmnpM23WN2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b2vFn2xp
Subject: Re: [Buildroot] [PATCH next 1/1] package/gnupg2: bump to version
 2.4.3
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

On Sun, 20 Aug 2023 16:56:59 +0200
Julien Olivain <ju.o@free.fr> wrote:

> See release announce:
> https://lists.gnupg.org/pipermail/gnupg-announce/2023q3/000480.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch next at commit 80a1e72 with commands:

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
