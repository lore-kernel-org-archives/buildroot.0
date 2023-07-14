Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64C1C001B0
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 21:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A37D40B9C;
	Fri, 14 Jul 2023 21:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A37D40B9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6-omXfk51cGe; Fri, 14 Jul 2023 21:22:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF67540948;
	Fri, 14 Jul 2023 21:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF67540948
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8DD871BF97F
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7378B40A71
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 21:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7378B40A71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fs1lz6kH7qFM for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 21:21:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9469C405B9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9469C405B9
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 21:21:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4DA701BF203;
 Fri, 14 Jul 2023 21:21:44 +0000 (UTC)
Date: Fri, 14 Jul 2023 23:21:43 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230714232143.087381be@windsurf>
In-Reply-To: <20230714205431.783961-1-bernd@kuhls.net>
References: <20230714205431.783961-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689369704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FXYRnRVwkeF2/vO5hxsFNZlhHu1OU8CQLCc1YiD3z48=;
 b=CT36JyD3LIZ4feR0hUvIJ7SPlqc5saBusX0wXhfVJuDpVIxTaxpXykoBokvb+sNyy+T8Ka
 EOyloXPEB+/VhGEjVdthT1GHL2moBnnUQKyIAvQEB7H1Hk/IBH2xkZhSeXpZ+Ybc7B0vCd
 8RAc0PqndYl1pr13AkUqwjsGYzrTsCVuV4NzUU/BJCrEnGVgk9Sx2gCKkIkIx8hn88Y+OB
 8bStbwCcYni/QADJv8thF0J39p3IQnyLOSIiDPTEIymy/Zl/6qKoaA3CJTEBFrdbyXiEby
 mslPzKZAmfqK09ynyNdEkJj+nAVJNCPcVg77RMMRmCRV6w0IqUd6yVmGPsg1Dw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CT36JyD3
Subject: Re: [Buildroot] [PATCH 1/1] package/tovid: remove package
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
Cc: Steve Kenton <skenton@ou.edu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 14 Jul 2023 22:54:31 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Build is broken:
> "It seems that you are using `distutils.command.build` to add
> new subcommands. Using `distutils` directly is considered deprecated,
> please use `setuptools.command.build`.
> 
> By 2023-Dec-13, you need to update your project and remove deprecated
> calls or your builds will no longer be supported."
> 
> The last commit for this package occured on May, 30th, 2016.
> The last issue was opened Jan, 31st, 2017 and was unanswered.
> 
> Fixes:
> http://autobuild.buildroot.net/results/b57/b571d7838950e0b5ca67106cbcd9ba61b4f04a48/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  Config.in.legacy                 |  6 ++++
>  DEVELOPERS                       |  1 -
>  package/Config.in                |  1 -
>  package/tovid/0001-manpage.patch | 25 ----------------
>  package/tovid/Config.in          | 50 --------------------------------
>  package/tovid/tovid.hash         |  3 --
>  package/tovid/tovid.mk           | 13 ---------
>  7 files changed, 6 insertions(+), 93 deletions(-)
>  delete mode 100644 package/tovid/0001-manpage.patch
>  delete mode 100644 package/tovid/Config.in
>  delete mode 100644 package/tovid/tovid.hash
>  delete mode 100644 package/tovid/tovid.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
