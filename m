Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D4FC32796
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 11:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17EEB40B4F;
	Wed, 24 Aug 2022 11:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17EEB40B4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m6NHJUaJvExE; Wed, 24 Aug 2022 11:34:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38D3140B54;
	Wed, 24 Aug 2022 11:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38D3140B54
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50D9D1C116E
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C9FE40B4A
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C9FE40B4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03K-vJ1pjR1u for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 11:34:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3C2140283
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3C2140283
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 11:34:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CF5AB60007;
 Wed, 24 Aug 2022 11:34:32 +0000 (UTC)
Date: Wed, 24 Aug 2022 13:34:31 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220824133431.23e2e3a2@windsurf>
In-Reply-To: <20220808215612.1805008-1-fontaine.fabrice@gmail.com>
References: <20220808215612.1805008-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661340873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=04C5tCJ+es9QSglvUzZcPmoeVYLAjgfjZmB6QgN5IVk=;
 b=COo0dL87pGWSOZ/0FUMxxerKqOXw1l6kJ3cUm/LZDY/LLqY4E6xoWDQvJibotPWWtzKqsg
 UQaXYfTPmAaP3++qFJMWq4NotU9nLpvmZzap0WedcZT0iBWB+ch3FojuEPNHWICngkJsQE
 P2I6O4uPtgwwBz94aefow767Qc1iIB1gt6pMYN10zb193wUkiB30bipqhgNzvVCIN+0kcL
 aq3bL1ulJj9wdhzRg/JQw5aDdLHGNh4AYjxKxCcv9YhTZ4eL0P6uaFo6bwDjfefJuFzkvh
 zM0CjFIlxtK+m+Pyn/i1VTQ8TNo6TPaJeBYQytAxvWYxOvWC50p1ZSG6K280fg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=COo0dL87
Subject: Re: [Buildroot] [PATCH v2,
 1/2] package/serd: bump to version 0.30.14
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  8 Aug 2022 23:56:11 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch to meson-package
> - Update hash of COPYING (update in year:
>   https://github.com/drobilla/serd/commit/0e7053de7086423484e5a8f2c0db76efba4ed257)
> 
> https://github.com/drobilla/serd/blob/v0.30.14/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Always set static to false

Both applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
