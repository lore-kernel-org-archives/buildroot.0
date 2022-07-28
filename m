Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C0DC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 20:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B47FF60B00;
	Thu, 28 Jul 2022 20:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B47FF60B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oMcgiDBdhVYn; Thu, 28 Jul 2022 20:52:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC77D60ACD;
	Thu, 28 Jul 2022 20:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC77D60ACD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D87281BF37F
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B39AC60AE0
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B39AC60AE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5DYYtxtutxzW for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 20:52:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B37A60A9F
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B37A60A9F
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 20:52:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4C8B9240005;
 Thu, 28 Jul 2022 20:52:45 +0000 (UTC)
Date: Thu, 28 Jul 2022 22:52:43 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220728225243.57d51df7@windsurf>
In-Reply-To: <56e3cdc8-3c1a-de9c-be9e-b114790fa026@mind.be>
References: <20220728082438.1697487-1-fontaine.fabrice@gmail.com>
 <56e3cdc8-3c1a-de9c-be9e-b114790fa026@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659041566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=coOHbVx4cCzNngVqh/JZAVqAllOG2YMhaspr6WJMhsU=;
 b=KjsWdTIMD9gz84YGSpogPkigsjAgY2Hl91+u3ljbk62y0vmb99avRt++x47Yjhuu8lWdH2
 kI7y70YclMXUatRa37J+dRMTjrBfmUMohqOpzd/o9c8byEYJt6w3xIPYaT5OFJ75zdsZhf
 keolK+a0//zOnSNemTieglPHfn3Bg+y1hsHgE5g8zxKWdBE6eFVsagJa8Bv4X5f98PtAXy
 dTICU6PtDcx1k5mjt+YNRlxKExjLaDewU09j+TsmbppoYcF/X/RM9DUN6/VSN4oTvFEkCT
 WuNO/565ffqgkV9IGZILHYmN38JVbsN3n4oncWFFppKagg6p1/mXW0e8DIkzhQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KjsWdTIM
Subject: Re: [Buildroot] [PATCH 1/1] package/freeradius-server: requires MD4
 in openssl
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
Cc: David GOUARIN <dgouarin@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Jul 2022 21:39:09 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > In file included from src/lib/md4.c:16:
> > src/lib/md4.c: In function 'fr_md4_calc':
> > src/freeradius-devel/md4.h:76:33: error: unknown type name 'MD4_CTX'; did you mean 'FR_MD4_CTX'?
> >     76 | #  define FR_MD4_CTX            MD4_CTX
> >        |                                 ^~~~~~~  
> 
>   Would there instead be a way to convince freeradius not to use MD4? Using MD4 
> these days is really a bad idea...

I agree, but for the time being, since freeradius-server uses it, from
a packaging point of view, we don't have much choice but to enable MD4
support. That being said, it would certainly be good to look into
freeradius and see if usage of MD4 can be disabled/removed.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
