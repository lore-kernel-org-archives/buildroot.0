Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29F8C25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 09:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E4D4813A6;
	Sat, 20 Aug 2022 09:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E4D4813A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oCmZpoiBf0vC; Sat, 20 Aug 2022 09:30:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AE518141C;
	Sat, 20 Aug 2022 09:30:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AE518141C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B59991BF2C5
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 09:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F63E41909
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 09:30:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F63E41909
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id idYCiRhZW3v2 for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 09:30:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE2FE4091F
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE2FE4091F
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 09:30:08 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ED258240007;
 Sat, 20 Aug 2022 09:30:03 +0000 (UTC)
Date: Sat, 20 Aug 2022 11:30:03 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220820113003.5119a5d7@windsurf>
In-Reply-To: <20220814211911.3231098-1-yann.morin.1998@free.fr>
References: <20220814211911.3231098-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660987805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZmD7i/PjOLSI3wXaLGljWXg33d7v1UcXcak6JzUJp4=;
 b=CFD++sR2qU7HByjzFkJExsvDp5sk4kcPFRBxtthoCCJS8zcsFkSD2L4Fej1L+5Pgq9oiFZ
 PvOAeyadXV+NAwq3UpYfEbQc7ANxcE+p9Cc33yR0sUXHKSkKgAKKRVJBdBIcbOiTUEO45G
 mw64iOOBshu0fOc00NAuC1VxmftMAUxPbhvd+rhNp+sVquwqxtnuzdVpuKZgPZeHsb1otk
 TBNjF88jMTahC/2qR7SNoW1xJUAlkXwDjlMXdGYUoLxJvbNx7TVttxziDMSrGSf+P4DMcG
 caP9vK3bcGl54AlkA5guwWmDzLn88uucw0UrPdlbgu5lNdnr49etITdpwps9jQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CFD++sR2
Subject: Re: [Buildroot] [PATCH] scripts/autobuild-run: also fetch tags when
 updating buildroot sources
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 14 Aug 2022 23:19:11 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> The post recent tag is used by git-describe, and ends up in the header
> of the .Config file, so having up-to-date local tags helps in reviewing
> .config files when trying to reproduce autobuild failures.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  scripts/autobuild-run | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to buildroot-test, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
