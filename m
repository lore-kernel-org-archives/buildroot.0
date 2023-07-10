Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320EDC001E0
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B752281442;
	Mon, 10 Jul 2023 17:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B752281442
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0f8Rz65pjKih; Mon, 10 Jul 2023 17:23:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 065C6812EF;
	Mon, 10 Jul 2023 17:23:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 065C6812EF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0545B1BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFEE640B33
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:23:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFEE640B33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rnW1HFYjGDti for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:23:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A558F40A84
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A558F40A84
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:23:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71BB91C0002;
 Mon, 10 Jul 2023 17:23:33 +0000 (UTC)
Date: Mon, 10 Jul 2023 19:23:32 +0200
To: Titouan Christophe <titouanchristophe@gmail.com>
Message-ID: <20230710192332.39cd7ef4@windsurf>
In-Reply-To: <20230630132912.128835-1-titouanchristophe@gmail.com>
References: <20230630132912.128835-1-titouanchristophe@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689009813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mWGcTr116JYlzl5EtNCzqfw2AtjzKwnwkUFpSx3mzig=;
 b=et5nB5Naml/GMZ2I6cV+U52cLMWlx4TdZviZg2jFaWSoCI2WBjwy0hKlB4GLppWF5wEFwg
 6UgOxbHCrZFKlWljcDhV6H4h+zlLtsceTln9tJ0AojZtTojcNzWuH7zQH6MwT7Q0YSIN+j
 1l8x5pLqb5wQyMkZa8bYwHuN3nesDZbEj5RGY+1kr/LUFsi3W3ioFpvKU2ARPzDjVWHwpl
 bKn0JrgXbgr16aiscRfcTMzY9OnbPPmkqKOe6kX+tZdJqcJr9S+EhFxaxT4Y8keBhiaw/C
 Gs6FCSIXFeeLhXwXwhrFDehA67XQ9JCVU+6dnIzzOSsuGFA4EavuzfI4KCOAHQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=et5nB5Na
Subject: Re: [Buildroot] [PATCH 1/1] package/linuxptp: bump to v4.0
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Petr Kulhavy <brain@jikos.cz>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 30 Jun 2023 15:29:12 +0200
Titouan Christophe <titouanchristophe@gmail.com> wrote:

> - Drop patches that have been applied upstream
> - Drop hash that are not available on Soureforge anymore
> 
> Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
> ---
>  ...g.h-drop-clock_nanosleep-replacement.patch | 49 -------------------
>  ...itional-assignment-for-KBUILD_OUTPUT.patch | 43 ----------------
>  package/linuxptp/linuxptp.hash                |  6 +--
>  package/linuxptp/linuxptp.mk                  |  2 +-
>  4 files changed, 2 insertions(+), 98 deletions(-)
>  delete mode 100644 package/linuxptp/0001-missing.h-drop-clock_nanosleep-replacement.patch
>  delete mode 100644 package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch

Sorry, I'm seeing your patch only now, and I've applied another similar
patch from Jean-Michel Friedt in the mean time. Sorry about this :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
