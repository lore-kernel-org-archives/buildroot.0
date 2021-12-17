Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CE6C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 20:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3648140C27;
	Fri, 17 Dec 2021 20:47:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8OIBdFH0XB-S; Fri, 17 Dec 2021 20:47:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6228F40C24;
	Fri, 17 Dec 2021 20:47:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B58BB1BF2F0
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 20:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0A2340C24
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 20:47:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zhu-c0QF5D8K for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 20:47:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60FBD40AF4
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 20:47:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 3BF0CFF805;
 Fri, 17 Dec 2021 20:47:41 +0000 (UTC)
Date: Fri, 17 Dec 2021 21:47:40 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20211217214740.2eb6c14f@windsurf>
In-Reply-To: <20211018132532.814742-1-herve.codina@bootlin.com>
References: <20211018132532.814742-1-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/modsecurity2: new package
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
Cc: Tom Marcuzzi <tom.marcuzzi@orolia.com>,
 Matthew Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 18 Oct 2021 15:25:31 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> The modsecurity2 package provides an Apache module implementing
> a web application firewall (WAF) module.
> 
> Based on initial work from Tom Marcuzzi <tom.marcuzzi@orolia.com>
> and Nicolas Carrier <nicolas.carrier@orolia.com>
> 
> modsecurity2 will be superseeded sooner or later by modsecurity v3
> ie. libmodsecurity [1] and its Apache connector [2]. libmodsecurity
> is already supported in Buildroot with its Nginx connector.
> According to the Apache connector web page and the discussion [3],
> the Apache connector is not ready for production use.
> 
>   [1] https://github.com/SpiderLabs/ModSecurity
>   [2] https://github.com/SpiderLabs/ModSecurity-apache
>   [3] https://github.com/SpiderLabs/ModSecurity-apache/issues/80
> 
> The best we can do now is to still use modsecurity2 (v2.9.x) for
> Apache:
>   https://github.com/SpiderLabs/ModSecurity/tree/v2/master
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Thanks, I've applied after:

 * Adding a bunch of additional --without-<something> to disable
   optional dependencies that are not handled

 * Adding a dependency on pcre, which even if it is already guaranteed
   to be there from Apache, is used directly by modsecurity2, so it
   makes sense to express this dependency.

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
