Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C9CC636C8
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 02:36:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3000D611CE
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 02:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3000D611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0202740352;
	Wed, 21 Jul 2021 02:36:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GwJBFEm_5RtP; Wed, 21 Jul 2021 02:36:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9B7F4037E;
	Wed, 21 Jul 2021 02:36:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 48D6F1BF9C2
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 22:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40DF24018D
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 22:00:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id txHQw7kQyy0K for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 22:00:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2943D400EC
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 22:00:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 03E25FF80A;
 Tue, 20 Jul 2021 22:00:27 +0000 (UTC)
Date: Wed, 21 Jul 2021 00:00:26 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20210721000026.010fd8e1@windsurf>
In-Reply-To: <20210630173700.30975-4-aduskett@gmail.com>
References: <20210630173700.30975-1-aduskett@gmail.com>
 <20210630173700.30975-4-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 3/5] package/nginx-naxsi: bump version to
 1.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Frank Vanbever <frank.vanbever@essensium.com>,
 Samuel Martin <s.martin49@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Johan Oudinet <johan.oudinet@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720220026.svscB0dm9I-xnyPP9lr37cW_64Azp8Z4RNSOX3OBUwQ@z>

Hello Adam,

+Yann in Cc.

On Wed, 30 Jun 2021 10:36:58 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> -NGINX_NAXSI_VERSION = 0.56
> +NGINX_NAXSI_VERSION = 1.3
>  NGINX_NAXSI_SITE = $(call github,nbs-system,naxsi,$(NGINX_NAXSI_VERSION))
> -NGINX_NAXSI_LICENSE = GPL-2.0+ with OpenSSL exception
> -NGINX_NAXSI_LICENSE_FILES = naxsi_src/naxsi_json.c
> +NGINX_NAXSI_LICENSE = GPL-3.0 BSD-3c

This was not quite correct: it should be comma-separated, and the SPDX
identifier for BSD-3c is BSD-3-Clause. So I changed this line to:

NGINX_NAXSI_LICENSE = GPL-3.0, BSD-3-Clause (libinjection)

> +NGINX_NAXSI_LICENSE_FILES = LICENSE naxsi_src/ext/libinjection/COPYING
> +NGINX_NAXSI_DEPENDENCIES = pcre

And also I think this new pcre dependency is not really correct. Yes,
the Config.in files selects BR2_PACKAGE_PCRE, but it doesn't mean
nginx-naxsi has a build dependency on pcre. In fact, nginx-naxsi
doesn't build anything, it only downloads code, and it's really nginx
that builds these external modules.

This was already discussed in 2016 when Samuel Martin added the
BR2_PACKAGE_PCRE select. See:

  http://lists.busybox.net/pipermail/buildroot/2016-September/172028.html
  http://lists.busybox.net/pipermail/buildroot/2016-September/172171.html

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
