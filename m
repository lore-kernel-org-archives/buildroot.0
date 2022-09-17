Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12578C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 09:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9BCF41BE1;
	Sat, 17 Sep 2022 09:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9BCF41BE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IfK9BnojSUQZ; Sat, 17 Sep 2022 09:57:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A13C74193F;
	Sat, 17 Sep 2022 09:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A13C74193F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B93721BF82D
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 871B861036
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:57:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 871B861036
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SQauHozN4BC1 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 09:57:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40C0360ACA
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40C0360ACA
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 09:57:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2317A40003;
 Sat, 17 Sep 2022 09:56:58 +0000 (UTC)
Date: Sat, 17 Sep 2022 11:56:57 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: <yann.morin@orange.com>
Message-ID: <20220917115657.3d44dd66@windsurf>
In-Reply-To: <10723_1663333579_632474CB_10723_500_30_a3b3a73905917c76ad928862912b96e167b7d876.1663333493.git.yann.morin@orange.com>
References: <10723_1663333579_632474CB_10723_500_30_a3b3a73905917c76ad928862912b96e167b7d876.1663333493.git.yann.morin@orange.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663408619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pZ8bJaENaTkJngALeASsMUnq1Li+SdwW//XeZ6/7Nuk=;
 b=lDxprvzjhHsJfZ72BJPcuRONmTSfg/ijt6KNxIGRf1C4op4QUQjhkufG7Q6+vaC0FWPg/X
 HydjZyRIlsRb+LJa/qTOs74ZmEHQWAMjrAD6l6fRGrm9owQVNPA+Hs5p+92Irr38NHBg1k
 Dgk9v4TUPlVnEyRMft5zvgY2d6tLpx7UZtmyfSoRJ1W096+DRZaUJqBHbMilltZKAvSJg4
 Obiz/NR9lvCWK13PYqAhV296zw/JsESQyveUEFtBF62qgDAjkF/COToDYJA5xYiJAslufx
 0uFmBw/Bj8ONVqn/d+v5eTxEUp/WIyt+yEDb2tNmgY295nnhET0SYpGly0WjdQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lDxprvzj
Subject: Re: [Buildroot] [PATCH v2 1/3] package/gpsd: remove obsolete config
 option
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 16 Sep 2022 15:06:15 +0200
<yann.morin@orange.com> wrote:

> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> The oldstyle option has been removed a while ago now:
>     2015-02-22 a5a123b4f3b0 Feature removal - delete last remnants of
>                             old pre-JSON protocol from libgps.
> 
> Drop it from Buildroot now.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  Config.in.legacy       | 6 ++++++
>  package/gpsd/Config.in | 3 ---
>  package/gpsd/gpsd.mk   | 3 ---
>  3 files changed, 6 insertions(+), 6 deletions(-)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
