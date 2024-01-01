Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB532C4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EA9A409F1;
	Mon,  1 Jan 2024 21:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EA9A409F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zfOH87zu5QvQ; Mon,  1 Jan 2024 21:22:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92F7040AA4;
	Mon,  1 Jan 2024 21:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92F7040AA4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23C091BF3F0
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 735D181E9E
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 735D181E9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cm4EoOWFiRnF for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:15:10 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8625C822B7
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8625C822B7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5006DFF803;
 Mon,  1 Jan 2024 21:15:07 +0000 (UTC)
Date: Mon, 1 Jan 2024 22:15:06 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240101221506.7ee2c1af@windsurf>
In-Reply-To: <20231230212837.1384148-1-fontaine.fabrice@gmail.com>
References: <20231230212837.1384148-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704143707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wqHuW7rirFlP1dWXkN3tJD5MWgvbc12N3SLxS2XskcM=;
 b=RlJEJUAicezgWFn2XJSwCo9nexlVoE+1Mhe+zAMsBWjjUvKiHdKf7l6wFdm1VhBCD1csZM
 hxhMjJiXyfOLPzx35TW5B0cb6JYkL5kyZNYB/Drylu1UTqWZlY9dj7R9NjT2n4yrvVfvJo
 J6jCD4rjX3A6Gu0yT3EWRxsMuG59dxQqZnWssHnt4GBmyjhacbKhx9Nysnk9qj6GWKhtO7
 LVYsSVvhYlNsfbOAQUGvm+HQmgA6M4fEN/wQA+bJgkBKamSsMJ10VARa7OIL2CPkxiZER8
 eddJI4VcimE3YzB/4ZOqjPVS1tl6B3eBNkW7ZpYHmajJ5swQ8tg/hhXbZTEu8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RlJEJUAi
Subject: Re: [Buildroot] [PATCH 1/1] package/logrotate: bump to version
 3.21.0
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

On Sat, 30 Dec 2023 22:28:37 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/logrotate/logrotate/releases/tag/3.21.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/logrotate/logrotate.hash | 2 +-
>  package/logrotate/logrotate.mk   | 2 +-
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
