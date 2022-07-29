Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C9EC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 20:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBB668475F;
	Fri, 29 Jul 2022 20:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBB668475F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qu9BCm4sdcDx; Fri, 29 Jul 2022 20:27:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05EFC8461B;
	Fri, 29 Jul 2022 20:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05EFC8461B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D8AE1BF35D
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10C08422AF
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10C08422AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id szqzeme5LOZp for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 20:27:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98F9B422AC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98F9B422AC
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 20:27:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8E4181C0005;
 Fri, 29 Jul 2022 20:27:38 +0000 (UTC)
Date: Fri, 29 Jul 2022 22:27:37 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220729222737.6a5a3f1d@windsurf>
In-Reply-To: <4e591fc1-3820-3e6a-1edf-c815336f8976@benettiengineering.com>
References: <20220729162430.1028453-1-giulio.benetti@benettiengineering.com>
 <20220729162430.1028453-2-giulio.benetti@benettiengineering.com>
 <20220729215552.325fbe22@windsurf>
 <4e591fc1-3820-3e6a-1edf-c815336f8976@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659126459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=exwhSRHDoI3pFrJP2ZC6CMV4em8hfxgfD6oFTI65d2s=;
 b=Cz288izl/XyXNLcCXCIlA4uyqnjH3RqjoCjjhGO5QPSWWVYWCP78IR6EZQl/BWT/UBkszz
 sjEYhzm2zNdOZxRUdiImV2DxydL56VLvc+tdpEbsff17ix9aDKurhqLGY1nMSyBW49wASu
 KthqhjnHEKC8Kf7pmOXAxrWUEVda+Hwaqv7fAruTiSd77B29HBVWNXHqYVw9Kq2us/CWTB
 nR4GAOS14KwyOaF08uMNNQFwhwenfgxfGnHgTQbhllfnJCmsd8kZg8xSPlBQrgPDSs2ZnO
 7hn6uGlkpv97w+lkKSQ+hw3gbpnPKehTcqONFeV66nbc07Cjx51yYz1xwHswsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Cz288izl
Subject: Re: [Buildroot] [PATCH 2/2] toolchain/Config.in: update gcc bug
 99410
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 29 Jul 2022 22:22:56 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> So I can improve also bugs:
> BR2_TOOLCHAIN_HAS_GCC_BUG_43744
> BR2_TOOLCHAIN_HAS_GCC_BUG_83143
> 
> This way we're also sure we always deal with latest gcc version.
> What about it?

Sure!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
