Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC40C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 18:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB7564015E;
	Tue, 26 Jul 2022 18:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB7564015E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iPkrx4jCe9jT; Tue, 26 Jul 2022 18:51:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBDA840463;
	Tue, 26 Jul 2022 18:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBDA840463
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 534671BF27C
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 18:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AC854015E
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 18:50:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AC854015E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5vVpSXGEumkk for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 18:50:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC35040156
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC35040156
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 18:50:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DF18920009;
 Tue, 26 Jul 2022 18:50:46 +0000 (UTC)
Date: Tue, 26 Jul 2022 20:50:45 +0200
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Message-ID: <20220726205045.6b14ec12@windsurf>
In-Reply-To: <20220208162409.496110-2-gwenj@trabucayre.com>
References: <20220208162409.496110-1-gwenj@trabucayre.com>
 <20220208162409.496110-2-gwenj@trabucayre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658861447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5JMju0cjc9Z1l7vc9EU6Y5E0Ng7Ice1W+UMfR0FrI9o=;
 b=K/5bPHWCjSWoWhjaSR9pH6p9N7VgSJg4ZFsk+3Li2Ui2YuQF0TE9ithXHq5euI54daUsBX
 RGD3dG5X+OcHAvcxdLP+NU6YxCpqRAUCdbLII3wraJcrTna5X0oLU3AmCbWphEb+odXJYu
 h87aw8mLPKSigngXRHRU4+Nj5+UiuXRcjpJkEkLMLvLXs7BCXOWxscTQ5X53zIExOKt9KD
 FsfVKHUt0PEgbXH+YfM+Z4bZpvQFE3SuXXuY7zpJ3d3GadDSb8vJZ4YIlW20ERIqMa9IU1
 95nIGS+jT2yrRhMqcbE7cwKKQlrwQvcpoY75fXVgWpt3fdNSIScmunavyfIr8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=K/5bPHWC
Subject: Re: [Buildroot] [PATCH 2/2] package/gnuradio: move to package/volk
 instead of using the internal one
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  8 Feb 2022 17:24:09 +0100
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Until recent releases GNURadio was shipped with volk as a submodule. With 3.9
> and 3.10 this is no more true and requires building volk before GNURadio.
> 
> This patch disable internal's volk, and add a dependency to the corresponding
> package, to use inconditionnaly the one build by buildroot 
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
>  package/gnuradio/Config.in   | 1 +
>  package/gnuradio/gnuradio.mk | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)

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
