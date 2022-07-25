Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7E0C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 08:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AE50418C5;
	Mon, 25 Jul 2022 08:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AE50418C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Im-Xl6K_H9Me; Mon, 25 Jul 2022 08:44:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2198C415E0;
	Mon, 25 Jul 2022 08:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2198C415E0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F7541BF2F6
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 08:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0956F8318C
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 08:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0956F8318C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id my68JKQMwKVB for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 08:44:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7495831CA
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7495831CA
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 08:44:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 629D024000F;
 Mon, 25 Jul 2022 08:44:31 +0000 (UTC)
Date: Mon, 25 Jul 2022 10:44:30 +0200
To: Gilles Talis <gilles.talis@gmail.com>
Message-ID: <20220725104430.57b60122@windsurf>
In-Reply-To: <20211024113626.88663-1-gilles.talis@gmail.com>
References: <20211024113626.88663-1-gilles.talis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658738671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SRL1tnPjzoFiPiRPgqaV/NUoGygSQNnRvLGNpRBQXx0=;
 b=ExqUekwhabHSRA8ibxZrUsl2KvCyzYczu6YqeugmbaQMnQSwv/FRcxLGv8nOeENHNOZTPW
 YX+u721j4Zf+l+FgpVSarI/n3gIQVbqqWc+9JHil5ox/kUtjJboQl4L/utQgxEUu8r8bLN
 35q0VI3lz1vcJ+Vsnj49AM6BFwccmM/2wTRDw3uO9f218zqmgshuXKbthbI3ze5Sm832kW
 qgGGWVYlG6YyQF08gI1DB/K9bZc28J6KErGUFj0S5rnEIrlI1VMuFhB6zwbTXOHes4LayF
 /BiBMr83OmaxxpMD+nek6iFB0PFiGK9VPWXV47cY8C9yPsxu575wW9SvQhk+zg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ExqUekwh
Subject: Re: [Buildroot] [PATCH v2] package/hawktracer: new package
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

On Sun, 24 Oct 2021 13:36:26 +0200
Gilles Talis <gilles.talis@gmail.com> wrote:

> HawkTracer is a highly portable, low-overhead, configurable profiling tool
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> ---
> Changes v1 -> v2:
> - Added C++ support (Heiko Thiery's review)
> - Bumped to latest upstream revision
> ---
>  DEVELOPERS                         |  1 +
>  package/Config.in                  |  1 +
>  package/hawktracer/Config.in       | 25 +++++++++++++++++
>  package/hawktracer/hawktracer.hash |  3 ++
>  package/hawktracer/hawktracer.mk   | 44 ++++++++++++++++++++++++++++++
>  5 files changed, 74 insertions(+)
>  create mode 100644 package/hawktracer/Config.in
>  create mode 100644 package/hawktracer/hawktracer.hash
>  create mode 100644 package/hawktracer/hawktracer.mk

Finally applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
