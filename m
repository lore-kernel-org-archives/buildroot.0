Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9494C001E0
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 22:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A9C840BC7;
	Mon, 31 Jul 2023 22:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A9C840BC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WwoUlRDVWDoG; Mon, 31 Jul 2023 22:09:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 632C140C2B;
	Mon, 31 Jul 2023 22:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 632C140C2B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62FFF1BF369
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C126D402A8
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:08:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C126D402A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3JnFhTTw_aec for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 22:08:46 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A44D04096A
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 22:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A44D04096A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BD66240003;
 Mon, 31 Jul 2023 22:08:43 +0000 (UTC)
Date: Tue, 1 Aug 2023 00:08:42 +0200
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20230801000842.4961386b@windsurf>
In-Reply-To: <20230315170518.884906-1-romain.naour@smile.fr>
References: <20230315170518.884906-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690841323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1XIZQ5HS1YUeykz07+5G5gdPx/fkZ0k37WJy+FdVrOw=;
 b=T4BTazzr4jOs1Hsnt1KSSCtozx2hrKGgDfjc77uT3HHZsSb08+ZtHByxZ4rwF6NVbGXFan
 lVqRd5Lqm5KcwAko0760d7lOH2NkRaTGP/Na/uwCW7Q1bwzDhzaddCmxf4ZKKQu1lZ4OUx
 fJugNnH2z7avowD+53L2vMvyrlcHwEsSwq+nu3myQugxAJz4NJOsXJtB4UDkn8P7ah4a6/
 UH2JcMiwA8wIf7CC9/VUlkVBpnU7z+V9r7rh0qYtSxbBiEmgCDS+dh1lqlO7M1Bl0nfXyD
 v6ldFr2ExJrZSSVkKQfiAy+1dKtsj2cqlaUyJEcBTnn9KqkeycpvgJHK8Ha8BA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T4BTazzr
Subject: Re: [Buildroot] [PATCH] package/xenomai: fix testsuite install
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
Cc: Pierre Ficheux <pierre.ficheux@smile.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 15 Mar 2023 18:05:18 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> From: Pierre Ficheux <pierre.ficheux@smile.fr>
> 
> Since commit [1], the testsuite build is unconditionally disabled
> although we have the option BR2_PACKAGE_XENOMAI_TESTSUITE to
> install Xenomai testsuite on the target.
> 
> Handle --disable-testsuite option with BR2_PACKAGE_XENOMAI_TESTSUITE.
> 
> [1] 74196b7d059684e555a87e5409c21c56c727066b
> 
> Signed-off-by: Pierre Ficheux <pierre.ficheux@smile.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/xenomai/xenomai.mk | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)

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
