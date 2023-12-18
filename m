Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB10C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 16:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7E4D40018;
	Mon, 18 Dec 2023 16:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7E4D40018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GujSzZfxTuTm; Mon, 18 Dec 2023 16:49:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC775402DC;
	Mon, 18 Dec 2023 16:49:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC775402DC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 20D5B1BF31B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 16:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE5FB60C06
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 16:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE5FB60C06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aqpdDGxTVtT9 for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 16:49:45 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDA7960A7E
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 16:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDA7960A7E
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E3167B00539;
 Mon, 18 Dec 2023 17:49:40 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 18 Dec 2023 17:49:40 +0100
Date: Mon, 18 Dec 2023 17:49:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZYB4JBDLiHq0rbWA@landeda>
References: <87wmtb8y76.fsf@48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87wmtb8y76.fsf@48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702918183;
 bh=AFGe0yeTih+HhxZl8vloFMZEVgrjUIzX5/kyn5YRpCQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a1/LBQoO/vSQJeWlIj3xCMkEGzQs3vmRW94GJ5zXvk/a5Cl5aZ/aTbSKZus/d8smh
 7Eeicy2hoafyabZCgwxVT/Ya+5uLPIlx1bQqhZ/3LvXzp4b9DGASi6fTnU08dIlt6N
 oAXyqzaGpHl8Hyur/7Y53OMy9VZEzAUl3VZCpznA1XQdXV9bDGDAlUJ+wht3+9JNfc
 gLHcymmiSo8WKxzSooWfbi8BWjTG+sUmVUNCGladWkZEBn6juBL2raF9Zj0PK4SVXc
 7W1HkhEAnSoqpZ0e1Ru4ae8Pnytpn2bA/9jVyjak4EXaNiC+3mBdzCeKOsKxlZNxOa
 I0ZH06rA3KJSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=a1/LBQoO
Subject: Re: [Buildroot] Asterisk for Buildroot 2024.02+
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

Peter, All,

On 2023-12-18 13:58 +0100, Peter Korsgaard spake thusly:
> FYI,
> 
> The Asterisk version in Buildroot (16.30.1) is EOL upstream since
> October:
> 
> https://docs.asterisk.org/About-the-Project/Asterisk-Versions/
> 
> Recently a high severity (CVSS 7.5) security vulnerability was found:
> 
> https://github.com/asterisk/asterisk/security/advisories/GHSA-hxj9-xwr8-w8pq
> 
> 16.x is most likely also affected, but no patch is available
> upstream. We really need to move to a supported version (E.G. 18.x)
> before the 2024.02 release. Is there interest in doing so or should the
> package be dropped instead?

I unfortunately no longer have any need for asterisk, and I have no way
of testing a new version any longer either.

So, unless someone steps up, we'll have to drop the package.

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
