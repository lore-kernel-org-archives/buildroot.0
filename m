Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB19C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 20:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBD934012B;
	Tue, 23 Aug 2022 20:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBD934012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1PC1EbP9On46; Tue, 23 Aug 2022 20:31:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCF73409F8;
	Tue, 23 Aug 2022 20:30:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCF73409F8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A9831BF5A8
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C34C40880
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:30:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C34C40880
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i3WLiPXeWOCg for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 20:30:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC6B24069B
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC6B24069B
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 20:30:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7F7CD240008;
 Tue, 23 Aug 2022 20:30:52 +0000 (UTC)
Date: Tue, 23 Aug 2022 22:30:51 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220823223051.205e6d8f@windsurf>
In-Reply-To: <20220817154633.127418-1-bernd.kuhls@t-online.de>
References: <20220817154633.127418-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661286653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YoHp6vQ/fI2VcRBAZe0jag1xvYf+wAHERue4Sj6F35w=;
 b=UR4CBwtIRDSLo5XQot7AyO7+n0JQm14KBzV7btSF/CiuS/mehwEvVEBHWlNRFN+s0cnQsE
 9BtPyzAz6wGkQs3E8ZgRUYTa2sI9P7tZ31etk4UpgrtglauohCWuCbqz0Sncyg7cbjdV0K
 DtSPk32ZeWyBP/hLWumwpXCAGdoMJPa2jq9d2AfgSPhXe1sFWItIUQT05uaIH/LoAfZ4yd
 Dl2x4DeS8niw1wsL9yrPmDOPDdGrTg5CwS+XR0KNCN+Fqd7xTMaz+YxoMcez+nt6WKqml3
 0EtHuAsMvmXtpcw7gvA0KZgo4bJG82oyT8/c3cfPbEapbeU2QVA22pCvhg2Bgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UR4CBwtI
Subject: Re: [Buildroot] [PATCH/next 1/2] package/intel-mediadriver: bump
 version to 22.5.2
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 17 Aug 2022 17:46:32 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/intel-mediadriver/intel-mediadriver.hash | 2 +-
>  package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
