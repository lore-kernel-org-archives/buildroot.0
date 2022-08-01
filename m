Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75516C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 20:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C38481409;
	Mon,  1 Aug 2022 20:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C38481409
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ty29ZxUM3Ib2; Mon,  1 Aug 2022 20:35:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37C02813C2;
	Mon,  1 Aug 2022 20:35:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37C02813C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C6CF1BF25B
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5A2E813C2
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5A2E813C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2mpSTYpdI9GJ for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 20:35:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96D06813BB
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96D06813BB
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 20:35:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1F94D60002;
 Mon,  1 Aug 2022 20:35:19 +0000 (UTC)
Date: Mon, 1 Aug 2022 22:35:18 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220801223518.0e89cea6@windsurf>
In-Reply-To: <20220725192035.27119-1-fontaine.fabrice@gmail.com>
References: <20220725192035.27119-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659386120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VvDMu2I09YtTHhOlRCCaRjsAwJJsXM5TWKtdSHIow88=;
 b=LuIUgrk3gX1vvEEQRDR257OJSV3CfyZ3oNSUm5IR1axF+SzZh7tKUUdN5biJ4eLFu0yxn8
 aaUtayYNuakz9bUT4mrEzdlebsAxuOXc5oTQMGVetBOv2t+HzDjYPQCSo2RWEER0hCGh9l
 PsxPf/ptHSR7zlHbCjxa0E6ruTWtuBLzI1Xzz6/4V6QeD3zantGfHldtAQ0/NJtLhybQXK
 tUTMYPAlh85/n51hohNXlpbNtDt/g9KrxiJ46VBCw41L9o3AS6Wcekp5G0x1e/lJ1gvvqx
 hAXNUo1Vd5n+tFEKSwFOM2y35dV5A2TGGhL8lp2pQoqdnkiX481RbIhwsxD3wg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LuIUgrk3
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/dump1090: bump to version 7.2
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

On Mon, 25 Jul 2022 21:20:35 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch to active fork as https://github.com/mutability/dump1090, a
>   fork of https://github.com/MalcolmRobb/dump1090 is no longer
>   maintained
> - Update license to GPL-2.0+:
>   https://github.com/flightaware/dump1090/commit/e02a2cdd44eae33173bc86fe4043eb6ff4f05b6f
> - Drop patch (not needed thanks to
>   https://github.com/flightaware/dump1090/commit/0793c64ee8ebbcea86b7a9dc71c7e28ec08db618)
> - librtlsdr is now optional
> - hackrf is a new optional dependency
> - disable CPUFeatures
> - ncurses is mandatory since
>   https://github.com/flightaware/dump1090/commit/f6b1b94c7dca1b407b8e4f02ef3206e3ca3ad28f
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Fix patch number

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
