Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2226BC54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 12:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3B78403E0;
	Sat, 17 Sep 2022 12:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3B78403E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5fm93Ku7NYCU; Sat, 17 Sep 2022 12:54:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E150A40223;
	Sat, 17 Sep 2022 12:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E150A40223
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC5D21BF48C
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C37AC84028
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C37AC84028
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FjC8d7qpvsTE for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 12:54:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C54284018
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C54284018
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 12:54:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4CBBA60004;
 Sat, 17 Sep 2022 12:54:11 +0000 (UTC)
Date: Sat, 17 Sep 2022 14:54:08 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: luca.ceresoli@bootlin.com
Message-ID: <20220917145408.0abe473d@windsurf>
In-Reply-To: <20220917123602.961826-1-luca.ceresoli@bootlin.com>
References: <20220917123602.961826-1-luca.ceresoli@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663419251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7j9wH1umNHAqMk8GdTC8nQ28ROlKx+7TFmdg9SX+1UU=;
 b=ALCQDk3ehT//8Xww1o+ng3Jc2qGP7pJMkbbT/3cw2GtaYfQuXHgIu6tzNaWtp5eEqv5l+a
 Q0R9zekyZSm5jcWexV9lD5EPCCssmy0yslIerql3LzHYXo6lNRyfvv/n2Yr/RhPcTZp/sZ
 lJmjcIyycwiIq+Mv59wuGBj8u+jodcMrYZbScxhVGVpl/Fi07Pm1J7tkz6EA3JjXX9sNtA
 Cdbw1liVOzCnlP5o2hcpz1LmWxWJZ+GrRk0AA63jZY8mSNkZ0cLk4/yUBpCWOksj6bYpcK
 lbppIwvEYaJfEDmsVGqAxXQEp2oqHGexIS19fCm+5vFOb+qZvipGNcjBTJTJVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ALCQDk3e
Subject: Re: [Buildroot] [PATCH 1/4] package/snmppp: bump to version 3.4.10
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 17 Sep 2022 14:35:59 +0200
luca.ceresoli@bootlin.com wrote:

> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> Changelog:
> 
>   - Fixed: Winsock has to be included before windows header.
>   - Fixed: Added SnmpTarget::version_to_string() function
>   - Fixed: Fixed compiler warning on MSYS2 g++
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  package/snmppp/snmppp.hash | 2 +-
>  package/snmppp/snmppp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
