Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42614C4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 13:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99C404052B;
	Sun,  4 Feb 2024 13:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99C404052B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DnYqpO5LDYUT; Sun,  4 Feb 2024 13:26:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E33B401B2;
	Sun,  4 Feb 2024 13:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E33B401B2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2DD1D1BF48C
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 13:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DE4B6059C
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 13:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DE4B6059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ipd_oWX5tbxt for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 13:26:00 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 026E96059B
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 13:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 026E96059B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2001:67c:1810:f051:9566:1ebe:e5dc:dd49])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AB647B00579;
 Sun,  4 Feb 2024 14:25:54 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Feb 2024 14:25:54 +0100
Date: Sun, 4 Feb 2024 14:25:54 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zb-QYjmG5IRkoWPj@landeda>
References: <20240204103204.1415592-1-fontaine.fabrice@gmail.com>
 <Zb-D2-ZahrrTCVnJ@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zb-D2-ZahrrTCVnJ@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707053156;
 bh=Wqoq5BtWVQ86SwX55fcgSXBiwFECE6MbibJC0WH7+M8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mnnsH0gTfNnADSL5NTEkfr+YtO5Aorzk4FgPqIPB5VbX0m7ZD4b/0m2OGn0CMTsGk
 k3SitqgWY5ZbFEh1SP2O5c9/RT5ijk/C0a6IFUyQrdMcfQTVhSS+IQtcUe6tl+lI8N
 Yw2dIWNI8nqatKeI1TfAz6Nmv4U94+CQfZiwGLym6toGhj2chrTeLE8LupxqNXofSV
 GuQROjDFNbfdvR0IgZaUUwy11TGSzAGOn9lhK0u9R3y+mD6jSyJ/I+vwlvf7zVSSVw
 esYAoVb6l/j/xmNk2/PAHnqUWrSjR4bmWnSH1HRHvHZPo7OlpNiE6go8ZxbIxLg4/y
 HTvEw8wpmGR0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mnnsH0gT
Subject: Re: [Buildroot] [PATCH 1/1] package/dbus: drop DBUS_CPE_ID_PRODUCT
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

Fabrice, All,

On 2024-02-04 13:32 +0100, Yann E. MORIN spake thusly:
> Maybe it would be good to add that check to utils/checkpackagelib/, so
> that it detects and reports the "FOO_CPE_ID_PRODUCT = foo" case.

It got me thinking that it'd be a good itch to scratch, so I'm working
on it.

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
