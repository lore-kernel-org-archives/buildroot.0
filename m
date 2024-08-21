Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1FBC52D6F
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 11:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C951360AD3;
	Wed, 21 Aug 2024 11:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXgllUbMqkNX; Wed, 21 Aug 2024 11:15:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3433608A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3433608A3;
	Wed, 21 Aug 2024 11:15:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BAB01BF35D
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 11:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1646560A63
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 11:15:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESYh9OG1VAM1 for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 11:15:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D193F608A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D193F608A3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D193F608A3
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 11:15:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 336D913F8A2;
 Wed, 21 Aug 2024 13:15:22 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Aug 2024 13:15:21 +0200
Date: Wed, 21 Aug 2024 13:15:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Stephan Mueller <smueller@chronox.de>
Message-ID: <ZsXMSfQINZVI5CjT@landeda>
References: <20240821055146.46029-1-ende.tan@starfivetech.com>
 <2437694.qtHMqo9rXr@tauon.atsec.com> <ZsWuIIXmjLobhEKn@landeda>
 <22321294.h8k6rc2Cxg@tauon.atsec.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <22321294.h8k6rc2Cxg@tauon.atsec.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724238927;
 bh=CNBOmLQhgx4+4V1rJlThzJ2CNztqLnQ7CHf4smwjKSc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BO0fEzyCI3E5cNU49il8YIw5SUULZJ6N7wjvhTEy7wkT0kCctLGrYmyyFOR+apaal
 EhRZQeUsP4aPirrKWGwZWE14vo9crSL2BvvJjZtggqvw8dhFU09MPzODxy98uZWmKf
 0WALGAaMULNfJfplHcpRkxeEAQlWzkLj/WLYm2v5v433/nJX9OAjK7XWOwF3NY4IR9
 Qv/3BI4bCxGXJ+mVXoZeFInSIJqG8PIy2ORUuRtUXYZ0Nl1TL2kqBo/NxA1it/6AjN
 z36+FPlgqi3oLbotSGjI8FMkC2pMrX87l/w7kLMfzkv+Me89XKa9aciShR4Las54P2
 hh4/N/DbkS2zQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BO0fEzyC
Subject: Re: [Buildroot] [1/1] package/libkcapi: update site path
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
Cc: fontaine.fabrice@gmail.com, ende.tan@starfivetech.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Stephan, All,

On 2024-08-21 11:26 +0200, Stephan Mueller spake thusly:
> Am Mittwoch, 21. August 2024, 11:06:40 MESZ schrieb Yann E. MORIN:
> > That would be awesome if you could provide stable URLs, indeed!
> Ok, that is what I will do then - I will reply later today once I moved it.

Fantastic, thanks a lot! :-)

[--SNIP--]
> Sorry for the mess, but I wanted to make my web site nicer and the web site 
> tool did not work well with the old versioning schema. Thus the switch.

Basically, we need things to be stable and reproducible: once we know
where to fetch something, it is important that is stays in the same
place in the foreseeable future.

> Anyhow, as I may not know all the needs of distro management, open an issue if 
> you have other such issues :-)

Thank you! :-)

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
