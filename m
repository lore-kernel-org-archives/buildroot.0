Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD21C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 20:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 292774059C;
	Sun, 13 Nov 2022 20:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 292774059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XPg_iYBZo7pw; Sun, 13 Nov 2022 20:59:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D3BA404ED;
	Sun, 13 Nov 2022 20:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D3BA404ED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4337D1BF267
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 20:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10061812B1
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 20:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10061812B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9rg19g0RvlMf for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 20:59:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B788F812A7
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B788F812A7
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 20:59:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0008FFF802;
 Sun, 13 Nov 2022 20:59:40 +0000 (UTC)
Date: Sun, 13 Nov 2022 21:59:40 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221113215940.7793ff4d@windsurf>
In-Reply-To: <20221112220537.2521750-1-yann.morin.1998@free.fr>
References: <20221112220537.2521750-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668373181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9T4+1p91Db2qJM3OLL8DrNQKzTVdhsWA+bU8Aagd5g0=;
 b=dkHeo4omObB+GZ8mP4ereqwqVj9Kr7uwgbKsR3Syaq3I488+gQRB5Qi/Fw95n/Otc7/KN+
 wIkOKulJd39kd1ZH5Q+IffkbSfgk2ts3adG+GVZGAM/BeJ6pbBDaLTNX7TiEjGWtKHr6TL
 hO+37oU/qA8DT1AOSgt6IiY4MSrmBMcQ1IdCb4PJcOyIUweY/xWT9a5UZSnKl8Yk9dpdMx
 HvFDIXGGke2IDpRI1saOws0pMxf0b58YuBJAk5ji8mY4cR8/WeBqIFZ9vPxVxjzx2gwJ2A
 NsID4jYqFgpgZcrWKhabXt+MVWPHFS0H2S4A4H+6mCof/lfLdt4qk3nvUaQwTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dkHeo4om
Subject: Re: [Buildroot] [PATCH] package/matchbox-starup-monitor: fix build
 without C++
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

On Sat, 12 Nov 2022 23:05:37 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> matchbox-startup-monitor is an ageing package, and uses an old
> configure.ac with archaic constructs. This had generated a configure
> script that incorrectly tries to look for and validate a C++ compiler:
> 
>     checking for powerpc64le-buildroot-linux-gnu-g++... no
>     checking whether we are using the GNU C++ compiler... no
>     checking whether no accepts -g... no
>     checking dependency style of no... none
>     checking how to run the C++ preprocessor... /lib/cpp
>     configure: error: C++ preprocessor "/lib/cpp" fails sanity check
> 
> Calling autoreconf fixes the issue, as the generated configure no longer
> tries to look for a C++ compiler at all anymore. Running autoreconf does
> not add any new dependency, as they are already in the dependency chain
> via other packages.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/223/223f43dd76ee907c5f25c4fee94a0f5d75614dd5/
> 
> See also similar changes:
>     9993a36f5e12 package/pamtester: fix build without C++
>     c05cc5de868c package/madplay: needs autoreconf
>     eae18d01abc7 libmad: needs autoreconf
>     43274dd3e0da package/libid3tag: needs autoreconf
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/matchbox-startup-monitor/matchbox-startup-monitor.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Meh, matchbox. Unfortunately, I pushed before spotting the typo in the
commit title, so it will stay forever :)

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
