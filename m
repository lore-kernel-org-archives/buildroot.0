Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90166C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 20:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BF5540863;
	Mon,  1 Aug 2022 20:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BF5540863
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6WdLUtmhJU0G; Mon,  1 Aug 2022 20:36:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F8B04089C;
	Mon,  1 Aug 2022 20:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F8B04089C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A32A61BF25B
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DD4A605B7
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DD4A605B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PWII2bM-EF77 for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 20:36:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D3C2605A6
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D3C2605A6
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 20:36:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 09E6E240003;
 Mon,  1 Aug 2022 20:36:23 +0000 (UTC)
Date: Mon, 1 Aug 2022 22:36:22 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220801223622.7fab1544@windsurf>
In-Reply-To: <20220730105534.645046-1-bernd.kuhls@t-online.de>
References: <20220730105534.645046-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659386184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g7Z5VhRBrHTKcYUxrmBgiB+QYscSSajOpz86leqUJxE=;
 b=DNkrVrogZPbwY+Keo6mrkq1LgHghBCzCCpoYYYVZXKBcfMi+uuwHdXlfrEMbIOjobtOfaR
 mFp6A+P12YPwqOGiuhpJCm2RBTymqojlXphwcy5cah/No5Sdj7BowOWOdzs7sTY/XLaCnH
 jaRewXqvdHSElUpDjk0IeslPRX0KogS1+3HutB7NJeLjlmRomMhOhIrshye03E8FRimSh/
 GgpPFfQLm/9MJCLz/2fn5yt7oZHG/t3JOzVja5BtZoyou8eXADONYnT4DCCNUykToFIWkd
 wB2O+sczUnNmshqUmOvp7Gjwis2pSfS693gWZWnCC7fwK5inX0j3kMBd5jQ+AQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DNkrVrog
Subject: Re: [Buildroot] [PATCH 1/1] package/tvheadend: fix build error with
 c++ disabled
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Jul 2022 12:55:34 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> The vp8 encoder depends on c++ support since commit
> 06a1a05b55aa64720d4ede9b07c385cc8f06625d
> 
> src/transcoding/codec/codecs/libs/libvpx.c:23:10: fatal error: vpx/vp8cx.h: No such file or directory
>    23 | #include <vpx/vp8cx.h>
> 
> Fixes:
> http://autobuild.buildroot.net/results/152/152dec2f7148a23fa1a434d2c6ad31de6d1b2466/
> http://autobuild.buildroot.net/results/009/0090b100eca4f94d2f0081ce0db7ff9b4ae0ca79/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tvheadend/Config.in    | 3 ++-
>  package/tvheadend/tvheadend.mk | 7 +++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
