Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7D0C001B0
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 18:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB50540895;
	Wed,  9 Aug 2023 18:28:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB50540895
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qV3wN64CQdHT; Wed,  9 Aug 2023 18:28:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B23504089C;
	Wed,  9 Aug 2023 18:28:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B23504089C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 724511BF331
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 18:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B28A83AA6
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 18:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B28A83AA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bfGoymd6t3TI for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 18:28:13 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FDFE83A3F
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 18:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FDFE83A3F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F877E0005;
 Wed,  9 Aug 2023 18:28:10 +0000 (UTC)
Date: Wed, 9 Aug 2023 20:28:10 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230809202810.0ecd1b49@windsurf>
In-Reply-To: <20230809173334.2514813-3-bernd@kuhls.net>
References: <20230809173334.2514813-1-bernd@kuhls.net>
 <20230809173334.2514813-3-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691605691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ByWRgvOlKWyvhzeDpKhEmadedDa5QEzcfb27sCR4igI=;
 b=HDdZDz7dNNeqsId3bnGRXIpxxaiR9+eXFflpY0miIBqHyKj4i9ezF9I5xFtRmeXtYTbO08
 i5A0tbk4UoLNRxhSjZQBEC211G6C2zEYda3F43wM8FJalbc8msPgK96JeiZofhbuItt9FL
 bCimxM/ylVv1rqp0swrRgXY2ldlsNmfSNEqrqY0Dftdby4ejYVJcEFCsF3tk80gdAwMwpB
 vFOSx1n2Ysmd7rAGd0mxEf1maynmcRLdKGfxtq8ONKZVWV9GorcXHtz0K31MGflONyYwCh
 QlgeU+9TyJy5UrH7T0Y82p4NrZKrm2yvZrZejFMz2hOnbiTjExOWRlrSxgAiTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HDdZDz7d
Subject: Re: [Buildroot] [PATCH/next v2 02/16] package/python3: berkeleydb
 support needs the dbm interface
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Wed,  9 Aug 2023 19:33:20 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Berkeley DB support in python depends on dbm, when missing python fails
> to detect libdb:
> https://github.com/python/cpython/blob/d2340ef25721b6a72d45d4508c672c4be38c67d3/configure.ac#L4002
> 
> quoting configure log:
> checking for libdb... no
> 
> quoting python config.log:
> conftest.c:(.text.startup+0x8): undefined reference to `__db_ndbm_open'
> 
> With this patch berkeleydb produces a working module:
> 
> output/build/python3-3.11.4$ find -iname *dbm*.so
> ./build/lib.linux-x86_64-3.11/_dbm.cpython-311-x86_64-linux-gnu.so
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/python3/Config.in | 1 +
>  1 file changed, 1 insertion(+)

So I have finally looked into, and it is not a Python 3.11 issue. The
issue already exists in Python 3.10, we just didn't realize. See my
commit log at
https://gitlab.com/buildroot.org/buildroot/-/commit/b84ffd85e2900741bb97325b53d09e170e941e6c.

So, as can be seen, this investigation is important: it shows that it's
not a problem introduced since the bump of Python 3.11, but it's a
problem that existed before, and therefore those fixes need to be
backported to our stable branches that have Python < 3.11.

So I've applied the patch to the master branch.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
