Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B173C001B0
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 22:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD37940A67;
	Mon,  7 Aug 2023 22:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD37940A67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xZrLZFqnPsxK; Mon,  7 Aug 2023 22:11:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E16DE40491;
	Mon,  7 Aug 2023 22:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E16DE40491
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5DF481BF28E
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 22:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37B1081E82
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 22:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37B1081E82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WvxFKn0mgiBk for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 22:11:01 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A6DC81CAD
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 22:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A6DC81CAD
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7645E0008;
 Mon,  7 Aug 2023 22:10:58 +0000 (UTC)
Date: Tue, 8 Aug 2023 00:10:57 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230808001057.20ea85cd@windsurf>
In-Reply-To: <20230708173104.686175-1-dario.binacchi@amarulasolutions.com>
References: <20230708173104.686175-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691446259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kjGytPytW4MKa6WT/6FwahrHT+xY3J3VE7Jk1z70mjs=;
 b=Q/m3eE+ppf4u1JKrC5to/GVZoDNBPt7sC++Lzq1ORs0WF+yYnj/HXcvqwpUO0M+N9rFa0U
 /Engbt3IGj9m92saYWe/eX8Zdb94m1E9seBomLF+XWJNMUeQyJqonjCsvH73iSDbSN4LV7
 29PXHH5tVM9JfuGv4DhFpivSxvydpULM7jSAAGbb8WfCUs2fvniN0TMPvWtQR1gENSOUpL
 eIhohC8i7Pr1VPMO4ArIWCjo7zWy3jiz4bOZXma7ppQMFcz8vbS1vXRHpofH4WDBUHkgDQ
 6wqyI1D8wPsxB62E09zHmThsOAQ/VzRVGdBUKajn4qCznJCg9ZB7D/3uOb3kRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q/m3eE+p
Subject: Re: [Buildroot] [PATCH v2 1/1]
 configs/imx8mn_bsh_smm_s2[_pro]_defconfig: explicitly set binutils version
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
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat,  8 Jul 2023 19:31:04 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> The commit fb50eab8a5e6b ("package/binutils: switch to 2.39.x as the
> default version") raised the error reported by Gitlab CI.
> 
> I tried to bump arm-trusted-firmware to the version that fixes the issue
> against binutils version 2.39, but the subsequent board update was
> unsuccessful. Therefore, for now, it is better not to change the version of
> binutils to ensure the proper compilation of the image.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996179
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4603996181
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

This has normally been fixed in a better way by commit:

  https://gitlab.com/buildroot.org/buildroot/-/commit/7b774048be6292bb61f90759ad3b7b58a33a1650

Could you check if it is working fine now?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
