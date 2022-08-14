Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEE6C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1002160BAA;
	Sun, 14 Aug 2022 10:18:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1002160BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AeaEym5eltRa; Sun, 14 Aug 2022 10:18:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BC9E60AF1;
	Sun, 14 Aug 2022 10:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BC9E60AF1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7DFBA1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 573D74192F
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 573D74192F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oDaUoOIW8NSI for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:18:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0161F41732
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0161F41732
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:17:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A270C20002;
 Sun, 14 Aug 2022 10:17:57 +0000 (UTC)
Date: Sun, 14 Aug 2022 12:17:56 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220814121756.5827d311@windsurf>
In-Reply-To: <20220812130526.99002-1-fontaine.fabrice@gmail.com>
References: <20220812130526.99002-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660472278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KDGHFbNJL/mtFTTxAka/0VJ7fFhAKYPYIbdpC7UtDKk=;
 b=jA5crSP5eO7YHZXGUuc/RZRad2Md+RXrK+ZNDydJYO+djl3m15Z2lhQDcr+eQXwo14wgns
 7mVzdFO5FIWkWJcUqH4RlM3TIiNQHfBg9Anwj5yCjndtSSBEJl5xOushSHjGB2EAYdAyGg
 4UmkX1Jdhr645W9NNbQPoTuct/vm535Km6geSRW6Qpc1L92BP5uJ7yCR3X8Mky03nmq+OE
 eiCeUiciEiv86rdrPRxDmZQ5ito3OL47rgij64i340Qr9aGBcD35qcr8pscaaRH/MSG+Q/
 VXSq3pPr4fJxG4d4/DRVBzt3GewXoCwFs1g9ZIWlXDza3G5jW5ppVcYxox3VoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jA5crSP5
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-mediadriver: fix build
 with libexecinfo
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>,
 Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Aug 2022 15:05:26 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with libexecinfo raised since bump to
> version 22.4.3 in commit dd1c8879c503a093b807ea8ab04c31f685e7b340:
> 
> /home/giuliobenetti/autobuild/run/instance-2/output-1/build/intel-mediadriver-22.5.1/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp:2481: undefined reference to `backtrace'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3316e39c5113bb7600374eda45497a87c9ac9873
>  - http://autobuild.buildroot.org/results/1074e832dd2f67e6fea8ff1fc7e226245a4d51bd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-Fix-build-with-libexecinfo.patch     | 43 +++++++++++++++++++
>  .../intel-mediadriver/intel-mediadriver.mk    |  4 ++
>  2 files changed, 47 insertions(+)
>  create mode 100644 package/intel-mediadriver/0002-Fix-build-with-libexecinfo.patch

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
