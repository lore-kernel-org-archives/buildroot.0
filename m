Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8FDECAAD3
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 12:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 461DB60FB4;
	Mon,  5 Sep 2022 12:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 461DB60FB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KvJdEHCUajsD; Mon,  5 Sep 2022 12:01:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71BC960E52;
	Mon,  5 Sep 2022 12:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71BC960E52
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CED51BF9A4
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 12:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1449E8133E
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 12:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1449E8133E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L0c8X_2tnOKc for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 12:01:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA9E88133A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA9E88133A
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 12:01:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a5dc:9bd4:48b0:8ef0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id ADAD8B00739;
 Mon,  5 Sep 2022 14:01:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Sep 2022 14:01:03 +0200
Date: Mon, 5 Sep 2022 14:01:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Message-ID: <20220905120103.GD1490660@scaer>
References: <20220904124315.12728-1-raphael.pavlidis@gmail.com>
 <20220905115121.GC1490660@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220905115121.GC1490660@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662379267;
 bh=4RxvlY51qnaRQW94u4yLpAtf9EcFXdMvGbRe3WUNTqQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G0XQGV9/UaC+SPKz3CPxbms0Xi3/gZJbp3BHbYFTQLgdlMUkuCV11sgCKj+P84mGR
 CAcnc+C9XWdCqjeqXR6WjntpLpif8fbLtWYJC37zZGraaRv5C9EtRBfzKbQFGk6ChJ
 Z6JFOC79vzc8MNDRIMSP5ZSULTk7m2Gka2zhauRe+6rerTXUPznn2lM3ZXZQXPBHZ+
 px+1L/kFseKBgjvNhS3x1askaKwx0EX2T0uPqFg3xixooViNhKhgr8fQ/QraetxS2y
 E9MMG6t1QNVHO8bQS2vtYUkV4Mcu122wd+H4ucZ2JkmVpCwW8WdC1/lGUHIrmMfWGe
 H90sbhvQF8svg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G0XQGV9/
Subject: Re: [Buildroot] [PATCH v2 1/1] package/shadow: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Raphael, All,

On 2022-09-05 13:51 +0200, Yann E. MORIN spake thusly:
> On 2022-09-04 14:43 +0200, Raphael Pavlidis spake thusly:
> > shadow provides utilities to deal with user accounts.
[--SNIP--]
> > +ifeq ($(BR2_STATIC_LIBS),y)
> > +SHADOW_CONF_OPTS += --enable-static
> > +else
> > +SHADOW_CONF_OPTS += --disable-static
> > +endif
> > +
> > +ifeq ($(BR2_SHARED_LIBS),y)
> > +SHADOW_CONF_OPTS += --enable-shared
> > +else
> > +SHADOW_CONF_OPTS += --disable-shared
> > +endif
> So, first, both options are already passed appropriately by the
> autotools package infrastructure, so why do you need to pass them?
> Second, --{en,disable}-{static,shared} is supposed to drive the build
> of static or shared libraries, not the fact that anything is shared or
> statically linked.

Oh, and of course, Buildroot can be configured with neither
BR2_STATIC_LIBS nor BR2_SHARED_LIBS, but with BR2_SHARED_STATIC_LIBS,
which means to generate both static and shared, but the code above would
actually disable both.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
