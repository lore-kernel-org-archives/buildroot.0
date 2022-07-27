Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F6EC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 14:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B79AA82612;
	Wed, 27 Jul 2022 14:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B79AA82612
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rPCBWPoUlTgy; Wed, 27 Jul 2022 14:31:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C743281778;
	Wed, 27 Jul 2022 14:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C743281778
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA7621BF4E4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C087681754
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C087681754
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2tO3z57bWevh for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 14:31:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46B2381778
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46B2381778
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 14:31:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CE16D40008;
 Wed, 27 Jul 2022 14:31:34 +0000 (UTC)
Date: Wed, 27 Jul 2022 16:31:33 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220727163133.1852adcf@windsurf>
In-Reply-To: <20220115103754.1759593-1-fontaine.fabrice@gmail.com>
References: <20220115103754.1759593-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658932295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pErrzotlQrToFPnGMVMh9Lj8bggamopQZs/+CO4z0Bo=;
 b=nd37dqpdmm3hoVmVxgCpAomZgnFnVeHOb7k0CLCXGDcoBsX79Yx+4kP/I00RFG8ClrWEy0
 ZSnxS+3kuR/WCPU8wo/qiN8SC0Ht1fyA/AprsONQR8rdOFJ2yvN/XgxFhZu7jqd8kT9/8u
 +RQ6vWxLDy3gZK9oD5SuzijX3GGmLMifBdo3IpNa7z5uAbo1bjY8phTqU7NhoDBg8OLIDN
 SjUthe0IjmI8r2mStHR17qAiCC+gNCU+04LYV11AO4ZzWMAMdHOkVInglgxox7FSbCEXS8
 NMHOOXNMrh6oV6/j9vZb6funBtH8Kyz7wJaJCRkikjAnLTMQ6IUo1FyZsH5/xg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nd37dqpd
Subject: Re: [Buildroot] [PATCH 1/1] package/boost: enable all features
 except python on host
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

Hello Fabrice,

On Sat, 15 Jan 2022 11:37:54 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Enable all features except python on host variant as suggested by
> Yann E. Morin in
> https://patchwork.ozlabs.org/project/buildroot/patch/20220114171847.634174-1-fontaine.fabrice@gmail.com
> 
> Indeed, host packages have no way to express their dependencies on host
> boost
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

As Yann said in
https://patchwork.ozlabs.org/project/buildroot/patch/20220114171847.634174-1-fontaine.fabrice@gmail.com,
it significantly increases the build time of host-boost, and for no
good reason.

We discussed with Arnout, and we prefer to keep things as they are
today: progressively enable the host-boost features that are needed by
our packages, when needed. With luck, our CPUs will grow in computing
power faster than we enable host-boost features, and we won't see a
visible build time increase.

Worst case, we can always add package/boost/Config.in.host with some
blind options BR2_PACKAGE_HOST_BOOST_xyz that other packages can select
to request enabling a particular feature in a host package they depend
on.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
