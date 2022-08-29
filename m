Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F61DC0502C
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 15:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0663C60F75;
	Mon, 29 Aug 2022 15:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0663C60F75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3EkKtbLDoaTx; Mon, 29 Aug 2022 15:17:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D03D60F6E;
	Mon, 29 Aug 2022 15:17:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D03D60F6E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE8001BF28E
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 15:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EA8860F6E
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 15:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EA8860F6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HcWHbW2Hjw_g for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 15:17:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AE7F60F5C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AE7F60F5C
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 15:17:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:db58:8a5b:83c0:1d37])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 86875780500;
 Mon, 29 Aug 2022 17:17:36 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 29 Aug 2022 17:17:36 +0200
Date: Mon, 29 Aug 2022 17:17:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Lance Fredrickson <lancethepants@gmail.com>
Message-ID: <20220829151736.GG2569@scaer>
References: <20220824202617.21650-1-lancethepants@gmail.com>
 <20220827133854.GW37358@scaer>
 <a5b2e1bc-4e5a-1135-d837-a6d66c10f3c5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5b2e1bc-4e5a-1135-d837-a6d66c10f3c5@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661786259;
 bh=kxOtBIgYmf0meLGcNZDxDnD71dTYObfshbiZswXfiTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WjWUs18E2vhGkK6MYcqvZQa3KcKdykTZ0dXKUGtH3LM6fwP7h8nPmc4TUvfDAvdes
 0XyDXFcmy5CKoJT7LnUmhXxWpwXN1hE+hsLvR/DnBpiNZYjO1f+SsyCqD6p7/c9Y7A
 Fi7bVOrOq74OXdrFT4l9ZhKBG7In37yZgvqlG0SxHJ/EE7WzykFVslW+FgVGp58L6D
 XdTnDrNfAqg5lgHxFXWBo+U+Efb0P5TLlb6Evub/Yp5gxXWHbXHTUgqh6UKZ+SlePI
 BXkJ4qh3Y5b9jcgCKd+AK0Qte6NeI0lyPfMSE2lITt0BKnnbcIvLdaLxJPGg3peN17
 yAnDBMGBCdQ4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WjWUs18E
Subject: Re: [Buildroot] [PATCH 1/1] package/musl-fts: always build static
 library
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

Lance, All,

On 2022-08-29 08:52 -0600, Lance Fredrickson spake thusly:
> On 8/27/2022 7:38 AM, Yann E. MORIN spake thusly:
> >On 2022-08-24 14:26 -0600, lancethepants spake thusly:
> >>musl-fts provides features left out of musl that are included in other libc's.
> >>This patch always enables building the static library so
> >>that it is always present with musl's libc.a when enabled.
[--SNIP--]
> "what makes musl-fts different from other libraries....?"
> Well it is a library that has libc functionality. I can compile a glibc or
> uclibc toolchain and fts is included. Buildroot's musl toolchain includes
> musl-compat-headers to complete some of it's functionality, and musl-fts
> would be the same. For that reason I see it as a core toolchain component
> and not as something additional as an sdk. I do know that the musl
> developers are very intentional on what is included and on correctness, and
> fts didn't make the cut in their estimation. If fts were to be included as
> part of the musl toolchain in buildroot I now understand that solution would
> look different from my submission.

There would still be a difference anyway. With glibc, fts is built-in to
the C library, while with musl and uclibc, and thus with musl-fts, they
are in a separate library, so your packages still need to know the
difference as they would need to explicitly link to that library.

> Thanks for your response, you've given me some good workable solutions and
> I'll run with one of those.

Great! :-)  I've thus marked your patch as rejected in Patchwork.

Thanks for the feedback.

Regards,
Yann E. MORIN.

> >>Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
> >>Signed-off-by: lancethepants <lancethepants@gmail.com>
> Oopsie on my part. I manually added the first line but then I didn't catch
> that...
> git format-patch -M -n -s -o outgoing origin/master
> adds one as well using my git config.
> >That second SoB line is incorrect, as it has no real-name part; it is
> >also superfluous, because it is the same email part.
> >
> >Regards,
> >Yann E. MORIN.
> >
> >>---
> >>  package/musl-fts/musl-fts.mk | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >>diff --git a/package/musl-fts/musl-fts.mk b/package/musl-fts/musl-fts.mk
> >>index dd7f1f9ea0..fcad9c3d75 100644
> >>--- a/package/musl-fts/musl-fts.mk
> >>+++ b/package/musl-fts/musl-fts.mk
> >>@@ -12,5 +12,6 @@ MUSL_FTS_LICENSE_FILES = COPYING
> >>  # pkg-config needed for autoreconf
> >>  MUSL_FTS_DEPENDENCIES = host-pkgconf
> >>  MUSL_FTS_INSTALL_STAGING = YES
> >>+MUSL_FTS_CONF_OPTS += --enable-static
> >>  $(eval $(autotools-package))
> >>-- 
> >>2.20.1
> >>
> >>_______________________________________________
> >>buildroot mailing list
> >>buildroot@buildroot.org
> >>https://lists.buildroot.org/mailman/listinfo/buildroot
> 

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
