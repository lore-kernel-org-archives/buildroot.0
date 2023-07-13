Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F6EC001DE
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 20:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FF07417CF;
	Thu, 13 Jul 2023 20:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FF07417CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dN2cwy8eofAa; Thu, 13 Jul 2023 20:26:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFA44417C6;
	Thu, 13 Jul 2023 20:26:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFA44417C6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD9741BF3D0
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8655C42151
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8655C42151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HTjMgFezxBer for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 20:25:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 612B342149
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 612B342149
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 20:25:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8858FE0005;
 Thu, 13 Jul 2023 20:25:54 +0000 (UTC)
Date: Thu, 13 Jul 2023 22:25:52 +0200
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230713222552.7029da9d@windsurf>
In-Reply-To: <20230713073854.19510-1-ps.report@gmx.net>
References: <20230713073854.19510-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689279955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V7rPD92GlXPQOuChY9QGgfNM+LuOyus73NHBlLGrGk8=;
 b=pXfsIrH+gTIY5FCJuHkoduSoXFrvuPkW2B22kxQMuobc/w8DlE3/JmjPtxL1rTwOvmzIYx
 DRFuJh9FiGKZ6tI8e1kl6MNutxoiRTEJw/a+x8mxUtjDi7+qaQxXAwCXHZv3xSR0RaZDZE
 9tOIcPNBfzNzSu+STkTvXa6L7WxtEwjFiSFPTtNu/FoESj4ReMSzkfO1G1R7hyCH1z0ZJL
 njsR5N/bl2RKzNnWSSfaAAYL0BGyEn+1wQepuIH1Cq8/K9NgGi6WUkd3cC0nHy1lfz2zG/
 /WBY8InJcHkS6LwIAodXhcHKZ4twMjcuGm7pKxRmFnDH/iSrI29H1pgbOAYOWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pXfsIrH+
Subject: Re: [Buildroot] [PATCH v1 1/9] package/python-click: bump version
 to 8.1.4
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
Cc: Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 13 Jul 2023 09:38:46 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/python-click/python-click.hash | 4 ++--
>  package/python-click/python-click.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Series applied, thanks. On the patch adding python-blinker, I've added
an entry in the DEVELOPERS file, since you're adding this package.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
