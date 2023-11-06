Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFDEC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84C7B42158;
	Mon,  6 Nov 2023 22:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84C7B42158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y5q-XmNk0J_f; Mon,  6 Nov 2023 22:28:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF1B542161;
	Mon,  6 Nov 2023 22:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF1B542161
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D75D11BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCDB3414BD
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCDB3414BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JHMMXMbM6niC for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:25:51 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7B1441183
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7B1441183
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF13E60005;
 Mon,  6 Nov 2023 22:25:48 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:24:38 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232438.75abaef5@windsurf>
In-Reply-To: <20231105051052.2831664-1-james.hilliard1@gmail.com>
References: <20231105051052.2831664-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VoENo9fXg1NGwE+ru6CzQRtRP0XgxTc92WSa3yPsMLE=;
 b=HweQhAcDWrePVBZJHS0v9rLU/Nf9LlIetMfgVeBMDrO5jgfSYq22D1CD34MTESb/mEbyzE
 qZKDiqI+2NA6vl/mys92hUQX/k1a3So7NMnmVDG3/J+5ig36J7PwYGk/hG8vJAJE6uEkJq
 xSZWzp4Xc1b/cYCW9QVWI2KPbXJ/iEpdSnscuFCmMS/3D7sIE9DmC4qbY66uvMBmkAjOuo
 fLYhGu5OB8tLZ2yR+UJMIvjJbh0SEP8kunkAWG9BIxteyjkZPX4ZdtEztRl1uIQ6EU47Q5
 qKaCWshAbENd0j19USQwJFZZTH/FZdTGUkAHYG/91F7sQHDxHALQdN56fB82Jg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HweQhAcD
Subject: Re: [Buildroot] [PATCH 1/1] package/python-engineio: bump to
 version 4.8.0
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

On Sat,  4 Nov 2023 23:10:52 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-engineio/python-engineio.hash | 4 ++--
>  package/python-engineio/python-engineio.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
