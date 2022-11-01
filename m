Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927D0C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C8C840613;
	Tue,  1 Nov 2022 20:44:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C8C840613
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gYEtpssEnRKl; Tue,  1 Nov 2022 20:44:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C30640608;
	Tue,  1 Nov 2022 20:44:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C30640608
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 733281BF834
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B19640608
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:44:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B19640608
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bH8qvtulER2b for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:44:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BBB740503
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BBB740503
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 20:44:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0595D240003;
 Tue,  1 Nov 2022 20:44:29 +0000 (UTC)
Date: Tue, 1 Nov 2022 21:44:28 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221101214428.4a027d9b@windsurf>
In-Reply-To: <20221101173702.2167372-1-bernd.kuhls@t-online.de>
References: <20221101173702.2167372-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667335470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PFHII8I0pFw7adBLtqb6CapxLF+mTMUjNxZ8kJu08I4=;
 b=RTsvibE1xsaVfBra2WrSKfS4i3NBYvLsu5qaMairy86dEaOY70UsN6W94maNO5+io97kjA
 HXJffon3uF2Ag62fiWkv7mtDRkl899rIx5JlsJucBnSx+A2MZYPuyBtsEFKxVlYzP2J0vE
 R09Q/uVzLU9XwyM1mI0Xw8gzPOh/UeloF4EZITHD7oSHtNSE3AjxkhYCQsWKrQFwRrWsHr
 GL5R0zVlrLIzFDHk70Z6iszcQDug3+wllnG54j1v8BX5iFMIu6KCPkBf6+fKn9tVdv1rdG
 QPj414Az5UA3leaTlyay/LyjHfAPeWr9in2K54n/F5yj7Bg8aoQzlwYDBknaYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RTsvibE1
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-mediadriver: add more
 options to disable Gen9/11/12 support
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

On Tue,  1 Nov 2022 18:37:02 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Gen10 was disabled by default upstream as it was never shipped:
> https://github.com/intel/media-driver/commit/0ad37351305be5c5e7c622833f9d7093fb2639cc
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/intel-mediadriver/Config.in            | 18 ++++++++++++++++++
>  package/intel-mediadriver/intel-mediadriver.mk | 18 ++++++++++++++++++
>  2 files changed, 36 insertions(+)

Thanks but this patch does not apply on master. I looked in patchwork
if there was another patch pending for intel-mediadriver, but I
couldn't find any. Could you rebase on master and resend?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
