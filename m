Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B5BC54EE9
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 19:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CE6E81951;
	Sun, 25 Sep 2022 19:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CE6E81951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QhgBjhdGHp3r; Sun, 25 Sep 2022 19:47:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B05938188A;
	Sun, 25 Sep 2022 19:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B05938188A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EEEC1BF577
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 19:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F174C405C7
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 19:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F174C405C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D-W4B5O4yukO for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 19:47:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB40E404A8
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB40E404A8
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 19:47:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 33577C0004;
 Sun, 25 Sep 2022 19:47:02 +0000 (UTC)
Date: Sun, 25 Sep 2022 21:47:00 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Message-ID: <20220925214700.5e222e95@windsurf>
In-Reply-To: <20220913174039.182887-2-thomas.claveirole@green-communications.fr>
References: <20220913174039.182887-1-thomas.claveirole@green-communications.fr>
 <20220913174039.182887-2-thomas.claveirole@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664135222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/4HVJtzOFFQUS00Gax+HQGK8CuIxdD3k30ZxxutrI8=;
 b=U2WmrgQcKgeJwYyDn81MGq1/hi2tg74TNMXyV0vSsUscJhSwPFv9wwQrYuj+DAH7e905e3
 UDp1wA0pyGAjdXqAwGARaW3bM+Wke40W8FamiWCJ/+PqceTL9jdahEoGogpkXkTGHju9h+
 OocF7DxqScBSX96fqJ3I5NxhV1VwLXQX6XQ1cIGe2ZpayzEOye3Skt6SANwywTt5Sayf1q
 kE7yJ3tF3TaUbKgCcJWQ8fIOUwCuaUrwhgZS78PKfjO/5rDcoZQASSO2JjNAfL/p1R5ZZL
 eFo4qkBgIXM3OZK3xSvXT20jzo/elLrkIWbjpkK9hTnoJ9lgwdrRGTivQxL7BQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U2WmrgQc
Subject: Re: [Buildroot] [PATCH 1/2] package/nodejs: introduce
 BR2_PACKAGE_HOST_NODEJS_COREPACK
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Johan Oudinet <johan.oudinet@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 13 Sep 2022 19:40:38 +0200
Thomas Claveirole <thomas.claveirole@green-communications.fr> wrote:

> +ifeq ($(BR2_PACKAGE_HOST_NODEJS_COREPACK),y)
> +define HOST_NODEJS_ENABLE_COREPACK
> +	$(COREPACK) enable
> +endef
> +endif

Could you explain in a bit more details what this "corepack enable"
actually does?

Indeed, I was documenting myself a little bit on pnpm, and
https://pnpm.io/installation says that "corepack enable" will
"automatically install pnpm on your system".

So is "corepack enable" download extra stuff? If so, it's not great at
all to have this executed as part of the installation step of a
package. Or is pnpm shipped as part of nodejs, and that simply installs
it?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
