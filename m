Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C303C4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 21:32:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 112396069E
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 21:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 112396069E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBE4C40658;
	Wed, 28 Jul 2021 21:32:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eCzqIMj6Luox; Wed, 28 Jul 2021 21:32:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C1ED4054E;
	Wed, 28 Jul 2021 21:32:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F4641BF5B4
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 21:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B0B28333F
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 21:32:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WC9uH2jkEo1p for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 21:32:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3311482CCB
 for <buildroot@busybox.net>; Wed, 28 Jul 2021 21:32:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id E162CFF803;
 Wed, 28 Jul 2021 21:32:08 +0000 (UTC)
Date: Wed, 28 Jul 2021 23:32:07 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Maxim Kochetkov via buildroot <buildroot@busybox.net>
Message-ID: <20210728233207.620f41d4@windsurf>
In-Reply-To: <20210428041216.22955-2-fido_max@inbox.ru>
References: <20210428041216.22955-1-fido_max@inbox.ru>
 <20210428041216.22955-2-fido_max@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 2/2] package/osm2pgsql: new package
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Wed, 28 Apr 2021 07:12:15 +0300
Maxim Kochetkov via buildroot <buildroot@busybox.net> wrote:

> osm2pgsql is a tool for loading OpenStreetMap data into a
> PostgreSQL / PostGIS database suitable for applications like
> rendering into a map, geocoding with Nominatim, or general analysis.
> 
> https://osm2pgsql.org
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  DEVELOPERS                       |  1 +
>  package/Config.in                |  1 +
>  package/osm2pgsql/Config.in      | 27 ++++++++++++++++++++++++
>  package/osm2pgsql/osm2pgsql.hash |  3 +++
>  package/osm2pgsql/osm2pgsql.mk   | 35 ++++++++++++++++++++++++++++++++
>  5 files changed, 67 insertions(+)
>  create mode 100644 package/osm2pgsql/Config.in
>  create mode 100644 package/osm2pgsql/osm2pgsql.hash
>  create mode 100644 package/osm2pgsql/osm2pgsql.mk

Applied to master with a few minor formatting tweaks. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
