Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3691C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 10:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A4EB4029A;
	Mon,  6 Feb 2023 10:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A4EB4029A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i06kD4I0tL63; Mon,  6 Feb 2023 10:26:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DDA540218;
	Mon,  6 Feb 2023 10:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DDA540218
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C16A61BF2CF
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A810560A71
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:26:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A810560A71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oCSKMkcm-HuL for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 10:26:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8723C60792
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8723C60792
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 10:26:29 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AAF9F4000B;
 Mon,  6 Feb 2023 10:26:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pOyhf-00DntN-1n; Mon, 06 Feb 2023 11:26:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
 <20221127130739.1862398-4-ricardo.martincoski@gmail.com>
Date: Mon, 06 Feb 2023 11:26:27 +0100
In-Reply-To: <20221127130739.1862398-4-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Sun, 27 Nov 2022 10:07:17 -0300")
Message-ID: <87mt5rccoc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [next 03/25] Config.in.legacy: fix typo on
 BR2_PACKAGE_MEDIAART_BACKEND_QT
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

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Currently using this minimal .config:
 >  BR2_PACKAGE_MEDIAART_BACKEND_GDK_PIXBUF=y
 > triggers:
 >      *** Legacy options removed in 2018.05 ***
 >  [ ] libmediaart none backend option renamed (NEW)
 >  [*] libmediaart gdk-pixbuf backend option renamed
 >  [*] libmediaart qt backend option renamed

 > Commit "8553b39887 libmediaart: rename options to have proper prefix",
 > part of the 2018.05 release had a copy&paste error.

 > As stated in the beginning of the file:
 >  The oldest symbols will be removed again after about two years.
 > But while we carry these legacy symbols, let's fix the typo.

 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > ---
 > NOTE: Maybe it is time to drop old legacy symbols again?
 > If so, some patches in this series can be dropped.

Possibly, but they don't really cause a big maintenance issue, so I've
left them for now.

Committed, thanks.

> ---
 >  Config.in.legacy | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/Config.in.legacy b/Config.in.legacy
 > index 4eff5b55d6..9ce1004b0c 100644
 > --- a/Config.in.legacy
 > +++ b/Config.in.legacy
 > @@ -2594,7 +2594,7 @@ config BR2_PACKAGE_MEDIAART_BACKEND_GDK_PIXBUF
 >  	  BR2_PACKAGE_MEDIAART_BACKEND_GDK_PIXBUF has been renamed to
 >  	  BR2_PACKAGE_LIBMEDIAART_BACKEND_GDK_PIXBUF
 
 > -config BR2_PACKAGE_MEDIAART_BACKEND_GDK_PIXBUF
 > +config BR2_PACKAGE_MEDIAART_BACKEND_QT
 >  	bool "libmediaart qt backend option renamed"
 >  	select BR2_LEGACY
 >  	help
 > -- 

 > 2.34.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
