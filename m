Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32507C433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 21:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF02D40922;
	Sun, 30 Jan 2022 21:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lx0uVLpEd-Tg; Sun, 30 Jan 2022 21:56:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 106E5410AF;
	Sun, 30 Jan 2022 21:56:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF2181BF3E3
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 21:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACB3A40102
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 21:56:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4lQdq0Hd3evR for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 21:56:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A87340004
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 21:56:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 404061BF205;
 Sun, 30 Jan 2022 21:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643579758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sk1P5p/J+XQ4H6AQnN096h9HlfG7weg6mfHLcWsjtac=;
 b=JZl+zlPAUxhwXXYdI3j6Nunv7cFYd+c/a8QEfvMr3b/hYvyujFZso0bEq868UwPrCX5pcW
 Y1neLzJ5EYIzGJR9RpTQ7O1an59EnGDq6s8n/tPJJcy5Rq7NA63YA03/XdlhsWDxuVNmtm
 GCUHnndOh2CzcmyRrqOeDTkTPHRNd/jR2JlUQRlGWVXQhDtgdPGmwbk0DomGSKWwvRTJaI
 6mNIBusFiIO5l84HhJi2epYOh8/EFH0g6K6ZnZTSD1C40i9gFvn6ExEb39J/4gdtDDTeVm
 zqYRH0op9kzuxsF4gHV2SuFir4TTDb+zY/9cHHIrwFyCt5b+qBKjbCAaXuL7/A==
Date: Sun, 30 Jan 2022 22:55:57 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220130225557.00733a9b@windsurf>
In-Reply-To: <20220129183426.152177-1-giulio.benetti@benettiengineering.com>
References: <20220129183426.152177-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/apitrace: fix build failure on m68k
 architecture
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
Cc: =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 29 Jan 2022 19:34:26 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> apitrace uses very big switch statements, which causes the build to fail
> on m68k, because the offsets there are only 16-bit.
> 
> We fix that by using -mlong-jump-table-offsets on m68k, to use 32-bit
> offsets for switch statements. That flag is available on gcc version >= 7
> but apitrace package already depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7, so
> we can use it with no problem.
> 
> Fixes:
> http://autobuild.buildroot.net/results/7306bf05962fec30fbe98b1eb8ee09b3162b8080/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/apitrace/apitrace.mk | 5 +++++
>  1 file changed, 5 insertions(+)

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
