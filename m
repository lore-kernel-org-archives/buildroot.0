Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C189C2BB85
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 20:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1DCB42AEB;
	Fri, 21 Jun 2024 20:07:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xaAy5iIDu06t; Fri, 21 Jun 2024 20:07:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C035842A83
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C035842A83;
	Fri, 21 Jun 2024 20:07:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 776971BF344
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 20:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 708F584263
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 20:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gGITb9FaSCAq for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 20:07:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 40EDE8425F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40EDE8425F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40EDE8425F
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 20:07:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2905313FB05;
 Fri, 21 Jun 2024 22:07:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 21 Jun 2024 22:07:45 +0200
Date: Fri, 21 Jun 2024 22:07:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <ZnXdkRHE-kUQb-xg@landeda>
References: <20240617180157.3771298-1-a.wellbrock@mailbox.org>
 <1014df63-f67d-45fd-9f9e-95ee1a17bd10@bubu1.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1014df63-f67d-45fd-9f9e-95ee1a17bd10@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719000470;
 bh=dX1v/HSLgiu0ic9cZHgqpp/yu2OMb5jNxXSYgqLalSw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lpwGKgWrWxjO2oKiFHKRYeD5OhnBilJl48mQuUfI4WSzxGJeiAvCv9qr3kMA1HOsC
 j+kiphuHc0ut1wi3mtrqSgvSeWznfVPSjz0Wdemw1AeoQJ7ZfHM/wXV94CoLGWyccf
 c7F0QqcJGXPD4ZIngW6vUzWXnb1oTyCD8e17aok2Ebdij/Nn3Mivalr+PLe76IFkls
 bOjRQnyxLVVtpwSPoLvTUC0oQYP3GAn6rxt1ePLN29hiQqtOE4AA6HXfZYLrOMg3JL
 QYBDwm8T5zeW7BvQWZrBxKnDZAv8EYiiCd7tMBzQAOIPtL5O1cbLTF3pt6IiC6n3fb
 0QmyFtC+eQvqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lpwGKgWr
Subject: Re: [Buildroot] [PATCH 1/1] package/c-ares: update site url
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
Cc: alex <alexander.wellbrock@othermo.de>, a.wellbrock@mailbox.org,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcus, Alex, All,

On 2024-06-18 12:08 +0200, Marcus Hoffmann via buildroot spake thusly:
> On 17.06.24 20:01, Alexander Wellbrock via buildroot wrote:
> > From: alex <alexander.wellbrock@othermo.de>
> > Download URLs changed after hosting of the c-ares website changed
> > ownership:
> > https://daniel.haxx.se/blog/2024/06/06/bye-bye-hosting-c-ares-web/
> > 
> > This cannot be fixed upstream as github pages does not support .htaccess
> > files according to:
> > https://github.com/c-ares/c-ares.github.io/issues/2
> > 
> > Signed-off-by: Alexander Wellbrock <a.wellbrock@mailbox.org>
> > ---
> >   package/c-ares/c-ares.mk | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
> > index c4441255a2..a75a40da70 100644
> > --- a/package/c-ares/c-ares.mk
> > +++ b/package/c-ares/c-ares.mk
> > @@ -5,7 +5,7 @@
> >   ################################################################################
> >   C_ARES_VERSION = 1.27.0
> > -C_ARES_SITE = http://c-ares.haxx.se/download
> > +C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/cares-1_27_0
> 
> Sorry, I missed that yesterday, this should use the github site helper macro
> like this:
> C_ARES_SITE = $(call github,c-ares,c-ares,v$(C_ARES_VERSION))

Actually, that's not the case in this situation: the maintainers have
uploaded their release tarball, so that's what we want to use; see the
manual, section 18.25.4. How to add a package from GitHub. So Wat Alex
did is correct.

Regards,
Yann E. MORIN.

> With the additional benefit of not having to change the SITE variable for
> every version again here.
> 
> >   C_ARES_INSTALL_STAGING = YES
> >   C_ARES_CONF_OPTS = --with-random=/dev/urandom
> >   C_ARES_LICENSE = MIT
> 
> 
> Marcus
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
