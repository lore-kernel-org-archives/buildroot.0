Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52892C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 20:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16BEE60A6F;
	Thu, 17 Feb 2022 20:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fibFaUJ4FYM7; Thu, 17 Feb 2022 20:43:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51E3F600D4;
	Thu, 17 Feb 2022 20:43:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A3601BF3B5
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75BB3600D4
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:43:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K7tE2ZBGjeEO for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 20:43:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EFAF600B9
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 20:43:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d44f:202d:8a3e:695f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4A0E813F861;
 Thu, 17 Feb 2022 21:43:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645130623;
 bh=k7JESqRIfejW+s9Mxcd9haat6I9XJBEbNzys4O5MrPo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t0KbERLb8aaY8uc5H55xiwjDjA1UHKrJ7VdwLtL/GFFqqLFG72xAZoewBRGopKTyU
 lO1i31UItpOE2byfxnRIs2HSUzoZZWfgsH84ckdPIFobe+rEeXTTlZhRBtKObl9WhA
 Fw3WhNXxTBGbpETqyqxZfJ2i+QwYqz/v4z6ZSrHz5Dak99NU7Zmv2UYKPHbPUSTDuh
 KYmELkfhGLqizzZayvk0IC5Zqe3BDwDRqSwaaRzQ+pdAUycx/x7HifMcta8dQdGe5k
 02nrrID+J3h6gPCGEsmRcoUhFhjxuGPDErlnB+MDlsROpnjZuMB0yAO13Pd0jkEC/b
 McJ3/WpeLGu3g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 17 Feb 2022 21:43:39 +0100
Date: Thu, 17 Feb 2022 21:43:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220217204339.GI522310@scaer>
References: <20220217074338.147889-1-moritz@h6t.eu>
 <1544B961-F072-436D-9887-4EC3CFDC4CD3@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1544B961-F072-436D-9887-4EC3CFDC4CD3@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptsetup: fix build failure
 with libgcrypt
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
Cc: moritz@h6t.eu, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2022-02-17 14:29 +0100, Giulio Benetti spake thusly:
> > Il giorno 17 feb 2022, alle ore 08:55, Moritz Bitsch via buildroot <buildroot@buildroot.org> ha scritto:
> > The patch 0001-Add-check-program-for-symver-attribute.patch touches
> > a autoconf relevant file which causes a configure --recheck in the
> > make step without proper CONF_ENV. Running autoreconf prevents this.
> Thank you for the contribution, but Fabrice already sent a patch for that:
> https://patchwork.ozlabs.org/project/buildroot/patch/20220213210504.1416861-1-fontaine.fabrice@gmail.com/

Yep, but in this case, I applied Moritz' patch, because Fabrice has
waaaayyyy too many commits in his name already! ;-]

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
