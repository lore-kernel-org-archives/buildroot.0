Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0155EC0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 11:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F5A783B80;
	Sat, 29 Jul 2023 11:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F5A783B80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9_OuQ8Jho0Ni; Sat, 29 Jul 2023 11:57:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD13183AD2;
	Sat, 29 Jul 2023 11:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD13183AD2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 986921BF82C
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 11:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66ED84044A
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 11:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66ED84044A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bxIlWO67IL-3 for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 11:57:07 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B2F240182
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 11:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B2F240182
Received: by mail.gandi.net (Postfix) with ESMTPSA id 196C7FF802;
 Sat, 29 Jul 2023 11:57:03 +0000 (UTC)
Date: Sat, 29 Jul 2023 13:57:03 +0200
To: Maksim Kiselev <bigunclemax@gmail.com>
Message-ID: <20230729135703.4675de90@windsurf>
In-Reply-To: <20230516082340.1375834-1-bigunclemax@gmail.com>
References: <20230516082340.1375834-1-bigunclemax@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690631824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6dgeXhCAQ0MwDhDx7AoTDcC5pUBrUHGmsBe3EEeaufY=;
 b=HcwJNyjmSqt1YTKzqKJJZVYIUhUflbzmBRxW8A1S1w1LGMzClYnh6hytg5EZHQJphpY0V+
 20xIf4ww3EHGHi50EB0iAQTrW+wRT62lKo4CYhx3q0ma/qWZQpZ6ELT4gcuZ8rCnLrkb37
 3jqu0dDCVvmJqfCxY3H49XaZZPA0H7SSg/Ux9Kd9eEBmnuVNWXkO13Ca7ElC3OtXocBuDx
 DISV8iKI/NnNwuW2Qg9Km2+cQjF3lUBUTJwAmCSopCz4ZcR5hofGJajY034fDGwidaK6YT
 O2ZY6ErblXORfWHyUrpiaD3naNVhduVUPeaegutpfdXhXbehc/oAvInuUoe7QA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HcwJNyjm
Subject: Re: [Buildroot] [PATCH v1 1/2] package/fio: bump to version 3.34
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
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 16 May 2023 11:23:39 +0300
Maksim Kiselev <bigunclemax@gmail.com> wrote:

> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> ---
>  package/fio/fio.hash | 2 +-
>  package/fio/fio.mk   | 2 +-
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
