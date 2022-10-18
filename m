Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E272C433FE
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 06:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88AA641899;
	Tue, 18 Oct 2022 06:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88AA641899
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0fSS4PJEuqaT; Tue, 18 Oct 2022 06:36:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72F0841892;
	Tue, 18 Oct 2022 06:36:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72F0841892
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E87361BF35F
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 06:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90D6741892
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 06:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90D6741892
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x2mJCGYz9XeE for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 06:36:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E100541878
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E100541878
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 06:36:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8733A240002;
 Tue, 18 Oct 2022 06:36:33 +0000 (UTC)
Date: Tue, 18 Oct 2022 08:36:32 +0200
To: Christian Stewart <christian@paral.in>
Message-ID: <20221018083632.6f336ec6@windsurf>
In-Reply-To: <CA+h8R2pNnYsj9Yz0Do_UKQz+XWiz4LTxPrLz_aQgGEg1LsZsOg@mail.gmail.com>
References: <20221017143125.41622-1-thomas.perale@mind.be>
 <20221017143125.41622-4-thomas.perale@mind.be>
 <CA+h8R2pNnYsj9Yz0Do_UKQz+XWiz4LTxPrLz_aQgGEg1LsZsOg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666074995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aNHAWVzfO8BPEgh5iEPpBew+unlLvDRu+/3TpGdCgVQ=;
 b=dF4ZIZO3dOo2W6R8IVgslt4bch6Tet3k4ITBxp2hZZjmygSckpkbWo+8FQ/dLRJmDvGiyZ
 jHsZaJR7dCLzD8ozoD/rTLSKWWmZBqU8Z336Cja1qYVrQR7KIGARbHVo8YlgmxTt1qXSz/
 2TJEFoNs1cawglZaIBfmrzF/byFFjqhkg7nkWd03MLvOjMhgjuT/Mt1lZe/aHt0fkDxIvf
 mPeSZGh8G474EwwELK3P5BZmv2Kr5UNvn1gPsGjyG5xDmcdP2YlJzP4zaaB79e4s+VSSji
 zGNWrlJHcq7P6PHkNyATt3HebdUY19XiYp3kBwOgyvQhNleKwB6iVLeSHmsL3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dF4ZIZO3
Subject: Re: [Buildroot] [PATCH 3/4] package/go-bin: new package
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
Cc: Geoff Levand <geoff@infradead.org>, Anisse Astier <anisse@astier.eu>,
 Thomas Perale <thomas.perale@mind.be>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Perale <thomas.perale@essensium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 17 Oct 2022 09:13:54 -0700
Christian Stewart <christian@paral.in> wrote:

> Instead of adding new packages...
> 
> Continue using "host-go" and add parameters under a menu config for it.
> Then you can simply use a single variable - GO_VERSION - rather than 2 new
> packages.
> 
> I'm happy to send a prototype of this if you need.

I also thought of doing this for the NodeJS package, instead of
separating host-nodejs-bin and host-nodejs-src. I went for the
virtual-package + 2 providers solution as this is what we had done with
Rust.

The main advantage I see with the single package solution is that the
version of NodeJS would be located at only one place. Although this
could also be solved by:

package/
 nodejs/
  nodejs.mk 	<= contains the version
  nodejs/   	<= virtual package
  nodejs-bin/	<= pre-compiled provider
  nodejs-src/   <= source-based provider

In my proposal I solved this duplicated version by simply having a
comment above the <pkg>_VERSION field to remind people that the other
package supporting NodeJS should be bumped at the same time.

The advantage of the 2 packages solution is obviously that each package
is simpler.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
