Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59ECAC001DE
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0168B60E44;
	Wed,  9 Aug 2023 21:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0168B60E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sj2fI_aD4xvo; Wed,  9 Aug 2023 21:09:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDBCC60F56;
	Wed,  9 Aug 2023 21:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDBCC60F56
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4FDF71BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 295234063C
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 295234063C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tl1_XGsZ38Oz for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:08:55 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D442400D9
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D442400D9
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7C78C0005;
 Wed,  9 Aug 2023 21:08:52 +0000 (UTC)
Date: Wed, 9 Aug 2023 23:08:51 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230809230851.3f18664b@windsurf>
In-Reply-To: <20230716133424.4131847-1-bernd@kuhls.net>
References: <20230716133424.4131847-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691615333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S2jTS2vqnJ2xMZGVdKOmiG/PykSwZrCmpXYRmVQLtpM=;
 b=C/sf+6n5dn6mhaoQV7AP5Kl6tJoQEqVBrnW2sHzAyG6yEm0u5DidnH2F9ltawi5jjuR28K
 1j+5R/JNex9BWbV+fCEhNdQFT6e95h9Z6mqm2Qbm7q/NFAac9107fuVDy/fbeXDWT4/PMX
 kiT/FKU9jCZVeO7ISaxr/SWNhLDWXxLJPmlA3MCV+ZMv80eUQfiZxjXfovooxEdFcM0hCz
 YExHWGNJ4miOvuiYZyvNEm7tYCd0Cxs625wHOLy+DfI3llL8lj74h3HFKQ1OvzlVJ7g2an
 Qg1QAN73n8xzZ/jT0cURIFUUu2ivJL8999/DBxbNGDz3vWf6Aux7od/FnJSEBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C/sf+6n5
Subject: Re: [Buildroot] [PATCH 1/2] package/x11r7/xlib_libXpresent: new
 package
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 16 Jul 2023 15:34:23 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Needed for mpv since version 0.35.0:
> https://github.com/mpv-player/mpv/commit/3d459832a88a9bd2835b339cf6ca98f84aad0115
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/x11r7/Config.in                       |  1 +
>  package/x11r7/xlib_libXpresent/Config.in      |  9 +++++++++
>  .../xlib_libXpresent/xlib_libXpresent.hash    |  5 +++++
>  .../xlib_libXpresent/xlib_libXpresent.mk      | 20 +++++++++++++++++++
>  4 files changed, 35 insertions(+)
>  create mode 100644 package/x11r7/xlib_libXpresent/Config.in
>  create mode 100644 package/x11r7/xlib_libXpresent/xlib_libXpresent.hash
>  create mode 100644 package/x11r7/xlib_libXpresent/xlib_libXpresent.mk

As you had noticed, Fabrice had submitted a month before a similar
patch series, so I took the series from Fabrice (with some fixes that
you suggested).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
